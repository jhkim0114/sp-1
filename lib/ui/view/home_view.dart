import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kkb_flutter/controller/main_controller.dart';
import 'package:kkb_flutter/ui/theme/app_theme.dart';
import 'package:kkb_flutter/ui/view/dev_mode_view.dart';
import 'package:kkb_flutter/ui/widget/home_tab1_widget.dart';
import 'package:kkb_flutter/ui/widget/home_tab2_widget.dart';
import 'package:kkb_flutter/ui/widget/home_tab3_widget.dart';
import 'package:kkb_flutter/ui/widget/home_tab4_widget.dart';
import 'package:kkb_flutter/ui/widget/notification_bar_widget.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          alignment: Alignment.center,
          color: const Color(0xfff9f9f9),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 400,
                height: 800,
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.black.withOpacity(0.1))
                ),
                child: Column(
                  children: [
                    const NotificationBarWidget(),
                    Expanded(
                      child: DefaultTabController(
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
                      ),
                    ),
                  ],
                ),
              ),
              DevModeView()
            ],
          ),
        ),
    );
  }
}
