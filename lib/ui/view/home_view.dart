import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kkb_flutter/controller/home_controller.dart';
import 'package:kkb_flutter/ui/theme/app_colors.dart';
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
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 400,
                height: 800,
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.black.withOpacity(0.1))
                ),
                child: Stack(
                  children: [
                    Column(
                      children: [
                        const NotificationBarWidget(),
                        Expanded(
                          child: DefaultTabController(
                            length: 4,
                            child: Scaffold(
                              bottomNavigationBar: Obx(() {
                                return TabBar(
                                  controller: controller.tabController,
                                  tabs: [
                                    Tab(icon: Icon(Icons.person, color: controller.tabIndex == 0? tabColorBlack : tabColorGrey, size: 29,),),
                                    Tab(icon: Icon(Icons.grid_view, color: controller.tabIndex == 1? tabColorBlack : tabColorGrey, size: 29,),),
                                    Tab(icon: Icon(Icons.notifications, color: controller.tabIndex == 2? tabColorBlack : tabColorGrey, size: 29,),),
                                    Tab(icon: Icon(Icons.more_horiz, color: controller.tabIndex == 3? tabColorBlack : tabColorGrey, size: 29,),),
                                  ],
                                  indicatorColor: Colors.transparent,
                                );
                              }),
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
                    Obx(() => controller.kkbProgress? const Center(child: CircularProgressIndicator(),) : const SizedBox.shrink())
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
