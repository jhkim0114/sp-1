import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController with GetTickerProviderStateMixin{

  late TabController tabController;

  final _tabIndex = 0.obs;
  get tabIndex => _tabIndex.value;

  @override
  void onInit() {
    tabController = TabController(length: 4, vsync: this, initialIndex: 0);
    tabController.addListener(() {
      _tabIndex.value = tabController.index;
    });
    super.onInit();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }




}