import 'package:get/get.dart';
import 'package:sp_1/ui/view/ground_view.dart';
import 'package:sp_1/ui/view/home_view.dart';
import 'package:sp_1/binding/home_binding.dart';
part './app_routes.dart';

class AppPages {
  static final pages = [
    /// dev
    GetPage(name: Routes.ground, page: () => GroundView(), binding: HomeBinding()),

    /// release
    GetPage(name: Routes.home, page: () => HomeView(), binding: HomeBinding()),
  ];
}