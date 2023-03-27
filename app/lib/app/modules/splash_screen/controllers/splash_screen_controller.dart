import 'package:app/app/routes/app_pages.dart';
import 'package:get/get.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() async {
    await _redirect();
    super.onInit();
  }

  Future<void> _redirect() async {
    await Future.delayed(const Duration(milliseconds: 700));
    Get.offAllNamed(AppPages.countries);
  }
}
