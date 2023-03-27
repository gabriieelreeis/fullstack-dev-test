import 'package:get/get.dart';

class LoadingService extends GetxService {
  final _isLoading = false.obs;
   bool get isLoading => _isLoading.value;

  @override
  void onDelete() {
    super.onDelete();
    _isLoading.value = false;
  }

  void changeLoading() {
    _isLoading.value = !_isLoading.value;
  }
}
