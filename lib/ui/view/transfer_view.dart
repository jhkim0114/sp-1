import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kkb_flutter/controller/home_controller.dart';
import 'package:kkb_flutter/ui/theme/app_colors.dart';
import 'package:kkb_flutter/util/util.dart';

class TransferView extends GetView<HomeController> {
  const TransferView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      selectPopup(1);
      controller.transferView = false;
    });
    return Container();
  }

  void selectPopup(int sendType) {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(30))
        ),
        context: controller.userContext,
        builder: (context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(top: 7),
                width: 40,
                height: 5,
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(12)
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20, bottom: 25, left: 24),
                alignment: Alignment.centerLeft,
                child: const Text('받는계좌 선택', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
              ),
              sendType != 1? itemSendWidget(context, '[${controller.userName}의 통장 ⭐️️] ${controller.userName}', '3333-01-1234567', sendType, 1) : Container(),
              sendType != 2? itemSendWidget(context, '[가족통장 👨‍👩‍👧‍👦]', '3333-02-1234567', sendType, 2) : Container(),
              sendType != 3? itemSendWidget(context, '[데이트통장 💕️️]', '3333-03-1234567', sendType, 3) : Container(),
              const SizedBox(height: 25,)
            ],
          );
        },
    );
  }

  Widget itemSendWidget(BuildContext context, String title, String account, int sendType, int receiveType) {
    return TextButton(
        style: TextButton.styleFrom(foregroundColor: Colors.black),
        onPressed: () {
          Navigator.pop(context);
          sendPopup(context, sendType, receiveType);
        },
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 45,
                    height: 45,
                    decoration: const BoxDecoration(
                      color: colorYellow,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const Image(
                    width: 20,
                    height: 20,
                    image: AssetImage('assets/images/kakaobank_icon_m.png'),
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 5, bottom: 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(fontSize: 14)),
                  const SizedBox(height: 2,),
                  Text('카카오뱅크 $account', style: const TextStyle(fontSize: 12, color: Colors.grey)),
                ],
              ),
            ),
          ],
        )
    );
  }

  void sendPopup(BuildContext context, int sendType, int receiveType) {
    var currentMoney = 0;
    switch (sendType) {
      case 1: currentMoney = controller.user1Money; break;
      case 2: currentMoney = controller.user2Money; break;
      case 3: currentMoney = controller.user3Money; break;
    }

    controller.userMoneySend = 0;
    controller.isMoneySend = false;
    controller.isMoneyOver = false;
    controller.moneyText = false;
    // controller.pushView = false;

    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(30))
        ),
        context: context,
        isScrollControlled: true,
        builder: (context) {
          return FractionallySizedBox(
            heightFactor: 0.9,
            child: Column(
              children: <Widget>[
                const SizedBox(height: 35,),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: 22,
                          height: 22,
                          decoration: const BoxDecoration(
                            color: colorYellow,
                            shape: BoxShape.circle,
                          ),
                        ),
                        const Image(
                          width: 12,
                          height: 12,
                          image: AssetImage('assets/images/kakaobank_icon_m.png'),
                        )
                      ],
                    ),
                    const SizedBox(width: 8,),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 4),
                      child: Text('${controller.userName} 3333-0$receiveType-1234567', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                    ),
                    const SizedBox(width: 4,),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 4),
                      child: Text('계좌로', style: TextStyle(fontSize: 16),),
                    ),
                  ],
                ),
                const SizedBox(height: 40,),
                Obx(() {
                  return SizedBox(
                    height: 125,
                    child: Column(
                      children: [
                        controller.moneyText? Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(Util.numberFormat(controller.userMoneySend), style: TextStyle(fontSize: 28, color: controller.isMoneyOver? Colors.red : Colors.black),),
                            const Text('원', style: TextStyle(fontSize: 28, color: Colors.black),),
                          ],
                        ) : const Text('보낼 금액', style: TextStyle(color: Colors.grey, fontSize: 28),),
                        const SizedBox(height: 20,),
                        controller.moneyText? Text(controller.isMoneyOver? '출금계좌 잔액을 초과하였습니다.' : moneyTransKo(), style: const TextStyle(color: Colors.grey, fontSize: 12),) : Container(
                          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                          decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(20)
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  Container(
                                    width: 22,
                                    height: 22,
                                    decoration: const BoxDecoration(
                                      color: colorYellow,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                  const Image(
                                    width: 12,
                                    height: 12,
                                    image: AssetImage('assets/images/kakaobank_icon_m.png'),
                                  )
                                ],
                              ),
                              const SizedBox(width: 5,),
                              const Padding(
                                padding: EdgeInsets.only(bottom: 2),
                                child: Text('출금가능금액 : ', style: TextStyle(fontSize: 12, color: Colors.grey),),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 2),
                                child: Text('${Util.numberFormat(currentMoney)}원', style: const TextStyle(fontSize: 12, decoration: TextDecoration.underline, fontWeight: FontWeight.bold),),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                }),
                Expanded(
                    child: SizedBox(
                      width: double.infinity,
                      child: Stack(
                        children: [
                          Container(
                            alignment: Alignment.topCenter,
                            child: SizedBox(
                              height: 250,
                              child: Stack(
                                children: [
                                  itemSendMoney(Alignment.topLeft, '1', currentMoney),
                                  itemSendMoney(Alignment.topCenter, '2', currentMoney),
                                  itemSendMoney(Alignment.topRight, '3', currentMoney),
                                  itemSendMoney(Alignment.bottomLeft, '4', currentMoney),
                                  itemSendMoney(Alignment.bottomCenter, '5', currentMoney),
                                  itemSendMoney(Alignment.bottomRight, '6', currentMoney),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.bottomCenter,
                            child: SizedBox(
                              height: 250,
                              child: Stack(
                                children: [
                                  itemSendMoney(Alignment.topLeft, '7', currentMoney),
                                  itemSendMoney(Alignment.topCenter, '8', currentMoney),
                                  itemSendMoney(Alignment.topRight, '9', currentMoney),
                                  Container(
                                      transform: Matrix4.translationValues(0.0, -9.0, 0.0),
                                      child: itemSendMoney(Alignment.bottomLeft, '00', currentMoney, padding: 58)
                                  ),
                                  itemSendMoney(Alignment.bottomCenter, '0', currentMoney),
                                  itemSendMoney(Alignment.bottomRight, '←', currentMoney),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                ),
                Obx(() {
                  return Container(
                    width: double.infinity,
                    height: 60,
                    color: controller.isMoneySend? colorYellow : Colors.grey.withOpacity(0.2),
                    child: TextButton(
                      style: TextButton.styleFrom(foregroundColor: Colors.black),
                      child: Text('다음', style: TextStyle(color: controller.isMoneySend? Colors.black : Colors.grey, fontSize: 16),),
                      onPressed: () {
                        if (!controller.isMoneySend) return;
                        Navigator.pop(context);

                        controller.kkbProgress = true;
                        Future.delayed(const Duration(milliseconds: 900), () {
                          controller.kkbProgress = false;
                        });
                        Future.delayed(const Duration(milliseconds: 1200), () {
                          var sendMoney = controller.userMoneySend;
                          controller.userMoneyPush = sendMoney;

                          switch (sendType) {
                            case 1: controller.user1Money -= sendMoney; break;
                            case 2: controller.user2Money -= sendMoney; break;
                            case 3: controller.user3Money -= sendMoney; break;
                          }

                          var receiveName = '';
                          switch (receiveType) {
                            case 1: controller.user1Money += sendMoney; receiveName = '${controller.userName}의 통장'; break;
                            case 2: controller.user2Money += sendMoney; receiveName = '가족통장'; break;
                            case 3: controller.user3Money += sendMoney; receiveName = '데이트통장'; break;
                          }
                          confirmPopup(receiveName, sendMoney);
                        });
                        Future.delayed(const Duration(milliseconds: 2200), () {
                          // controller.pushView = true;
                        });
                        Future.delayed(const Duration(milliseconds: 8000), () {
                          // controller.pushView = false;
                        });
                      },
                    ),
                  );
                })
              ],
            ),
          );
        }
    );
  }

  void confirmPopup(String receiveName, int sendMoney) {
    ScaffoldMessenger.of(controller.userContext).hideCurrentSnackBar();
    ScaffoldMessenger.of(controller.userContext).showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          content: Text('$receiveName으로 ${Util.numberFormat(sendMoney)}원을 이체하였습니다.', style: const TextStyle(fontFamily: 'Noto'),),
        )
    );

    showDialog(
        useRootNavigator: false,
        context: controller.userContext,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12)
            ),
            contentPadding: const EdgeInsets.only(bottom: 0),
            content: SizedBox(
              height: 250,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 25,),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(
                        color: colorYellow,
                        shape: BoxShape.circle
                    ),
                    child: const Icon(Icons.check, size: 28,),
                  ),
                  const SizedBox(height: 20,),
                  const Text('이체 완료', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                  const SizedBox(height: 15,),
                  Text('$receiveName으로', style: const TextStyle(fontSize: 14),),
                  Text('${Util.numberFormat(sendMoney)}원을 이체했습니다.', style: const TextStyle(fontSize: 14),),
                  const Spacer(),
                  Container(
                    decoration: const BoxDecoration(
                        color: colorYellow,
                        borderRadius: BorderRadius.vertical(bottom: Radius.circular(12))
                    ),
                    height: 50,
                    width: double.infinity,
                    child: TextButton(
                        style: TextButton.styleFrom(foregroundColor: Colors.black),
                        onPressed: () {

                          Navigator.pop(context);
                        }, child: const Text('확인')),
                  )
                ],
              ),
            ),
          );
        }
    );
  }

  Widget itemSendMoney(Alignment alignment, String text, int currentMoney, {double padding = 65}) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      alignment: alignment,
      child: RawMaterialButton(
        onPressed: () {
          switch (text) {
            case '1': { add(1); break; }
            case '2': { add(2); break; }
            case '3': { add(3); break; }
            case '4': { add(4); break; }
            case '5': { add(5); break; }
            case '6': { add(6); break; }
            case '7': { add(7); break; }
            case '8': { add(8); break; }
            case '9': { add(9); break; }
            case '00': { multiply(2); break; }
            case '0': { multiply(1); break; }
            case '←': { remove(); break; }
          }

          var money = controller.userMoneySend;
          if (currentMoney < money) {
            controller.isMoneyOver = true;
          } else {
            controller.isMoneyOver = false;
          }

          if (money != 0 && !controller.isMoneyOver) {
            controller.isMoneySend = true;
          } else {
            controller.isMoneySend = false;
          }

        },
        padding: EdgeInsets.all(padding),
        shape: const CircleBorder(),
        child: Text(text, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
      ),
    );
  }

  void add(int number) {
    controller.moneyText = true;
    var money = controller.userMoneySend;
    if (money.toString().length > 14) {

    } else if (money != 0) {
      money = money * 10 + number;
    } else {
      money = money + number;
    }
    controller.userMoneySend = money;
  }

  void multiply(int zero) {
    var money = controller.userMoneySend;
    if (money.toString().length > 14) {

    } else if (money == 0) {
      controller.moneyText = true;
    } else if (zero == 1) {
      money = money * 10;
    } else if (zero == 2) {
      if (money.toString().length > 14) {
        money = money * 10;
      } else {
        money = money * 100;
      }
    }
    controller.userMoneySend = money;
  }

  void remove() {
    var money = controller.userMoneySend;
    if (money == 0) {
      controller.moneyText = false;
    } else if (money.toString().length == 1) {
      money = 0;
    } else {
      money = money ~/ 10;
    }
    controller.userMoneySend = money;
  }

  String moneyTransKo() {
    var result = '';
    var money = controller.userMoneySend;
    var moneyLength = money.toString().length;
    var j;
    var e;
    var m;
    var w;
    if (moneyLength > 12) {
      j = money.toString().substring(0, moneyLength-12);
      e = money.toString().substring(moneyLength-12, moneyLength-8);
      m = money.toString().substring(moneyLength-8, moneyLength-4);
      w = money.toString().substring(moneyLength-4, moneyLength);
    } else if (moneyLength > 8) {
      e = money.toString().substring(0, moneyLength-8);
      m = money.toString().substring(moneyLength-8, moneyLength-4);
      w = money.toString().substring(moneyLength-4, moneyLength);
    } else if (moneyLength > 4) {
      m = money.toString().substring(0, moneyLength-4);
      w = money.toString().substring(moneyLength-4, moneyLength);
    } else {
      w = money.toString().substring(0, moneyLength);
    }

    if (j != null) {
      result += '${Util.numberFormat(j)}조';
    }
    if (e != null && e != '0000') {
      if (result.isNotEmpty) result += ' ';
      result += '${Util.numberFormat(e)}억';
    }
    if (m != null && m != '0000') {
      if (result.isNotEmpty) result += ' ';
      result += '${Util.numberFormat(m)}만';
    }
    if (w != null && w != '0000') {
      if (result.isNotEmpty) result += ' ';
      result += Util.numberFormat(w);
    }
    result += '원';

    return result;
  }

  String moneyFormat(dynamic number) {
    var result = '';
    var f = NumberFormat('###,###,###,###');
    if (number is String) {
      return f.format(int.parse(number));
    } else if (number is int) {
      return f.format(number);
    }
    return result;
  }
}
