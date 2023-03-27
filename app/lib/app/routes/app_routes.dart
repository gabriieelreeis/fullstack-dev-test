part of 'app_pages.dart';

abstract class Routes {
  Routes._();

  static const splash = _Paths.splash;
  static const countries = _Paths.countries;
  static const countriesList = _Paths.countriesList;
  static const cities = _Paths.cities;
}

abstract class _Paths {
  static const splash = '/splash';
  static const countries = '/countries';
  static const countriesList = '/list';
  static const cities = '/cities';
}
