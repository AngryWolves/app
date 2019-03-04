import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_park/values/colors.dart';
import 'package:smart_park/values/strings.dart';
import 'package:smart_park/widget/common_stroke_button.dart';

class HasBindLicenseItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15.0),
      height: ScreenUtil().setHeight(100),
      padding: const EdgeInsets.fromLTRB(20.0, 15.0, 10.0, 10.0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(5.0))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            parking_unable_check_history,
            style: TextStyle(color: ColorRes.GERY_TEXT),
          ),
          Container(
            alignment: Alignment.centerRight,
            child: buildCommonStrokeButton(parking_bind_license, width: 78),
          )
        ],
      ),
    );
  }
}
