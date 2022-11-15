import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kkb_flutter/controller/main_controller.dart';

class DevModeView extends GetView<HomeController> {
  const DevModeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      color: Colors.blue,
      width: 200,
      height: 800,
      alignment: Alignment.topLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('dev mode'),
          Obx(() {
            return Checkbox(value: controller.notificationBar, onChanged: (isChecked) {
              controller.notificationBar = isChecked;
            });
          })
        ],
      ),
    );
  }
}
