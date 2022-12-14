import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kkb_flutter/common/constants.dart';

class HomeController extends GetxController with GetTickerProviderStateMixin{

  late TabController tabController;
  late TextEditingController textEditingController;
  late ScrollController tab1ScrollController;
  late ScrollController tab2ScrollController;
  late ScrollController tab3ScrollController;
  late ScrollController tab4ScrollController;
  late TabController itemTabController;
  late PageController itemPageController;
  late AnimationController tab1AnimationController;
  late AnimationController tab2AnimationController;

  /// 로그인 뷰
  final _loginView = true.obs;
  get loginView => _loginView.value;
  set loginView(value) => _loginView.value = value;

  /// 상품 뷰
  final _goodsView = false.obs;
  get goodsView => _goodsView.value;
  set goodsView(value) => _goodsView.value = value;

  /// 이체 뷰
  final _transferView = false.obs;
  get transferView => _transferView.value;
  set transferView(value) => _transferView.value = value;

  /// 개발모드 뷰
  final _devModeView = false.obs;
  get devModeView => _devModeView.value;
  set devModeView(value) => _devModeView.value = value;

  /// 푸시 뷰
  final _pushView = false.obs;
  get pushView => _pushView.value;
  set pushView(value) => _pushView.value = value;

  /// 화면 크기
  List<int> deviceSize = [400, 500, 600, 700, 800, 900, 1000];
  final _selectDeviceSize = [400.obs, 800.obs];
  get selectDeviceSizeWidth => _selectDeviceSize[0].value;
  get selectDeviceSizeHeight => _selectDeviceSize[1].value;
  set selectDeviceSizeWidth(value) => _selectDeviceSize[0].value = value;
  set selectDeviceSizeHeight(value) => _selectDeviceSize[1].value = value;

  /// 탭 index
  final _tabIndex = 0.obs;
  get tabIndex => _tabIndex.value;

  /// 프로그래스바
  final _kkbProgress = false.obs;
  get kkbProgress => _kkbProgress.value;
  set kkbProgress(value) => _kkbProgress.value = value;

  /// 알림바
  final _notificationBar = true.obs;
  get notificationBar => _notificationBar.value;
  set notificationBar(value) => _notificationBar.value = value;

  /// 이름
  final _userName = ''.obs;
  get userName => _userName.value;
  set userName(value) => _userName.value = value;

  /// 상단 높이
  final _topHeight = [80.0.obs, 80.0.obs, 80.0.obs, 80.0.obs];
  get tab1TopHeight => _topHeight[0].value;
  get tab2TopHeight => _topHeight[1].value;
  get tab3TopHeight => _topHeight[2].value;
  get tab4TopHeight => _topHeight[3].value;
  set tab1TopHeight(value) => _topHeight[0].value = value.toDouble();
  set tab2TopHeight(value) => _topHeight[1].value = value.toDouble();
  set tab3TopHeight(value) => _topHeight[2].value = value.toDouble();
  set tab4TopHeight(value) => _topHeight[3].value = value.toDouble();

  /// 상단 이름 크기
  final _topTextSize = [26.0.obs, 26.0.obs, 26.0.obs, 26.0.obs];
  get tab1TopTextSize => _topTextSize[0].value;
  get tab2TopTextSize => _topTextSize[1].value;
  get tab3TopTextSize => _topTextSize[2].value;
  get tab4TopTextSize => _topTextSize[3].value;
  set tab1TopTextSize(value) => _topTextSize[0].value = value.toDouble();
  set tab2TopTextSize(value) => _topTextSize[1].value = value.toDouble();
  set tab3TopTextSize(value) => _topTextSize[2].value = value.toDouble();
  set tab4TopTextSize(value) => _topTextSize[3].value = value.toDouble();

  /// 탭1 상단 이미지 크기
  final _topImageSize = 46.0.obs;
  get tab1TopImageSize => _topImageSize.value;
  set tab1TopImageSize(value) => _topImageSize.value = value.toDouble();

  /// 계좌금액
  final _userMoney = [0.obs, 0.obs, 0.obs, 0.obs, 0.obs];
  get user1Money => _userMoney[0].value;
  get user2Money => _userMoney[1].value;
  get user3Money => _userMoney[2].value;
  set user1Money(value) => _userMoney[0].value = value;
  set user2Money(value) => _userMoney[1].value = value;
  set user3Money(value) => _userMoney[2].value = value;
  get userMoneySend => _userMoney[3].value;
  get userMoneyPush => _userMoney[4].value;
  set userMoneySend(value) => _userMoney[3].value = value;
  set userMoneyPush(value) => _userMoney[4].value = value;

  /// 충전금액 설정
  List<int> chargeAmount = [1000, 10000, 100000, 1000000];
  final _selectChargeAmount = 1000.obs;
  get selectChargeAmount => _selectChargeAmount.value;
  set selectChargeAmount(value) => _selectChargeAmount.value = value;

  /// 상단 스크롤 이동
  final _topScrollMove = false.obs;
  get topScrollMove => _topScrollMove.value;
  set topScrollMove(value) => _topScrollMove.value = value;

  /// 상단탭 index
  final _topTabIndex = 0.obs;
  get topTabIndex => _topTabIndex.value;
  set topTabIndex(value) => _topTabIndex.value = value;

  var topItemPage = 0;
  var topItemChanging = false;
  var tab2PageHeight = [0, 350, 1140, 1870, 2330, 2500];

  /// 아이템 포커스
  final _itemFocus = false.obs;
  get itemFocus => _itemFocus.value;
  set itemFocus(value) => _itemFocus.value = value;

  /// 상품 뷰 텍스트
  final _goodsText = ''.obs;
  get goodsText => _goodsText.value;
  set goodsText(value) => _goodsText.value = value;

  /// 계좌 이체
  final _moneyText = false.obs;
  get moneyText => _moneyText.value;
  set moneyText(value) => _moneyText.value = value;

  final _isMoneyOver = false.obs;
  get isMoneyOver => _isMoneyOver.value;
  set isMoneyOver(value) => _isMoneyOver.value = value;

  final _isMoneySend = false.obs;
  get isMoneySend => _isMoneySend.value;
  set isMoneySend(value) => _isMoneySend.value = value;

  /// 계좌 이체 통장 선택
  List<String> selectAccountList = ['티거의 통장 ⭐', '가족통장 👨‍👩‍👧‍👦', '데이트통장 💕️️'];
  final _selectAccount = '티거의 통장 ⭐'.obs;
  get selectAccount => _selectAccount.value;
  set selectAccount(value) => _selectAccount.value = value;

  late BuildContext userContext;

  @override
  void onInit() {
    tab1AnimationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 1000));
    tab1AnimationController.forward();
    tab2AnimationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 1000));
    tabController = TabController(length: 4, vsync: this, initialIndex: 0);
    textEditingController = TextEditingController();
    tab1ScrollController = ScrollController();
    tab2ScrollController = ScrollController();
    tab3ScrollController = ScrollController();
    tab4ScrollController = ScrollController();
    itemTabController = TabController(length: 6, vsync: this, initialIndex: 0);
    itemPageController = PageController(initialPage: 0);

    tabController.addListener(() {
      _tabIndex.value = tabController.index;
      switch (_tabIndex.value) {
        case 0: {
          tab1AnimationController.forward();
          tab2AnimationController.reverse();
          break;
        }
        case 1: {
          tab1AnimationController.reverse();
          tab2AnimationController.forward();
          break;
        }
        default: {
          tab1AnimationController.reverse();
          tab2AnimationController.reverse();
          break;
        }
      }
    });

    textEditingController.addListener(() {
      userName = textEditingController.text;
      selectAccount = userName + '의 통장 ⭐';
      selectAccountList[0] = selectAccount;
    });
    textEditingController.text = Constants.userName;

    tab1ScrollController.addListener(() {
      final offset = tab1ScrollController.offset;

      if (80 - offset > 60) {
        tab1TopHeight = 80 - offset;
      } else {
        tab1TopHeight = 60;
      }

      if (tab1TopHeight >= 80) {
        tab1TopTextSize = 26;
        tab1TopImageSize = 46;
      } else if (tab1TopHeight >= 65) { // 70 ~ 79
        tab1TopTextSize = 26 - offset/3;
        tab1TopImageSize = 46 - offset/2;
      } else {
        tab1TopTextSize = 21;
        tab1TopImageSize = 38.5;
      }
    });

    tab2ScrollController.addListener(() {
      final offset = tab2ScrollController.offset.toInt();

      if (80 - offset > 0) {
        tab2TopHeight = 80 - offset;
      } else {
        tab2TopHeight = 0;
      }

      if (topScrollMove) return;

      if (offset <= tab2PageHeight[1]) {
        if (topItemPage != 0) {
          itemTabController.index = 0;
        }
      } else if (offset <= tab2PageHeight[2]) {
        if (topItemPage != 1) {
          itemTabController.index = 1;
        }
      } else if (offset <= tab2PageHeight[3]) {
        if (topItemPage != 2) {
          itemTabController.index = 2;
        }
      } else if (offset <= tab2PageHeight[4]) {
        if (topItemPage != 3) {
          itemTabController.index = 3;
        }
      } else if (offset <= tab2PageHeight[5]) {
        if (topItemPage != 4) {
          itemTabController.index = 4;
        }
      } else if (offset <= tab2PageHeight[5] + 500) {
        if (topItemPage != 5) {
          itemTabController.index = 5;
        }
      }
    });

    tab3ScrollController.addListener(() {
      final offset = tab3ScrollController.offset.toInt();
      if (80 - offset > 60) {
        tab3TopHeight = 80 - offset;
      } else {
        tab3TopHeight = 60;
      }

      if (tab3TopHeight >= 80) {
        tab3TopTextSize = 26;
      } else if (tab3TopHeight >= 65) { // 70 ~ 79
        tab3TopTextSize = 26 - offset/3;
      } else {
        tab3TopTextSize = 21;
      }
    });

    tab4ScrollController.addListener(() {
      final offset = tab4ScrollController.offset.toInt();
      if (80 - offset > 60) {
        tab4TopHeight = 80 - offset;
      } else {
        tab4TopHeight = 60;
      }

      if (tab4TopHeight >= 80) {
        tab4TopTextSize = 26;
      } else if (tab4TopHeight >= 65) { // 70 ~ 79
        tab4TopTextSize = 26 - offset/3;
      } else {
        tab4TopTextSize = 21;
      }
    });

    itemTabController.addListener(() {
      topItemPage = itemTabController.index;
      topItemChanging = itemTabController.indexIsChanging;
      if (topItemChanging && !topScrollMove) {
        topScrollMove = true;
        if (topItemPage == 0) {
          tab2ScrollController.animateTo(tab2PageHeight[0].toDouble(), duration: const Duration(seconds: 1), curve: Curves.ease).then((value) => topScrollMove = false);
        } else if (topItemPage == 1) {
          tab2ScrollController.animateTo(tab2PageHeight[1].toDouble(), duration: const Duration(seconds: 1), curve: Curves.ease).then((value) => topScrollMove = false);
        } else if (topItemPage == 2) {
          tab2ScrollController.animateTo(tab2PageHeight[2].toDouble(), duration: const Duration(seconds: 1), curve: Curves.ease).then((value) => topScrollMove = false);
        } else if (topItemPage == 3) {
          tab2ScrollController.animateTo(tab2PageHeight[3].toDouble(), duration: const Duration(seconds: 1), curve: Curves.ease).then((value) => topScrollMove = false);
        } else if (topItemPage == 4) {
          tab2ScrollController.animateTo(tab2PageHeight[4].toDouble(), duration: const Duration(seconds: 1), curve: Curves.ease).then((value) => topScrollMove = false);
        } else if (topItemPage == 5) {
          tab2ScrollController.animateTo(tab2PageHeight[5].toDouble(), duration: const Duration(seconds: 1), curve: Curves.ease).then((value) => topScrollMove = false);
        }
      }

    });
    super.onInit();
  }

  @override
  void dispose() {
    tab1AnimationController.dispose();
    tab2AnimationController.dispose();
    tabController.dispose();
    textEditingController.dispose();
    tab1ScrollController.dispose();
    tab2ScrollController.dispose();
    tab3ScrollController.dispose();
    tab4ScrollController.dispose();
    itemTabController.dispose();
    itemPageController.dispose();

    super.dispose();
  }

}