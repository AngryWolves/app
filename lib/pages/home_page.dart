import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_park/event/event.dart';
import 'package:smart_park/event/home_action_event.dart';
import 'package:smart_park/widgets/home/app_bar.dart';
import 'package:smart_park/widgets/home/home_action_grid.dart';
import 'package:smart_park/widgets/home/home_body.dart';

class HomePage extends StatefulWidget {
  static final sName = '/';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _hasInit = false;

  var _actionListener;

  @override
  void initState() {
    super.initState();
    _initActionTapListener();
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
      appBar: buildHomeAppBar(),
      body: HomeBodyView(),
    );
  }

  void _initActionTapListener() {
    _actionListener =
        Event.eventBus.on<HomeActionEvent>().listen((actionEvent) {
      if (!mounted || actionEvent == null) {
        return;
      }
      print('action type ::::${actionEvent.type}');
      switch (actionEvent.type) {
        case HOME_ACTION_BLUETOOTH:
          break;
        case HOME_ACTION_PARKING:
          break;
        case HOME_ACTION_REPAIR:
          break;
        case HOME_ACTION_MONITOR:
          break;
        case HOME_ACTION_PAY:
          break;
        case HOME_ACTION_RESERVE:
          break;
        case HOME_ACTION_REPORT_ACTION:
          break;
        case HOME_ACTION_DECORATE:
          break;
      }
    });
  }
}
