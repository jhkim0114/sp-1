import 'package:get/get.dart';
import 'package:sp_1/controller/main_controller.dart';

class HomeBinding implements Bindings {

  @override
  void dependencies() {
    Get.put<HomeController>(HomeController());
  }

}