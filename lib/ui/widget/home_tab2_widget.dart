import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kkb_flutter/controller/home_controller.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeTab2Widget extends GetView<HomeController> {
  const HomeTab2Widget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Obx(() {
            return Container(
              height: controller.tab2TopHeight,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              alignment: Alignment.centerLeft,
              child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 200),
                  opacity: controller.tab2TopHeight < 35? 0.0 : 1.0,
                  child: const Text('상품/서비스', style: TextStyle(fontSize: 26, fontFamily: 'Day', fontWeight: FontWeight.bold))
              ),
            );
          }),
          Obx(() {
            return AbsorbPointer(
              absorbing: controller.topScrollMove? true : false,
              child: TabBar(
                padding: const EdgeInsets.only(left: 6, right: 55),
                controller: controller.itemTabController,
                labelColor: Colors.black,
                labelStyle: const TextStyle(fontSize: 13, fontFamily: 'Noto', fontWeight: FontWeight.bold),
                unselectedLabelColor: Colors.grey,
                indicatorColor: Colors.black,
                indicatorWeight: 2,
                indicatorSize: TabBarIndicatorSize.label,
                labelPadding: const EdgeInsets.symmetric(horizontal: 10),
                // indicatorPadding: EdgeInsets.symmetric(horizontal: 16),
                tabs: const [
                  Tab(text: '전체'),
                  Tab(text: '예적금',),
                  Tab(text: '대출'),
                  Tab(text: '서비스',),
                  Tab(text: '제휴',),
                  Tab(text: 'mini',),
                ],
              ),
            );
          }),
          Expanded(
              child: Stack(
                children: [
                  ListView(
                    controller: controller.tab2ScrollController,
                    children: [
                      const SizedBox(height: 10,),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 14),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Container(
                            height: 300,
                            color: const Color(0xfffdec6c),
                            child: Stack(
                              children: [
                                PageView(
                                  controller: controller.itemPageController,
                                  children: [
                                    Container(
                                      color: const Color(0xfffdec6c),
                                      child: Stack(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: const [
                                                Text('캐시백 프로모션 시즌10', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Color(0xffd56c16)),),
                                                SizedBox(height: 10,),
                                                Text('일상의 설레는 혜택', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),),
                                                SizedBox(height: 3,),
                                                Text('카카오뱅크', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),),
                                                SizedBox(height: 3,),
                                                Text('체크카드', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            alignment: Alignment.bottomRight,
                                            child: const Image(
                                              height: 220,
                                              image: AssetImage('assets/images/item_1.png'),),
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      color: const Color(0xfff16165),
                                      child: Stack(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: const [
                                                Text('인사이드 스토리', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Color(0xfffaa666)),),
                                                SizedBox(height: 10,),
                                                Text('카카오뱅크', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),),
                                                SizedBox(height: 3,),
                                                Text('주택담보대출', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),),
                                                SizedBox(height: 3,),
                                                Text('챗봇이 되다', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 8),
                                            alignment: Alignment.bottomRight,
                                            child: const Image(
                                              height: 160,
                                              image: AssetImage('assets/images/item_2.png'),),
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      color: const Color(0xff146c28),
                                      child: Stack(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: const [
                                                Text('머니 트렌드', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Color(0xffb1d197)),),
                                                SizedBox(height: 10,),
                                                Text('사람들은 왜', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),),
                                                SizedBox(height: 3,),
                                                Text('갑자기 식물에', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),),
                                                SizedBox(height: 3,),
                                                Text('열광할까?', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 8),
                                            alignment: Alignment.bottomRight,
                                            child: const Image(
                                              height: 160,
                                              image: AssetImage('assets/images/item_3.png'),),
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      color: const Color(0xffef5a74),
                                      child: Stack(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: const [
                                                Text('제휴 신용카드 4월 이벤트', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Color(0xff912a3a)),),
                                                SizedBox(height: 10,),
                                                Text('카카오뱅크', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),),
                                                SizedBox(height: 3,),
                                                Text('신한카드', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),),
                                                SizedBox(height: 3,),
                                                Text('13만원 현금 증정', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            padding: const EdgeInsets.only(right: 30, bottom: 130),
                                            alignment: Alignment.bottomRight,
                                            child: const Image(
                                              height: 60,
                                              image: AssetImage('assets/images/item_5.png'),),
                                          ),
                                          Container(
                                            padding: const EdgeInsets.only(right: 120, bottom: 10),
                                            alignment: Alignment.bottomRight,
                                            child: const Image(
                                              height: 80,
                                              image: AssetImage('assets/images/item_5.png'),),
                                          ),
                                          Container(
                                            padding: const EdgeInsets.only(left: 40, bottom: 35),
                                            alignment: Alignment.bottomLeft,
                                            child: const Image(
                                              height: 50,
                                              image: AssetImage('assets/images/item_5.png'),),
                                          ),
                                          Container(
                                            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
                                            alignment: Alignment.bottomRight,
                                            child: const Image(
                                              height: 80,
                                              image: AssetImage('assets/images/item_4.png'),),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  padding: const EdgeInsets.all(25),
                                  alignment: Alignment.topRight,
                                  child: SmoothPageIndicator(
                                    controller: controller.itemPageController,  // PageController
                                    count: 4,
                                    effect: WormEffect(
                                        spacing: 8.0,
                                        radius: 16.0,
                                        dotWidth: 8.0,
                                        dotHeight: 8.0,
                                        dotColor: Colors.white.withOpacity(0.4),
                                        paintStyle: PaintingStyle.fill,
                                        strokeWidth: 1,
                                        activeDotColor: Colors.white
                                    ),  // your preferred effect
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 60,),
                      itemFirstWidget('예금·적금'),
                      itemWidget('입출금통장', '까다로운 계좌개설도 손쉽게', titleType: null, interestType: null, interestColor: true, interestLate: '0.10', month: null),
                      itemLine(),
                      itemWidget('모임통장', '함께쓰고 같이봐요', titleType: null, interestType: null, interestColor: true, interestLate: '0.10', month: null),
                      itemLine(),
                      itemWidget('세이프박스', '여유자금을 따로 보관하세요', titleType: null, interestType: null, interestColor: true, interestLate: '1.10', month: null),
                      itemLine(),
                      itemWidget('저금통', '매일매일 조금씩 쌓여요', titleType: null, interestType: null, interestColor: true, interestLate: '3.00', month: null),
                      itemLine(),
                      itemWidget('정기예금', '실시간 이자가 쌓여요', titleType: null, interestType: null, interestColor: true, interestLate: '2.00', month: '12'),
                      itemLine(),
                      Obx(() {
                        return itemWidget('자유적금', '매일/매주/매월 자유롭게', titleType: null, interestType: '최고', interestColor: true, interestLate: '2.40', month: '12', isGuide: true);
                      }),
                      itemLine(),
                      itemWidget('26주적금', '캐릭터와 함께 즐거운 도전', titleType: null, interestType: '최고', interestColor: true, interestLate: '2.50', month: '6'),
                      const SizedBox(height: 20,),
                      itemLastWidget(1, 0xff81dcb5, true, '자유적금', '주기도, 금액도 내맘대로 선택', 'item_6.png', 55),
                      const SizedBox(height: 60,),
                      itemFirstWidget('대출'),
                      Obx(() {
                        return itemWidget('비상금대출', '현금 필요할 때 유용하게', titleType: null, interestType: '최저', interestColor: false, interestLate: '4.63', month: null, isGuide: true);
                      }),
                      itemLine(),
                      itemWidget('마이너스 통장대출', '이자는 사용한 만큼만', titleType: null, interestType: '최저', interestColor: false, interestLate: '3.72', month: null),
                      itemLine(),
                      itemWidget('신용대출/중신용대출', '목돈이 필요할 땐 쉽고 빠르게', titleType: null, interestType: '최저', interestColor: false, interestLate: '3.68', month: null),
                      itemLine(),
                      itemWidget('개인사업자 대출', '사업자를 위한 1금융권 신용대출', titleType: null, interestType: '최저', interestColor: false, interestLate: '3.99', month: null),
                      itemLine(),
                      itemWidget('전월세보증금 대출', '사업자와 청년도 걱정없이', titleType: null, interestType: '최저', interestColor: false, interestLate: '2.61', month: null),
                      itemLine(),
                      itemWidget('주택담보대출', '챗봇과 함께 쉽고 편리하게', titleType: 'NEW', interestType: '최저', interestColor: false, interestLate: '3.01', month: null),
                      const SizedBox(height: 20,),
                      itemLastWidget(2, 0xff57a381, false, '비상금대출', '대출까지 평균 60초!', 'item_7.png', 45),
                      const SizedBox(height: 60,),
                      itemFirstWidget('서비스'),
                      itemWidget('내 신용정보', '내 신용정보를 안전하고 간편하게', titleType: null, interestType: null, interestColor: false, interestLate: null, month: null),
                      itemLine(),
                      itemWidget('해외송금 보내기', '해외계좌송금과 WU빠른해외송금', titleType: null, interestType: null, interestColor: false, interestLate: null, month: null),
                      itemLine(),
                      itemWidget('해외송금 받기', '지점방문 없이 간편하게', titleType: null, interestType: null, interestColor: false, interestLate: null, month: null),
                      itemLine(),
                      itemWidget('프렌즈 체크카드', '쓸 때마다 캐시백, 주말엔 2배', titleType: null, interestType: null, interestColor: false, interestLate: null, month: null),
                      const SizedBox(height: 20,),
                      Container(height: 18, color: const Color(0xfff5f5f5),),
                      const SizedBox(height: 60,),
                      itemFirstWidget('제휴서비스'),
                      itemWidget('해외주식 투자', '한국투자증권에서 제공하는 미니스탁 서비스', titleType: null, interestType: null, interestColor: false, interestLate: null, month: null),
                      itemLine(),
                      itemWidget('증권사 주식계좌', '간편하게 개설하는 증권사 계좌', titleType: 'UP', interestType: null, interestColor: false, interestLate: null, month: null),
                      itemLine(),
                      itemWidget('제휴 신용카드', '신청은 간편하게 혜택은 다양하게', titleType: null, interestType: null, interestColor: false, interestLate: null, month: null),
                      const SizedBox(height: 20,),
                      itemLastWidget(3, 0xff57a381, false, '해외주식투자', '테슬라, 스타벅스 천원부터', 'item_8.png', 60),
                      const SizedBox(height: 60,),
                      itemFirstWidget('mini'),
                      itemWidget('카카오뱅크 mini', '10대부터 만들고 용돈을 편하게', titleType: null, interestType: null, interestColor: false, interestLate: null, month: null),
                      itemLine(),
                      itemWidget('mini카드', '결제도 ATM도 교통비도 카드 하나로', titleType: null, interestType: null, interestColor: false, interestLate: null, month: null),
                      itemLine(),
                      itemWidget('mini 26일저금', '1,000원씩 차곡차곡', titleType: null, interestType: null, interestColor: false, interestLate: null, month: null),
                      const SizedBox(height: 120,),
                    ],
                  ),
                  Obx(() {
                    return controller.tab2TopHeight < 80? Container(
                      height: 0.2,
                      color: Colors.black.withOpacity(0.3),
                    ) : Container();
                  })
                ],
              )
          ),
        ],
      ),
    );
  }

  Widget itemLine() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      height: 0.3,
      color: Colors.black.withOpacity(0.3),
    );
  }

  Widget itemWidget(String title, String content, {String? titleType, String? interestType, bool interestColor = false, String? interestLate, String? month, bool isGuide = false}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 900),
      color: isGuide? controller.itemFocus? Colors.grey.withOpacity(0.02) : Colors.white : Colors.white,
      child: TextButton(
        autofocus: isGuide? controller.itemFocus? true : false : false,
        style: TextButton.styleFrom(foregroundColor: Colors.black),
        onPressed: () {
          // controller.sampleView = true;
          // controller.sampleText = title;
        },
        child: Container(
          padding: EdgeInsets.only(left: 12, right: interestLate != null? 12 : 6, top: 15, bottom: 15),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      titleType != null? Container(
                        margin: const EdgeInsets.only(left: 4,top: 3),
                        padding: const EdgeInsets.only(left: 8, right: 7, top: 2, bottom: 2) ,
                        decoration: BoxDecoration(
                            color: const Color(0xfffa5249),
                            borderRadius: BorderRadius.circular(12)
                        ),
                        child: Text(titleType, style: const TextStyle(fontSize: 8, color: Colors.white, fontWeight: FontWeight.bold),),
                      ) : Container(),
                    ],
                  ),
                  const SizedBox(height: 6,),
                  Text(content, style: const TextStyle(fontSize: 12)),
                ],
              ),
              const Spacer(),
              interestLate != null? Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      interestType != null? Container(
                        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3) ,
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(12)
                        ),
                        child: Text(interestType, style: TextStyle(fontSize: 11, color: interestColor? const Color(0xff2a7b5f) : const Color(0xff4f6293), fontWeight: FontWeight.bold),),
                      ) : Container(),
                      const SizedBox(width: 8,),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 2),
                            child: Text('연', style: TextStyle(fontSize: 14, color: interestColor? const Color(0xff2a7b5f) : const Color(0xff4f6293), fontWeight: FontWeight.bold)),
                          ),
                          Text(' $interestLate%', style: TextStyle(fontSize: 14, color: interestColor? const Color(0xff2a7b5f) : const Color(0xff4f6293), fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ],
                  ),
                  month != null? Text('$month개월 기준', style: const TextStyle(fontSize: 12, color: Colors.grey)) : Container(),
                ],
              ) : const Icon(Icons.keyboard_arrow_right, color: Colors.grey,)
            ],
          ),
        ),
      ),
    );
  }

  Widget itemFirstWidget(String title) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      alignment: Alignment.centerLeft,
      child: Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
    );
  }

  Widget itemLastWidget(int type, int color, bool fontColor, String title, String content, String imageName, double imageWidth) {
    return InkWell(
      onTap: () {
        if (type == 1 || type == 2) {
          controller.tab2ScrollController.animateTo(controller.tab2PageHeight[type].toDouble(), duration: const Duration(seconds: 1), curve: Curves.ease);
          int count = 0;
          Timer.periodic(const Duration(milliseconds: 1000), (timer) {
            if (count == 2) {
              // controller.sampleText = type==1? '자유적금' : '비상금대출';
              // controller.sampleView = true;
            } else if (count > 2) {
              timer.cancel();
            } else {
              controller.itemFocus = !controller.itemFocus;
            }
            count++;
          });
        } else if (type == 3) {
          controller.tabController.index = 3;
          Future.delayed(const Duration(milliseconds: 600), () {
            controller.tab4ScrollController.animateTo(1560, duration: const Duration(seconds: 1), curve: Curves.ease);
          });
          Future.delayed(const Duration(milliseconds: 1000), () {
            int count = 0;
            Timer.periodic(const Duration(milliseconds: 1000), (timer) {
              if (count == 2) {
                // controller.sampleText = '해외주식 투자';
                // controller.sampleView = true;
              } else if (count > 2) {
                timer.cancel();
              } else {
                controller.itemFocus = !controller.itemFocus;
              }
              count++;
            });
          });
        }

      },
      child: Container(
        margin: const EdgeInsets.all(20),
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
        decoration: BoxDecoration(
            color: Color(color),
            borderRadius: BorderRadius.circular(12)
        ),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(fontSize: 10, color: fontColor? Colors.black : Colors.white),),
                const SizedBox(height: 5,),
                Text(content, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: fontColor? Colors.black : Colors.white),),
              ],
            ),
            const Spacer(),
            Image(image: AssetImage('assets/images/$imageName'), width: imageWidth,)
          ],
        ),
      ),
    );
  }

}
