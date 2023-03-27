import 'package:app/app/modules/splash_screen/controllers/splash_screen_controller.dart';
import 'package:get/get.dart';

class SplashScreenBinding extends Binding {
  @override
  List<Bind> dependencies() {
    return [
      Bind.put<SplashScreenController>(SplashScreenController()),
    ];
  }
}
