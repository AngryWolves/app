import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_park/values/colors.dart';
import 'package:smart_park/values/strings.dart';

class DateSelectTabView extends StatefulWidget {
  @override
  _DateSelectTabViewState createState() => _DateSelectTabViewState();
}

class _DateSelectTabViewState extends State<DateSelectTabView> {
  final List<String> _morningPeriod = [
    '9:00',
    '9:30',
    '10:00',
    '10:30',
    '11:00',
    '11:30',
    '12:00',
    '12:30'
  ];
  final List<String> _afternoonPeriod = [
    '13:00',
    '13:30',
    '14:00',
    '14:30',
    '15:00',
    '15:30',
    '16:00',
    '16:30',
    '17:00',
    '17:30',
    '18:00',
    '18:30'
  ];
  final List<String> _eveningPeriod = [
    '19:00',
    '19:30',
    '20:00',
    '20:30',
    '21:00',
    '21:30',
    '22:00',
    '22:30'
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorRes.APP_BACKGROUND,
      padding: const EdgeInsets.all(15.0),
      child: ListView(
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          _buildMorning(_morningPeriod),
          _buildMorning(_afternoonPeriod),
          _buildMorning(_eveningPeriod),
        ],
      ),
    );
  }

  Widget _buildMorning(List<String> periods) {
    var title = '';
    var periodsTitle = '';
    var height;
    if (periods.length == _morningPeriod.length) {
      title = reserve_select_date_morning;
      periodsTitle = reserve_select_date_morning_period;
      height = 90;
    } else if (periods.length == _afternoonPeriod.length) {
      title = reserve_select_date_afternoon;
      periodsTitle = reserve_select_date_afternoon_period;
      height = 132;
    } else if (periods.length == _eveningPeriod.length) {
      title = reserve_select_date_evening;
      periodsTitle = reserve_select_date_evening_period;
      height = 90;
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text.rich(TextSpan(
              text: title,
              style: TextStyle(color: ColorRes.GERY_TEXT, fontSize: 15.0),
              children: [
                TextSpan(
                    text: periodsTitle,
                    style: TextStyle(
                        color: ColorRes.REPAIR_SELECT_TYPE_TITLE,
                        fontSize: 10.0))
              ])),
          //
          Padding(padding: const EdgeInsets.all(10.0)),
          Container(
            height: ScreenUtil().setHeight(height),
            child: GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: periods.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    mainAxisSpacing: 1.0,
                    crossAxisSpacing: 1.0,
                    childAspectRatio: 2.0),
                itemBuilder: (context, index) {
                  var title = periods[index];
                  return _buildPeriodItem(title);
                }),
          )
        ],
      ),
    );
  }

  Widget _buildPeriodItem(String title) {
    return GestureDetector(
      child: Container(
        alignment: Alignment.center,
        color: Colors.white,
        width: ScreenUtil().setWidth(85),
        height: ScreenUtil().setHeight(42),
        child: Text(
          title,
          style: TextStyle(color: ColorRes.GERY_TEXT, fontSize: 12.0),
        ),
      ),
    );
  }
}
