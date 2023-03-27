import 'package:app/app/shared/models/country_model.dart';
import 'package:app/app/shared/services/firebase_service.dart';
import 'package:get/get.dart';

class CountriesController extends GetxController {
  final FirebaseService _firestoreService = FirebaseService();

  final RxList<CountryModel> countries = <CountryModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadCountries();
  }

  void loadCountries() async {
    final List<CountryModel>? result = await _firestoreService.getCountries();
    if (result != null) {
      countries.value = result;
    }
  }
}
