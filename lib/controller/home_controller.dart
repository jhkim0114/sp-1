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
  late TabController topTabController;
  late TabController itemTabController;
  late PageController itemPageController;

  /// 화면 크기
  List<int> deviceSize = [400, 500, 600, 700, 800, 900, 1000];
  final _selectDeviceSize = [400.obs, 800.obs];
  get selectDeviceSizeWidth => _selectDeviceSize[0].value;
  get selectDeviceSizeHeight => _selectDeviceSize[1].value;
  set selectDeviceSizeWidth(value) => _selectDeviceSize[0].value = value;
  set selectDeviceSizeHeight(value) => _selectDeviceSize[1].value = value;

  /// 로그인 뷰
  final _loginView = false.obs;
  get loginView => _loginView.value;
  set loginView(value) => _loginView.value = value;

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
  final _userMoney = [0.obs, 0.obs, 0.obs];
  get user1Money => _userMoney[0].value;
  get user2Money => _userMoney[1].value;
  get user3Money => _userMoney[2].value;
  set user1Money(value) => _userMoney[0].value = value;
  set user2Money(value) => _userMoney[1].value = value;
  set user3Money(value) => _userMoney[2].value = value;

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

  @override
  void onInit() {
    tabController = TabController(length: 4, vsync: this, initialIndex: 0);
    textEditingController = TextEditingController();
    topTabController = TabController(length: 4, vsync: this, initialIndex: 0);
    tab1ScrollController = ScrollController();
    tab2ScrollController = ScrollController();
    tab3ScrollController = ScrollController();
    tab4ScrollController = ScrollController();
    itemTabController = TabController(length: 6, vsync: this, initialIndex: 0);
    itemPageController = PageController(initialPage: 0);

    tabController.addListener(() {
      _tabIndex.value = tabController.index;
    });

    textEditingController.addListener(() {
      userName = textEditingController.text;
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

    topTabController.addListener(() {
      topTabIndex = topTabController.index;
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
    tabController.dispose();
    textEditingController.dispose();
    tab1ScrollController.dispose();
    tab2ScrollController.dispose();
    tab3ScrollController.dispose();
    tab4ScrollController.dispose();
    topTabController.dispose();
    itemTabController.dispose();
    itemPageController.dispose();

    super.dispose();
  }

}