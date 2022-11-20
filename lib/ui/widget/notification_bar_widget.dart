import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kkb_flutter/controller/home_controller.dart';
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
            notificationIcon(Icons.five_g),
            notificationIcon(Icons.bluetooth),
            notificationIcon(Icons.access_alarm),
            const SizedBox(width: 2,),
            notificationIcon(Icons.volume_off),
            const SizedBox(width: 2,),
            notificationIcon(Icons.wifi),
            notificationIcon(Icons.signal_cellular_alt),
            notificationIcon(Icons.battery_charging_full),
          ],
        ),
      ) : Container();
    });
  }

  Icon notificationIcon(IconData icon) {
    return Icon(icon, size: 16, color: Colors.white);
  }

}
