import '../controllers/regisController.dart';
import 'package:get/get.dart';

class RegisBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisController>(
      () => RegisController(),
    );
  }
}
