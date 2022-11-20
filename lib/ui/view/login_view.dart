import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kkb_flutter/controller/home_controller.dart';
import 'package:kkb_flutter/ui/theme/app_colors.dart';

class LoginView extends GetView<HomeController>{

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return IgnorePointer(
        ignoring: controller.loginView? false : true,
        child: AnimatedOpacity(
          duration: Duration(milliseconds: 300),
          opacity: controller.loginView? 1.0 : 0.0,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            color: colorYellow,
            child: Column(
              children: [
                SizedBox(height: 150,),
                Image(
                    width: 50,
                    image: AssetImage('assets/images/kkb_icon.png')
                ),
                Spacer(),
                Container(
                    width: 280,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Colors.black.withOpacity(0.1),
                    ),
                    child: TextButton(
                        style: TextButton.styleFrom(primary: Colors.black),
                        onPressed: () {
                          controller.kkbProgress = true;
                          Future.delayed(Duration(milliseconds: 1000), () {
                            controller.kkbProgress = false;
                          });
                          Future.delayed(Duration(milliseconds: 1300), () {
                            controller.loginView = false;
                          });
                        }, child: Text('로그인', style: TextStyle(color: Colors.black, fontFamily: 'Noto', fontSize: 13, fontWeight: FontWeight.bold),))
                ),
                SizedBox(height: 100,)
              ],
            ),
          ),
        ),
      );
    });
  }

}