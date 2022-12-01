import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/home_controller.dart';


class GoodsView extends GetView<HomeController> {
  const GoodsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return AnimatedPositioned(
        curve: Curves.ease,
        duration: const Duration(milliseconds: 300),
        right: 0,
        left: 0,
        top: controller.goodsView? (controller.notificationBar? 26: 0)
            : controller.selectDeviceSizeHeight.toDouble(),
        bottom: controller.goodsView? 0 : -controller.selectDeviceSizeHeight.toDouble(),
        child: Container(
          // color: const Color(0xff2e344d),
          color: Colors.white,
          child: Column(
            children: [
              Container(
                height: 80,
                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                child: Row(
                  children: [
                    // IconButton(onPressed: () {
                    //   controller.sampleView = false;
                    // }, icon: Icon(Icons.arrow_back, size: 22,)),
                    SizedBox(
                      width: 60,
                      child: RawMaterialButton(
                        onPressed: () {
                          controller.goodsView = false;
                        },
                        shape: const CircleBorder(),
                        child: const Padding(
                          padding: EdgeInsets.all(15.0),
                          child: Icon(Icons.arrow_back),
                        ),
                      ),
                    ),
                    const SizedBox(width: 2,),
                    Text(controller.goodsText, style: const TextStyle(fontSize: 26, fontFamily: 'Day')),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(bottom: 140),
                  alignment: Alignment.center,
                  // child: Text('empty', style: TextStyle(fontSize: 16, fontFamily: 'Jua'),),
                  child: const Image(
                    image: AssetImage('assets/images/goods.gif'),
                    height: 120,
                  ),
                ),
              )
            ],
          ),
          ),
        );
    });

  }

}