import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:smart_park/components/reserve/item/room_info_head.dart';
import 'package:smart_park/components/reserve/select_date_tab_item.dart';
import 'package:smart_park/components/reserve/tab/date_select_tab_view.dart';
import 'package:smart_park/router/navigator_util.dart';
import 'package:smart_park/values/colors.dart';
import 'package:smart_park/values/strings.dart';
import 'package:smart_park/widget/base/base_state.dart';
import 'package:smart_park/widget/common_app_bar.dart';
import 'package:smart_park/widget/common_gradient_button.dart';

class ReserveSelectDate extends StatefulWidget {
  ReserveSelectDate({this.yardId});

  final String yardId;

  @override
  _ReserveSelectDateState createState() => _ReserveSelectDateState();
}

class _ReserveSelectDateState extends BaseState<ReserveSelectDate>
    with TickerProviderStateMixin {
  final List<DateChoice> _dateChoices = [];

  TabController _controller;

  String _startTime = '';
  String _endTime = '';
  String _dateTime = '';

  @override
  void initState() {
    super.initState();

    _initDateTab();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCommonAppbar(reserve_select_date_title, onLeadTop: onBack),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Column(
              children: <Widget>[
                RoomInfoHead().roomInfoBuilder,
                _buildDateSelectTab(),
                _buildDateSelectBody()
              ],
            ),
          ),
          _buildHasSelected()
        ],
      ),
    );
  }

  Widget _buildHasSelected() {
    return Container(
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              alignment: Alignment.centerRight,
              height: ScreenUtil().setHeight(45),
              color: ColorRes.GERY_TEXT,
              child: Text(
                reserve_select_date_has_selected + _startTime + '-' + _endTime,
                style: TextStyle(color: Colors.white, fontSize: 13.0),
              ),
            ),
          ),
          Container(
            width: ScreenUtil().setWidth(100),
            child: GradientButton(
              reserve_select_date_confirm,
              () {
                if (_startTime.isEmpty) {
                  Fluttertoast.showToast(msg: reserve_empty_start_time);
                  return;
                } else if (_endTime.isEmpty) {
                  Fluttertoast.showToast(msg: reserve_empty_end_time);
                  return;
                }
                NavigatorUtil.goReserveConfirmPage(context,
                    dateTime: _dateTime,
                    startTime: _startTime,
                    endTime: _endTime,
                    yardId: widget.yardId);
              },
              radius: 0.0,
              fontSize: 15,
              height: 45,
            ),
          )
        ],
      ),
    );
  }

  ///
  /// 日期选择 tab
  ///
  Widget _buildDateSelectTab() {
    var tabItem = SelectDateTabItem();

    return Container(
      height: ScreenUtil().setHeight(45),
      child: TabBar(
        labelColor: ColorRes.BLUE_TEXT,
        unselectedLabelColor: ColorRes.GERY_TEXT,
        indicator: UnderlineTabIndicator(
            borderSide: BorderSide(color: ColorRes.BLUE_TEXT, width: 2.0),
            insets: const EdgeInsets.symmetric(horizontal: 19.0)),
        tabs: _dateChoices.map((choice) {
          return tabItem.setInfo(choice.title, choice.date).itemBuilder;
        }).toList(),
        controller: _controller,
      ),
    );
  }

  ///
  /// 时间段选择
  ///
  Widget _buildDateSelectBody() {
    return Expanded(
      child: TabBarView(
        children: _dateChoices.map((choice) {
          return DateSelectTabView(
            choice,
            onTimeSelect: (startTime, endTime, dateTime) {
              setState(() {
                _startTime = startTime;
                _endTime = endTime;
                _dateTime = dateTime;
              });
            },
          );
        }).toList(),
        controller: _controller,
      ),
    );
  }

  void _initDateTab() {
    var date = DateTime.now();
    var millisecond = date.millisecondsSinceEpoch;
    for (int i = 1; i <= 5; i++) {
      var title;
      var day;
      var dateTime;
      var offsetMillisecond;
      switch (i) {
        case 1:
          title = '今天';
          offsetMillisecond = millisecond;
          break;
        case 2:
          offsetMillisecond = millisecond + 1 * 24 * 60 * 60 * 1000;
          title = '明天';
          break;
        case 3:
          title = '后天';
          offsetMillisecond = millisecond + 2 * 24 * 60 * 60 * 1000;
          break;
        case 4:
          offsetMillisecond = millisecond + 3 * 24 * 60 * 60 * 1000;
          title = DateUtil.getZHWeekDayByMs(offsetMillisecond);
          break;
        case 5:
          offsetMillisecond = millisecond + 4 * 24 * 60 * 60 * 1000;
          title = DateUtil.getZHWeekDayByMs(offsetMillisecond);
          break;
      }
      day = DateUtil.getDateStrByMs(offsetMillisecond,
          format: DateFormat.ZH_MONTH_DAY);
      dateTime = DateUtil.getDateStrByMs(offsetMillisecond,
          format: DateFormat.YEAR_MONTH_DAY);
      _dateChoices.add(DateChoice(title, day, dateTime));
    }
    _controller = TabController(length: _dateChoices.length, vsync: this);
  }
}

class DateChoice {
  DateChoice(this.title, this.date, this.dateTime);

  String title;
  String date;
  String dateTime;
}
