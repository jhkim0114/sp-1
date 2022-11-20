import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kkb_flutter/common/constants.dart';
import 'package:kkb_flutter/controller/home_controller.dart';
import 'package:kkb_flutter/util/util.dart';

class DevModeView extends GetView<HomeController> {
  const DevModeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30),
      width: 300,
      height: 800,
      alignment: Alignment.topLeft,
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.black.withOpacity(0.1))
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(child: Text('dev mode')),
          /// 디바이스 사이즈
          Row(
            children: [
              const Text('width: '),
              Obx(() => SizedBox(
                child: DropdownButton<int>(
                  value: controller.selectDeviceSizeWidth,
                  onChanged: (int? value) {
                    controller.selectDeviceSizeWidth = value;
                  },
                  items: controller.deviceSize.map<DropdownMenuItem<int>>((int value) {
                    return DropdownMenuItem<int>(
                      value: value,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Text(value.toString()),
                      ),
                    );
                  }).toList(),
                ),
              )),
              const Spacer(),
              const Text('height: '),
              Obx(() => SizedBox(
                child: DropdownButton<int>(
                  value: controller.selectDeviceSizeHeight,
                  onChanged: (int? value) {
                    controller.selectDeviceSizeHeight = value;
                  },
                  items: controller.deviceSize.map<DropdownMenuItem<int>>((int value) {
                    return DropdownMenuItem<int>(
                      value: value,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Text(value.toString()),
                      ),
                    );
                  }).toList(),
                ),
              )),
            ],
          ),
          /// 이름 설정
          SizedBox(
            width: 230,
            child: TextField(
              maxLength: 10,
              controller: controller.textEditingController,
              decoration: const InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.only(left: 5, top: 15, bottom: 10, right: 5)

              ),
            ),
          ),
          /// 로그인 뷰 설정
          Row(
            children: [
              Obx(() =>
                  Checkbox(
                      value: controller.loginView,
                      onChanged: (isChecked) {
                        controller.loginView = isChecked;
                      })),
              const Text('loginView')
            ],
          ),
          /// 알림 바 설정
          Row(
            children: [
              Obx(() =>
                  Checkbox(
                      value: controller.notificationBar,
                      onChanged: (isChecked) {
                        controller.notificationBar = isChecked;
                      })),
              const Text('notificationBar')
            ],
          ),
          /// 프로그래스바 설정
          Row(
            children: [
              Obx(() =>
                  Checkbox(
                      value: controller.kkbProgress,
                      onChanged: (isChecked) {
                        controller.kkbProgress = isChecked;
                      })),
              const Text('kkbProgress')
            ],
          ),
          /// 충전금액 설정
          Obx(() => SizedBox(
            width: 230,
            child: DropdownButton<int>(
              value: controller.selectChargeAmount,
              onChanged: (int? value) {
                controller.selectChargeAmount = value;
              },
              items: controller.chargeAmount.map<DropdownMenuItem<int>>((int value) {
                return DropdownMenuItem<int>(
                  value: value,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5,right: 120),
                    child: Text(Util.numberFormat(value)),
                  ),
                );
              }).toList(),
            ),
          )),
          /// 충전금액 설정 버튼
          Row(
            children: [
              ElevatedButton(onPressed: () {
                if (controller.user1Money < Constants.maxMoney) {
                  controller.user1Money = controller.user1Money + controller.selectChargeAmount;
                  if (controller.user1Money > Constants.maxMoney) {
                    controller.user1Money = Constants.maxMoney;
                  }
                }
              }, child: const Text('충전')),
              ElevatedButton(onPressed: () {
                if (controller.user1Money < Constants.maxMoney) {
                  controller.user1Money = controller.user1Money * 2;
                  if (controller.user1Money > Constants.maxMoney) {
                    controller.user1Money = Constants.maxMoney;
                  }
                }
              }, child: const Text('x2')),
              ElevatedButton(onPressed: () {
                controller.user1Money = 0;
              }, child: const Text('0')),
              ElevatedButton(onPressed: () {
                controller.user1Money = Constants.maxMoney;
              }, child: const Text('max'))
            ],
          ),
        ],
      ),
    );
  }
}
