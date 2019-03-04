import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_park/values/colors.dart';

Widget buildCommonStrokeButton(String text,
        {onTap, int height = 30, int width = 65}) =>
    GestureDetector(
      onTap: () {
        if (onTap != null) {
          onTap();
        }
      },
      child: Container(
        alignment: Alignment.center,
        height: ScreenUtil().setHeight(height),
        width: ScreenUtil().setWidth(width),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3.0),
            border: Border.all(color: ColorRes.BLUE_TEXT)),
        child: Text(
          text,
          style: TextStyle(
              color: ColorRes.BLUE_TEXT, fontSize: ScreenUtil().setSp(12)),
        ),
      ),
    );
