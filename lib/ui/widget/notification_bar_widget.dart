import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kkb_flutter/controller/main_controller.dart';
import 'package:timer_builder/timer_builder.dart';
import 'package:date_format/date_format.dart';

class NotificationBarWidget extends GetView<HomeController> {
  const NotificationBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return controller.notificationBar? Container(
        height: 26,
        padding: const EdgeInsets.only(left: 12, right: 6),
        color: const Color(0xff2e344d),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TimerBuilder.periodic(
              const Duration(minutes: 1),
              builder: (context) {
                return Text('SKT ${formatDate(DateTime.now(), [h, ':', nn])}',
                  style: const TextStyle(color: Colors.white),
                );
              },
            ),
            const Spacer(),
            const Icon(Icons.five_g, size: 16, color: Colors.white,),
            const Icon(Icons.bluetooth, size: 16, color: Colors.white,),
            const Icon(Icons.access_alarm, size: 14, color: Colors.white,),
            const SizedBox(width: 2,),
            const Icon(Icons.volume_off, size: 16, color: Colors.white,),
            const SizedBox(width: 2,),
            const Icon(Icons.wifi, size: 16, color: Colors.white,),
            const Icon(Icons.signal_cellular_alt, size: 16, color: Colors.white,),
            const Icon(Icons.battery_charging_full, size: 16, color: Colors.white,),
          ],
        ),
      ) : Container();
    });
  }

}
