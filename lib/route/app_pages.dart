import 'package:get/get.dart';
import 'package:kkb_flutter/ui/view/ground_view.dart';
import 'package:kkb_flutter/ui/view/home_view.dart';
import 'package:kkb_flutter/binding/home_binding.dart';
part './app_routes.dart';

class AppPages {
  static final pages = [
    /// dev
    GetPage(name: Routes.ground, page: () => GroundView(), binding: HomeBinding()),

    /// release
    GetPage(name: Routes.home, page: () => HomeView(), binding: HomeBinding()),
  ];
}