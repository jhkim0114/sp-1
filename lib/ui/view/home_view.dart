import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kkb_flutter/controller/home_controller.dart';
import 'package:kkb_flutter/ui/theme/app_colors.dart';
import 'package:kkb_flutter/ui/view/dev_mode_view.dart';
import 'package:kkb_flutter/ui/view/goods_view.dart';
import 'package:kkb_flutter/ui/view/login_view.dart';
import 'package:kkb_flutter/ui/view/push_view.dart';
import 'package:kkb_flutter/ui/view/transfer_view.dart';
import 'package:kkb_flutter/ui/widget/home_tab1_widget.dart';
import 'package:kkb_flutter/ui/widget/home_tab2_widget.dart';
import 'package:kkb_flutter/ui/widget/home_tab3_widget.dart';
import 'package:kkb_flutter/ui/widget/home_tab4_widget.dart';
import 'package:kkb_flutter/ui/widget/notification_bar_widget.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          alignment: Alignment.center,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Obx(() => AnimatedContainer(
                curve: Curves.ease,
                duration: const Duration(milliseconds: 1500),
                width: controller.selectDeviceSizeWidth.toDouble(),
                height: controller.selectDeviceSizeHeight.toDouble(),
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.black.withOpacity(0.1))
                ),
                child: Stack(
                  children: [
                    MaterialApp(
                      debugShowCheckedModeBanner: false,
                      theme: ThemeData(
                        primaryColor: const Color(0xff2e344d),
                        fontFamily: 'Noto',
                      ),
                      home: Scaffold(
                        body: Stack(
                          children: [
                            Column(
                              children: [
                                const NotificationBarWidget(),
                                Expanded(
                                  child: DefaultTabController(
                                    length: 4,
                                    child: Scaffold(
                                      bottomNavigationBar: TabBar(
                                        controller: controller.tabController,
                                        tabs: [
                                          Tab(icon: AnimatedIcon(
                                            icon: AnimatedIcons.home_menu,
                                            progress: controller.tab1AnimationController,
                                            color: controller.tabIndex == 0? tabColorBlack : tabColorGrey,
                                            size: 29,
                                          )),
                                          Tab(icon: AnimatedIcon(
                                            icon: AnimatedIcons.view_list,
                                            progress: controller.tab2AnimationController,
                                            color: controller.tabIndex == 1? tabColorBlack : tabColorGrey,
                                            size: 29,
                                          )),
                                          // Tab(icon: Icon(Icons.person, color: controller.tabIndex == 0? tabColorBlack : tabColorGrey, size: 29,),),
                                          // Tab(icon: Icon(Icons.grid_view, color: controller.tabIndex == 1? tabColorBlack : tabColorGrey, size: 29,),),
                                          Tab(icon: Icon(Icons.notifications, color: controller.tabIndex == 2? tabColorBlack : tabColorGrey, size: 29,),),
                                          Tab(icon: Icon(Icons.more_horiz, color: controller.tabIndex == 3? tabColorBlack : tabColorGrey, size: 29,),),
                                        ],
                                        indicatorColor: Colors.transparent,
                                      ),
                                      body: TabBarView(
                                        controller: controller.tabController,
                                        children: const [
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
                            controller.transferView? const TransferView() : Container(),
                            const GoodsView(),
                            const LoginView(),
                            controller.kkbProgress? const Center(child: CircularProgressIndicator(),) : const SizedBox.shrink(),
                          ],
                        ),
                      ),
                    ),
                    const PushView()
                  ],
                )
              )),
              Obx(() => controller.devModeView? const DevModeView() : Container())
            ],
          ),
        ),
    );
  }

}
