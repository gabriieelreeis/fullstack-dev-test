import 'package:app/app/modules/coutries/controllers/cities_controller.dart';
import 'package:app/app/modules/coutries/controllers/countries_controller.dart';
import 'package:app/app/shared/services/firebase_service.dart';
import 'package:app/app/shared/services/loading_service.dart';
import 'package:get/get.dart';

class CountriesBinding extends Binding {
  @override
  List<Bind> dependencies() {
    return [
      Bind.lazyPut<LoadingService>(() => LoadingService()),
      Bind.lazyPut<FirebaseService>(() => FirebaseService()),
      Bind.lazyPut<CitiesController>(() => CitiesController()),
      Bind.lazyPut<CountriesController>(() => CountriesController()),
    ];
  }
}
