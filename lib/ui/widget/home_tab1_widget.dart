import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kkb_flutter/controller/home_controller.dart';
import 'package:kkb_flutter/ui/theme/app_colors.dart';
import 'package:kkb_flutter/util/util.dart';

class HomeTab1Widget extends GetView<HomeController> {
  const HomeTab1Widget({super.key});

  @override
  Widget build(BuildContext context) {
    if (controller.init) {
      controller.init = false;
      controller.userContext = context;
    }
    return Container(
      color: colorDeepBlue,
      child: Column(
        children: [
          Obx(() => SizedBox(
            height: controller.tab1TopHeight,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  const SizedBox(width: 6,),
                  Text(controller.userName, style: TextStyle(fontSize: controller.tab1TopTextSize, color: Colors.white, fontFamily: 'Day')),
                  const SizedBox(width: 6,),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: const Color(0xff252a3e),
                        borderRadius: BorderRadius.circular(12)
                    ),
                    child: const Text('내  계좌', style: TextStyle(fontSize: 8, color: Colors.white, fontWeight: FontWeight.bold),),
                  ),
                  const Spacer(),
                  Container(
                    width: controller.tab1TopImageSize,
                    height: controller.tab1TopImageSize,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            fit: BoxFit.fitWidth,
                            image: AssetImage('assets/images/jiho.jpg')
                        )
                    ),
                  ),
                  const SizedBox(width: 6,),
                ],
              ),
            ),
          )),
          Expanded(
              child: Stack(
                children: [
                  ListView(
                    controller: controller.tab1ScrollController,
                    padding: const EdgeInsets.symmetric(horizontal: 14),
                    children: [
                      const SizedBox(height: 10,),
                      Obx(() => itemWidget(context, 0xffd9e6ec, '${controller.userName}의 통장 ⭐️️', controller.user1Money, 1)),
                      const SizedBox(height: 12,),
                      itemBoxWidget(true),
                      const SizedBox(height: 12,),
                      itemBoxWidget(false),
                      const SizedBox(height: 12,),
                      Obx(() => itemWidget(context, 0xfffbb9c0, '가족통장 👨‍👩‍👧‍👦', controller.user2Money, 2)),
                      const SizedBox(height: 12,),
                      Obx(() => itemWidget(context, 0xffffe300, '데이트통장 💕️️', controller.user3Money, 3)),
                      const SizedBox(height: 12,),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(12)
                        ),
                        child: Icon(Icons.add, color: Colors.grey.withOpacity(0.8), size: 28),
                      ),
                      const SizedBox(height: 35,),
                      Container(
                        alignment: Alignment.center,
                        child: const Text('화면 편집', style: TextStyle(color: Colors.grey, fontSize: 12),),
                      ),
                      const SizedBox(height: 60,),
                      itemLastWidget('대출까지 평균 60초', '최대 300만원까지 대출 가능한 비상금대출', 'item_20.png', 45),
                      const SizedBox(height: 40,),
                    ],
                  ),
                  Obx(() => controller.tab1TopHeight < 80? Container(
                    height: 0.2,
                    color: Colors.black.withOpacity(0.3),
                  ) : Container())
                ],
              )
          )
        ],
      ),
    );
  }

  Widget itemWidget(BuildContext context, int color, String title, int money, int type) {
    return SizedBox(
      height: 220,
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 10, bottom: 18),
            decoration: BoxDecoration(
                color: Color(color),
                borderRadius: BorderRadius.circular(12)
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),),
                          Text('3333-0$type-1234567', style: TextStyle(fontSize: 10, color: Colors.grey.withOpacity(0.8)),),
                        ],
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 12, right: 2),
                      child: IconButton(onPressed: () {  }, icon: const Icon(Icons.more_vert, color: Colors.grey, size: 18,)),
                    )
                  ],
                ),
                SizedBox(height: type != 1? 6 : 26,),
                Column(
                  children: [
                    Text('${Util.numberFormat(money)}원', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),),
                    type != 1? Container(
                      alignment: Alignment.center,
                      child: Stack(
                        children: [
                          itemPhotoWidget('jiho.jpg', 0, 0),
                          itemPhotoWidget(type == 2? 'user_1.jpg' : 'user_2.jpg', 25, 0),
                          type == 2? itemPhotoWidget('user_3.jpg', 50, 0) : Wrap(),
                          type == 2? itemPhotoWidget('user_4.jpg', 75, 0) : Wrap(),
                        ],
                      ),
                    ) : Container()
                  ],
                ),
                SizedBox(height: type != 1? 33 : 53,),
                Container(
                  width: 0.3,
                  height: 20,
                  color: Colors.grey,
                )
              ],
            ),
          ),
          Container(
            alignment: Alignment.bottomLeft,
            transform: Matrix4.translationValues(-10.0, 62.0, 0.0),
            child: RawMaterialButton(
              onPressed: () {
                // selectPopup(context, type);
              },
              shape: const CircleBorder(),
              child: const Padding(
                padding: EdgeInsets.all(90.0),
                child: Text('이체', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14),),
              ),
            ),
          ),
          Container(
            alignment: Alignment.bottomRight,
            transform: Matrix4.translationValues(35.0, 62.0, 0.0),
            child: RawMaterialButton(
              onPressed: () {
                controller.goodsText = '카드이용내역';
                controller.goodsView = true;
              },
              shape: const CircleBorder(),
              child: const Padding(
                padding: EdgeInsets.all(90.0),
                child: Text('카드이용내역', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14),),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget itemLastWidget(String title, String content, String imageName, double imageWidth) {
    return TextButton(
      style: TextButton.styleFrom(foregroundColor: Colors.black),
      onPressed: () {

      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12)
        ),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontSize: 16, color: Colors.white),),
                const SizedBox(height: 5,),
                Text(content, style: const TextStyle(fontSize: 12, color: Colors.grey),),
              ],
            ),
            const Spacer(),
            Image(image: AssetImage('assets/images/$imageName'), width: imageWidth,)
          ],
        ),
      ),
    );
  }

  Widget itemBoxWidget(bool boxType) {
    return boxType? Container(
      decoration: BoxDecoration(
          color: const Color(0xffd9e6ec),
          borderRadius: BorderRadius.circular(12)
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 14, bottom: 8),
        child: Column(
          children: [
            Row(
              children: const [
                Text('세이프박스', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),),
                Spacer(),
                Text('0원', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),)
              ],
            ),
            Container(
                margin: const EdgeInsets.only(top: 16, bottom: 4),
                width: double.infinity,
                height: 0.1,
                color: Colors.black54
            ),
            Row(
              children: const [
                Text('저금통', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),),
                Spacer(),
                Padding(
                  padding: EdgeInsets.only(top: 4),
                  child: Image(
                    width: 36,
                    height: 36,
                    image: AssetImage('assets/images/dog_icon.png'),),
                )
              ],
            ),
          ],
        ),
      ),
    ) : Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12)
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 2),
              child: Row(
                children: [
                  const Text('다른 금융계좌', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),),
                  const Spacer(),
                  IconButton(onPressed: () {  }, icon: const Icon(Icons.more_vert, color: Colors.grey, size: 18,),)
                ],
              ),
            ),
            const SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Container(
                    width: 30,
                    height: 30,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage('assets/images/kb_icon.jpg'
                            )
                        )
                    ),
                  ),
                  const SizedBox(width: 10,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('KB Star*t통장', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10, color: Colors.grey)),
                      Text('0원', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),),
                    ],
                  ),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(12)
                    ),
                    child: const Text('이체', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              width: double.infinity,
              height: 0.1,
              color: Colors.black54,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Container(
                    width: 30,
                    height: 30,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage('assets/images/nh_icon.jpg'
                            )
                        )
                    ),
                  ),
                  const SizedBox(width: 10,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('NH20해봄통장(비대면)', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10, color: Colors.grey)),
                      Text('0원', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),),
                    ],
                  ),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(12)
                    ),
                    child: const Text('이체', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15,),
          ],
        ),
      ),
    );
  }

  Widget itemPhotoWidget(String image, double left, double right) {
    return Container(
        margin: EdgeInsets.only(top: 12, left: left, right: right),
        width: 28,
        height: 28,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/$image')))
    );
  }

}

