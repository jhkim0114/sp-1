import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sp_1/app_scroll_behavior.dart';
import 'package:sp_1/route/app_pages.dart';
import 'package:sp_1/ui/theme/app_theme.dart';

void main() {
  runApp(GetMaterialApp(
    initialRoute: Routes.home,
    debugShowCheckedModeBanner: false,
    theme: appThemeData,
    scrollBehavior: AppScrollBehavior(),
    defaultTransition: Transition.fade,
    getPages: AppPages.pages,
  ));
}

