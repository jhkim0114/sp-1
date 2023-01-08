import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kkb_flutter/controller/home_controller.dart';

class TestGuideView extends GetView<HomeController> {
  const TestGuideView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: controller.selectDeviceSizeHeight.toDouble(),
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.red.withOpacity(0.5))
      ),
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerRight,
            color: Colors.yellow,
            width: 100,
            height: 26,
            child: const Text('알림 영역'),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.centerRight,
              child: const Text('앱 화면 영역'),
            ),
          )
        ],
      ),
    );
  }
}
