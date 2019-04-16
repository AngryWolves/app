import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_park/event/event.dart';
import 'package:smart_park/values/colors.dart';
import 'package:smart_park/values/images.dart';
import 'package:smart_park/values/strings.dart';

const int HOME_ACTION_LOGOUT = 0x999;
const int HOME_ACTION_BLUETOOTH = 0x001;
const int HOME_ACTION_PARKING = 0x002;
const int HOME_ACTION_REPAIR = 0x003;
const int HOME_ACTION_MONITOR = 0x004;
const int HOME_ACTION_PAY = 0x005;
const int HOME_ACTION_RESERVE = 0x006;
const int HOME_ACTION_REPORT_ACTION = 0x007;
const int HOME_ACTION_DECORATE = 0x008;

class HomeActionGridView extends StatefulWidget {
  @override
  _HomeActionGridViewState createState() => _HomeActionGridViewState();
}

class _HomeActionGridViewState extends State<HomeActionGridView> {
  final List<_ActionChoices> _choices = [
    _ActionChoices(home_item_bluetooth, home_action_bluetooth_control,
        HOME_ACTION_BLUETOOTH),
    _ActionChoices(home_item_parking, home_action_parking, HOME_ACTION_PARKING),
    _ActionChoices(
        home_item_repair, home_action_report_repair, HOME_ACTION_REPAIR),
    _ActionChoices(home_item_monitor, home_action_monitor, HOME_ACTION_MONITOR),
    _ActionChoices(home_item_payment, home_action_pay, HOME_ACTION_PAY),
    _ActionChoices(
        home_item_reserve, home_action_reserve_site, HOME_ACTION_RESERVE),
    _ActionChoices(
        home_item_report, home_action_report_active, HOME_ACTION_REPORT_ACTION),
    _ActionChoices(
        home_item_apply, home_action_apply_decorate, HOME_ACTION_DECORATE)
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10.0),
      height: ScreenUtil().setHeight(158),
      child: GridView.count(
        physics: NeverScrollableScrollPhysics(),
        crossAxisCount: 4,
        childAspectRatio: 1.3,
        children: _choices.map((choice) {
          return GestureDetector(
            onTap: () {
              Event.fireHomeActionEvent(choice.type);
            },
            child: Container(
              color: Colors.transparent,
              child: Column(
                children: <Widget>[
                  Image.asset(
                    choice.icon,
                    width: ScreenUtil().setWidth(20),
                    height: ScreenUtil().setWidth(20),
                  ),
                  Text(
                    choice.title,
                    style: TextStyle(
                        fontSize: ScreenUtil().setSp(13),
                        color: ColorRes.GERY_TEXT),
                  )
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class _ActionChoices {
  _ActionChoices(this.icon, this.title, this.type);

  String icon;
  String title;
  int type;
}
