import 'package:app/app/shared/models/city_model.dart';
import 'package:app/app/shared/services/firebase_service.dart';
import 'package:get/get.dart';

class CitiesController extends GetxController {
  final FirebaseService _firestoreService = FirebaseService();

  final RxList<CityModel> cities = <CityModel>[].obs;

  void loadCities(String countryId) async {
    final List<CityModel>? result =
        await _firestoreService.getCitiesByCountryId(countryId);
    if (result != null) {
      cities.value = result;
    }
  }
}
