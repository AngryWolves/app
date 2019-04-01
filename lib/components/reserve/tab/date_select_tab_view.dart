import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_park/components/reserve/reserve_select_date_page.dart';
import 'package:smart_park/values/colors.dart';
import 'package:smart_park/values/strings.dart';

typedef OnTimeSelect(String startTime, String endTime, String dateTime);

class DateSelectTabView extends StatefulWidget {
  DateSelectTabView(this.dateChoice, {this.onTimeSelect});

  final DateChoice dateChoice;

  final OnTimeSelect onTimeSelect;

  @override
  _DateSelectTabViewState createState() => _DateSelectTabViewState();
}

class _DateSelectTabViewState extends State<DateSelectTabView> {
  final List<String> _morningPeriod = [
    '09:00',
    '09:30',
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

  final Range _range = Range();

  String _selectStartTime = '';
  String _selectEndTime = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorRes.APP_BACKGROUND,
      padding: const EdgeInsets.all(15.0),
      child: ListView(
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          _buildMorning(_morningPeriod, indexOffset: 0),
          _buildMorning(_afternoonPeriod, indexOffset: _morningPeriod.length),
          _buildMorning(_eveningPeriod,
              indexOffset: _morningPeriod.length + _afternoonPeriod.length),
        ],
      ),
    );
  }

  Widget _buildMorning(List<String> periods, {int indexOffset}) {
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
                  return PeriodItem(
                    title: title,
                    realIndex: index + indexOffset,
                    onSelected: (value) {
                      setState(() {
                        _range.select(value);
                        var startIndex = _range.left;
                        var morningLength = _morningPeriod.length;
                        var daysLength =
                            morningLength + _afternoonPeriod.length;
                        if (startIndex != -1) {
                          if (startIndex > daysLength) {
                            _selectStartTime =
                                _eveningPeriod[startIndex - daysLength];
                          } else if (startIndex >= morningLength) {
                            _selectStartTime =
                                _afternoonPeriod[startIndex - morningLength];
                          } else if (startIndex < morningLength) {
                            _selectStartTime = _morningPeriod[startIndex];
                          }
                        }

                        var endIndex = _range.right;
                        if (endIndex != -1) {
                          if (endIndex > daysLength) {
                            _selectEndTime =
                                _eveningPeriod[endIndex - daysLength];
                          } else if (endIndex >= morningLength) {
//                            debugPrint('==value::$value..morningLength::$morningLength');
                            _selectEndTime =
                                _afternoonPeriod[endIndex - morningLength];
                          } else if (endIndex < morningLength) {
                            _selectEndTime = _morningPeriod[endIndex];
                          }
                        }
                        if (_selectStartTime == _selectEndTime) {
                          _selectEndTime = '';
                        }

                        widget.onTimeSelect(_selectStartTime, _selectEndTime,
                        widget.dateChoice.dateTime);
                      });
                    },
                    isSelected: _range.isInRange(index + indexOffset),
                  );
                }),
          )
        ],
      ),
    );
  }

  Widget _buildPeriodItem(String title,
      {GestureTapCallback onTap, bool isSelected}) {
//    bool sel = false;

    return GestureDetector(
      onTap: () {
        if (_selectStartTime.isEmpty) {}
        setState(() {
//          sel = !sel;
        });
      },
      child: Container(
        alignment: Alignment.center,
        color: isSelected ? ColorRes.BLUE_TEXT : Colors.white,
        width: ScreenUtil().setWidth(85),
        height: ScreenUtil().setHeight(42),
        child: Text(
          title,
          style: TextStyle(
              color: isSelected ? Colors.white : ColorRes.GERY_TEXT,
              fontSize: 12.0),
        ),
      ),
    );
  }
}

class PeriodItem extends StatefulWidget {
  PeriodItem({this.title, this.realIndex, this.onSelected, this.isSelected});

  final String title;

  final int realIndex;

  final ValueChanged<int> onSelected;

  final bool isSelected;

  @override
  _PeriodItemState createState() => _PeriodItemState();
}

class _PeriodItemState extends State<PeriodItem> {
  bool _isSelect = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onSelected(widget.realIndex);
//        _range.select(widget.realIndex);
//        debugPrint('range left::${_range.left} , right ::${_range.right}');
//        if (_selectStartTime.isEmpty) {
//
//        }
//        setState(() {
//          sel = !sel;
//          _isSelect = !_isSelect;
//        });
      },
      child: Container(
        alignment: Alignment.center,
        color: widget.isSelected ? ColorRes.BLUE_TEXT : Colors.white,
        width: ScreenUtil().setWidth(85),
        height: ScreenUtil().setHeight(42),
        child: Text(
          widget.title,
          style: TextStyle(
              color: widget.isSelected ? Colors.white : ColorRes.GERY_TEXT,
              fontSize: 12.0),
        ),
      ),
    );
  }
}

class Range {
  int left = -1;
  int right = -1;

  bool isInRange(int index) {
    if (right == -1) {
      return index == left;
    }
    if (left != -1 && right != -1) {
      return index >= left && index <= right;
    }
    return false;
  }

  void select(int index) {
    // 第一次点击
    if (left < 0) {
      left = index;
      return;
    }
    // 第二次选择,在第一次之后
    if (left != -1 && index > left) {
      right = index;
      return;
    }
    if (left != -1 && right != -1 && index < left) {
      left = index;
      return;
    }
    // 第二次选择在第一次之前
    if (index < left) {
      right = left;
      left = index;
    }
    // 取消第一次选择
    if (index == left && right == -1) {
      left = -1;
      return;
    }
    if (index == left && right != -1) {
      if (left < right - 1) {
        left += 1;
      } else if (left == right - 1) {
        left = right;
        right = -1;
      }
    }
  }
}
