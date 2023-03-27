import 'package:app/app/modules/coutries/bindings/countries_binding.dart';
import 'package:app/app/modules/coutries/routes/countries_routes.dart';
import 'package:app/app/modules/coutries/views/cities_view.dart';
import 'package:app/app/modules/coutries/views/countries_view.dart';
import 'package:app/app/modules/splash_screen/bindings/splash_screen_binding.dart';
import 'package:app/app/modules/splash_screen/views/splash_screen_view.dart';
import 'package:get/get.dart';
part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.splash;
  static const countries = Routes.countries;
  static const countriesList = Routes.countries + Routes.countriesList;
  static const cities = Routes.countries + Routes.cities;

  static final routes = [
    GetPage(
      name: Routes.splash,
      page: () => const SplashScreenView(),
      bindings: [SplashScreenBinding()],
      preventDuplicates: true,
      transition: Transition.cupertino,
    ),
    GetPage(
      name: Routes.countries,
      page: () => const CountriesRoutes(),
      bindings: [CountriesBinding()],
      preventDuplicates: true,
      children: [
        GetPage(
          name: Routes.countriesList,
          page: () => const CountriesView(),
          transition: Transition.cupertino,
        ),
        GetPage(
          name: Routes.cities,
          page: () => const CitiesView(),
          transition: Transition.cupertino,
        ),
      ],
    ),
  ];
}
