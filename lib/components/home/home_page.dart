import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_park/components/home/app_bar.dart';
import 'package:smart_park/components/home/home_action_grid.dart';
import 'package:smart_park/components/home/home_body.dart';
import 'package:smart_park/dio/user_dao.dart';
import 'package:smart_park/event/event.dart';
import 'package:smart_park/event/home_action_event.dart';
import 'package:smart_park/redux/app_state.dart';
import 'package:smart_park/router/navigator_util.dart';
//import 'package:fluwx/fluwx.dart' as fluwx;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _hasInit = false;

  var _actionListener;

  UserDao _userDao;

  @override
  void initState() {
    super.initState();
//    fluwx.register('')
    _initActionTapListener();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _getAccountInfo();
  }

  @override
  void dispose() {
    _actionListener.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_hasInit) {
      ScreenUtil.instance = ScreenUtil(width: 375, height: 667)..init(context);
      _hasInit = true;
    }
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildHomeAppBar(onTap: () {
        NavigatorUtil.goMessage(context);
      }, onPersonalTap: () {
        NavigatorUtil.goPersona(context, '123');
      }),
      body: HomeBodyView(),
    );
  }

  /// 主页功能项点击事件
  void _initActionTapListener() {
    _actionListener =
        Event.eventBus.on<HomeActionEvent>().listen((actionEvent) {
      if (!mounted || actionEvent == null) {
        return;
      }
      print('action type ::::${actionEvent.type}');
      switch (actionEvent.type) {
        case HOME_ACTION_BLUETOOTH:
          NavigatorUtil.goBluetooth(context);
          break;
        case HOME_ACTION_PARKING:
//          NavigatorUtil.goBindLicense(context);
          NavigatorUtil.goParking(context);
          break;
        case HOME_ACTION_REPAIR:
          NavigatorUtil.goRepairPage(context);
          break;
        case HOME_ACTION_MONITOR:
          NavigatorUtil.goMonitorPage(context);
          break;
        case HOME_ACTION_PAY:
          NavigatorUtil.goPayment(context);
          break;
        case HOME_ACTION_RESERVE:
          NavigatorUtil.goReservePage(context);
          break;
        case HOME_ACTION_REPORT_ACTION:
          NavigatorUtil.goReportActionPage(context);
          break;
        case HOME_ACTION_DECORATE:
          NavigatorUtil.goApplyPage(context);
          break;
      }
    });
  }

  void _getAccountInfo() async {
    if (_userDao == null) {
      var store = StoreProvider.of<AppState>(context);
      if (store.state?.info == null) {
        _userDao = UserDao(store);
        var model = await _userDao.getAccountInfo();
        if (model?.data != null && mounted) {
          setState(() {

          });
        }
      }
    }
  }
}
