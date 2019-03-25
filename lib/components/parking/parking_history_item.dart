import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_park/components/parking/data/parking_history_item.dart';
import 'package:smart_park/values/colors.dart';
import 'package:smart_park/values/strings.dart';

class HistoryItem extends StatelessWidget {
  HistoryItem({this.data});

  final ParkingHistoryData data;

  @override
  Widget build(BuildContext context) {
    TextStyle style =
        TextStyle(color: ColorRes.GERY_TEXT, fontSize: ScreenUtil().setSp(15));
    TextStyle styleGery = TextStyle(
        color: ColorRes.PARKING_HISTORY_TIME, fontSize: ScreenUtil().setSp(13));
    return Container(
      height: ScreenUtil().setHeight(100),
      margin: const EdgeInsets.only(bottom: 5.0, left: 15.0, right: 15.0),
      padding: const EdgeInsets.fromLTRB(20.0, 18.0, 18.0, 18.0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(5.0))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text.rich(TextSpan(
                  text: parking_start_time,
                  style: style,
                  children: [
                    TextSpan(text: data?.beginTime ?? '', style: styleGery)
                  ])),
              Text.rich(TextSpan(
                  text: parking_end_time,
                  style: style,
                  children: [
                    TextSpan(text: data?.endTime ?? '', style: styleGery)
                  ])),
              Text.rich(TextSpan(
                  text: parking_all_time,
                  style: style,
                  children: [
                    TextSpan(text: data?.totalHour ?? '', style: styleGery)
                  ])),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                parking_fee_amount + data?.fee?.toString() ?? '',
                style: TextStyle(
                    color: ColorRes.GERY_TEXT,
                    fontSize: ScreenUtil().setSp(18)),
              ),
              Text(
                parking_fee_text,
                style: styleGery,
              )
            ],
          )
        ],
      ),
    );
  }
}
