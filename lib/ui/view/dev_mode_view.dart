import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kkb_flutter/controller/main_controller.dart';

class DevModeView extends GetView<HomeController> {
  const DevModeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30),
      width: 200,
      height: 800,
      alignment: Alignment.topLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(left: 6, bottom: 10),
            child: Text('dev mode')
          ),
          Row(
            children: [
              Obx(() {
                return Checkbox(value: controller.notificationBar, onChanged: (isChecked) {
                  controller.notificationBar = isChecked;
                });
              }),
              Text('notificationBar')
            ],
          )
        ],
      ),
    );
  }
}
