import * as functions from "firebase-functions";
import * as admin from "firebase-admin";
import * as csv from "csv-parser";

admin.initializeApp();
const db = admin.firestore();

exports.processCSV = functions.https.onRequest(async (req, res) => {
  const bucketName = "gs://smash-br.appspot.com";
  const fileName = "world-cities.csv";

  const bucket = admin.storage().bucket(bucketName);
  const file = bucket.file(fileName);

  file
    .createReadStream()
    .pipe(csv())
    .on("data", async (row) => {
      const { country, name } = row;

      const countryId = country.replace("/", "-");
      const countryRef = db.collection("countries").doc(countryId);
      const countrySnapshot = await countryRef.get();

      if (!countrySnapshot.exists) {
        await countryRef.set({ name: country });
      }

      const cityRef = countryRef.collection("cities");
      const existingCityQuery = cityRef.where("name", "==", name);
      const existingCitySnapshot = await existingCityQuery.get();

      if (existingCitySnapshot.empty) {
        const cityDocRef = cityRef.doc();
        const cityBatch = db.batch();
        cityBatch.set(cityDocRef, { name });
        await cityBatch.commit();
      }
    })
    .on("end", async () => {
      res.send("Leitura do arquivo CSV concluída");
    });
});