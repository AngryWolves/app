import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_park/event/event.dart';
import 'package:smart_park/values/colors.dart';
import 'package:smart_park/values/strings.dart';

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
    _ActionChoices(
        Icons.bluetooth, home_action_bluetooth_control, HOME_ACTION_BLUETOOTH),
    _ActionChoices(
        Icons.local_parking, home_action_parking, HOME_ACTION_PARKING),
    _ActionChoices(Icons.build, home_action_report_repair, HOME_ACTION_REPAIR),
    _ActionChoices(Icons.videocam, home_action_monitor, HOME_ACTION_MONITOR),
    _ActionChoices(Icons.payment, home_action_pay, HOME_ACTION_PAY),
    _ActionChoices(
        Icons.rate_review, home_action_reserve_site, HOME_ACTION_RESERVE),
    _ActionChoices(
        Icons.message, home_action_report_active, HOME_ACTION_REPORT_ACTION),
    _ActionChoices(
        Icons.format_paint, home_action_apply_decorate, HOME_ACTION_DECORATE)
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10.0),
      color: Colors.white,
      height: ScreenUtil().setHeight(158),
      child: GridView.count(
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
                  Container(
                    margin: const EdgeInsets.all(10.0),
                    child: Icon(choice.icon),
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

  IconData icon;
  String title;
  int type;
}