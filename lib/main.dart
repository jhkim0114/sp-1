import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kkb_flutter/util/app_scroll_behavior.dart';
import 'package:kkb_flutter/route/app_pages.dart';
import 'package:kkb_flutter/ui/theme/app_theme.dart';

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

