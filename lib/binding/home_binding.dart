import 'package:get/get.dart';
import 'package:kkb_flutter/controller/main_controller.dart';

class HomeBinding implements Bindings {

  @override
  void dependencies() {
    Get.put<HomeController>(HomeController());
  }

}