import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kkb_flutter/controller/main_controller.dart';
import 'package:kkb_flutter/ui/widget/home_tab1_widget.dart';
import 'package:kkb_flutter/ui/widget/home_tab2_widget.dart';
import 'package:kkb_flutter/ui/widget/home_tab3_widget.dart';
import 'package:kkb_flutter/ui/widget/home_tab4_widget.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        bottomNavigationBar: TabBar(
          controller: controller.tabController,
          tabs: [
            Tab(icon: Icon(Icons.person),),
            Tab(icon: Icon(Icons.person),),
            Tab(icon: Icon(Icons.person),),
            Tab(icon: Icon(Icons.person),),
          ],
        ),
        body: TabBarView(
          controller: controller.tabController,
          children: [
            HomeTab1Widget(),
            HomeTab2Widget(),
            HomeTab3Widget(),
            HomeTab4Widget(),
          ],
        ),
      ),
    );
  }
}
