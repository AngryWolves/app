import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_park/components/reserve/tab/active_room_tab.dart';
import 'package:smart_park/components/reserve/tab/gym_tab.dart';
import 'package:smart_park/components/reserve/tab/meeting_room_tab.dart';
import 'package:smart_park/values/colors.dart';
import 'package:smart_park/values/strings.dart';
import 'package:smart_park/widget/base/base_state.dart';
import 'package:smart_park/widget/common_app_bar.dart';

class ReservePage extends StatefulWidget {
  @override
  _ReservePageState createState() => _ReservePageState();
}

class _ReservePageState extends BaseState<ReservePage>
    with TickerProviderStateMixin {
  final List<_ReserveChoice> _choices = [
    _ReserveChoice('images/ic_reserve_meeting_room.png', reserve_meeting_room,
        RESERVE_TAB_TYPE_MEETING),
    _ReserveChoice('images/ic_reserve_active_room.png', reserve_active_room,
        RESERVE_TAB_TYPE_ACTIVE),
    _ReserveChoice(
        'images/ic_reserve_gym.png', reserve_gym, RESERVE_TAB_TYPE_GYM),
  ];

  TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: _choices.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCommonAppbar(home_action_reserve_site,
          onLeadTop: onBack, actions: _buildBarActions()),
      body: Column(
        children: <Widget>[_buildTabBar(), _buildTabBarView()],
      ),
    );
  }

  ///
  /// tabbar
  ///
  Widget _buildTabBar() {
    return Container(
      height: ScreenUtil().setHeight(40),
      child: TabBar(
        indicator: UnderlineTabIndicator(
            borderSide: BorderSide(color: ColorRes.BLUE_TEXT, width: 2.0),
            insets: const EdgeInsets.symmetric(horizontal: 30.0)),
        indicatorSize: TabBarIndicatorSize.label,
        controller: _controller,
        tabs: _choices.map((choice) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                choice.icon,
                width: 16.0,
                height: 18.0,
              ),
              Padding(
                padding: const EdgeInsets.all(3.0),
              ),
              Text(
                choice.title,
                style: TextStyle(color: ColorRes.GERY_TEXT, fontSize: 12.0),
              )
            ],
          );
        }).toList(),
      ),
    );
  }

  Widget _buildTabBarView() {
    return Expanded(
        child: TabBarView(
      controller: _controller,
      children: _choices.map((choice) {
        switch (choice.type) {
          case RESERVE_TAB_TYPE_MEETING:
            return MeetingRoomTab();
          case RESERVE_TAB_TYPE_ACTIVE:
            return ActiveRoomTab();
          case RESERVE_TAB_TYPE_GYM:
            return GymTab();
        }
      }).toList(),
    ));
  }

  ///
  /// 快速预定
  ///
  List<Widget> _buildBarActions() => <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              child: Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(right: 15.0),
                width: ScreenUtil().setWidth(50),
                height: 25.0,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(3.0)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Image.asset(
                      'images/ic_reserve_lightning.png',
                      width: 7.0,
                      height: 13.0,
                      fit: BoxFit.fill,
                    ),
                    Text(
                      reserve_action_ok,
                      style: TextStyle(color: Colors.white, fontSize: 12.0),
                    ),
                  ],
                ),
              ),
            )
          ],
        )
      ];
}

const int RESERVE_TAB_TYPE_MEETING = 1;
const int RESERVE_TAB_TYPE_ACTIVE = 2;
const int RESERVE_TAB_TYPE_GYM = 3;

class _ReserveChoice {
  _ReserveChoice(this.icon, this.title, this.type);

  int type;
  String icon;
  String title;
}
