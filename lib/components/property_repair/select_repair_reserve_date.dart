import 'package:common_utils/common_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_park/values/colors.dart';
import 'package:smart_park/values/strings.dart';

class SelectRepairReserveDate extends StatefulWidget {
  @override
  _SelectRepairReserveDateState createState() =>
      _SelectRepairReserveDateState();
}

class _SelectRepairReserveDateState extends State<SelectRepairReserveDate> {
  var _years = [];
  var _months = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12'];
  var _days = [];

  TextStyle _pickerDateStyle =
      TextStyle(color: ColorRes.GERY_TEXT, fontSize: ScreenUtil().setSp(24));

  TextStyle _pickerUnitStyle =
      TextStyle(color: ColorRes.GERY_TEXT, fontSize: ScreenUtil().setSp(15));

  @override
  void initState() {
    var date = DateTime.now();
    var year = date.year;
    _years.add(year.toString());
    _years.add('${year + 1}');
    _initDays(date.month);
    _setDay(date.month, year);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[_buildTitle(), _buildDatePicker()],
    );
  }

  Widget _buildDatePicker() => Container(
        color: Colors.white,
        height: ScreenUtil().setHeight(143),
        padding: const EdgeInsets.symmetric(horizontal: 26.0, vertical: 15.0),
        child: Row(
          children: <Widget>[
            _buildYearPicker(),
            Text(
              '年',
              style: _pickerUnitStyle,
            ),
            _buildMonthPicker(),
            Text(
              '月',
              style: _pickerUnitStyle,
            ),
            _buildDayPicker(),
            Text(
              '日',
              style: _pickerUnitStyle,
            ),
          ],
        ),
      );

  /// 日期选择
  Widget _buildDayPicker() => Container(
        width: ScreenUtil().setWidth(65),
        margin: EdgeInsets.only(
            right: ScreenUtil().setWidth(20), left: ScreenUtil().setWidth(10)),
        child: CupertinoPicker.builder(
            backgroundColor: Colors.white,
            childCount: _days.length,
            itemExtent: 40.0,
            onSelectedItemChanged: (day) {},
            itemBuilder: (context, index) {
              return Container(
                alignment: Alignment.center,
                child: Text(
                  _days[index],
                  style: _pickerDateStyle,
                ),
              );
            }),
      );

  /// 月份选择
  Widget _buildMonthPicker() => Container(
        width: ScreenUtil().setWidth(65),
        margin: EdgeInsets.only(
            right: ScreenUtil().setWidth(20), left: ScreenUtil().setWidth(10)),
        child: CupertinoPicker.builder(
            backgroundColor: Colors.white,
            childCount: _months.length,
            itemExtent: 40.0,
            onSelectedItemChanged: (month) {},
            itemBuilder: (context, index) {
              return Container(
                alignment: Alignment.center,
                child: Text(
                  _months[index],
                  style: _pickerDateStyle,
                ),
              );
            }),
      );

  /// 年份选择
  Widget _buildYearPicker() => Container(
        width: ScreenUtil().setWidth(65),
        margin: EdgeInsets.only(right: ScreenUtil().setWidth(20)),
        child: CupertinoPicker.builder(
            backgroundColor: Colors.white,
            childCount: _years.length,
            itemExtent: 40.0,
            onSelectedItemChanged: (year) {
              print('onSelectedYear ::: $year');
            },
            itemBuilder: (context, index) {
              return Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  _years[index],
                  style: _pickerDateStyle,
                ),
              );
            }),
      );

  /// 标题
  Widget _buildTitle() => Container(
        padding: const EdgeInsets.only(left: 15.0),
        height: ScreenUtil().setHeight(35),
        color: ColorRes.COLOR_LOGIN_BORDER_SIDE,
        alignment: Alignment.centerLeft,
        child: Text(
          repair_action_select_reserve_date,
          style: TextStyle(
              fontSize: ScreenUtil().setSp(13),
              color: ColorRes.REPAIR_SELECT_TYPE_TITLE),
        ),
      );

  void _initDays(int month) {
    for (var i = 1; i <= 28; i++) {
      var d = i < 10 ? '0$i' : i.toString();
      _days.add(d);
    }
  }

  /// 设置天数
  void _setDay(int month, int year) {
    var length = _days.length;
    switch (month) {
      case 2:
        var startDay = 28;
        if (DateUtil.isLeapYearByYear(year)) {
          startDay = 29;
        }
        if (length > startDay) {
          _days.removeRange(startDay, length);
        }
        break;
      case 1:
      case 3:
      case 5:
      case 7:
      case 8:
      case 10:
      case 12:
        // 31 天 只加不减
        var days = [];
        switch (length) {
          case 28:
            days = ['29', '30', '31'];
            break;
          case 29:
            days = ['30', '31'];
            break;
          case 30:
            days = ['31'];
            break;
        }
        _days.addAll(days);
        break;
      case 4:
      case 6:
      case 9:
      case 11:
        // 30 天
        switch (length) {
          case 31:
            _days.removeLast();
            break;
          case 29:
            _days.addAll(['30']);
            break;
          case 28:
            _days.addAll(['29', '30']);
            break;
        }
        break;
    }
  }
}
