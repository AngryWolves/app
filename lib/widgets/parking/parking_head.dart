import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_park/values/colors.dart';
import 'package:smart_park/values/strings.dart';
import 'package:smart_park/widgets/parking/parking_my_car.dart';
import 'package:smart_park/widgets/parking/vip_card.dart';

class ParkingHead extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MyCar(),
          VipCard(),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 15.0),
            child: Text(
              parking_history,
              style: TextStyle(
                  color: ColorRes.GERY_TEXT, fontSize: ScreenUtil().setSp(13)),
            ),
          )
        ],
      ),
    );
  }
}
