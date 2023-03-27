import 'package:app/app/shared/models/city_model.dart';
import 'package:app/app/shared/models/country_model.dart';
import 'package:app/app/shared/services/loading_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class FirebaseService extends GetxService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final LoadingService _loadingService = Get.find<LoadingService>();

  Future<List<CountryModel>?> getCountries() async {
    _loadingService.changeLoading();
    try {
      final QuerySnapshot countriesSnapshot =
          await _firestore.collection('countries').get();
          
      _loadingService.changeLoading();
      return countriesSnapshot.docs
          .map((doc) => CountryModel(id: doc.id, name: doc['name']))
          .toList();
    } on FirebaseException catch (e) {
      _loadingService.changeLoading();
      print(e.message);
      return null;
    }
  }

  Future<List<CityModel>?> getCitiesByCountryId(String countryId) async {
    _loadingService.changeLoading();
    try {
      final QuerySnapshot citiesSnapshot = await _firestore
          .collection('countries')
          .doc(countryId)
          .collection('cities')
          .orderBy('name', descending: false)
          .get();

      _loadingService.changeLoading();

      return citiesSnapshot.docs
          .map((doc) => CityModel(id: doc.id, name: doc['name']))
          .toList();
    } on FirebaseException catch (e) {
      _loadingService.changeLoading();
      print(e.message);
      return null;
    }
  }
}
