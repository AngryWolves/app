import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_park/values/colors.dart';
import 'package:smart_park/values/strings.dart';

PreferredSizeWidget buildParkingAppBar() {
  return PreferredSize(
      child: Container(
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: ColorRes.BLACK_APP_BAR_BACKGROUND)),
//          color: ColorRes.BLACK_APP_BAR_BACKGROUND,
            gradient: LinearGradient(colors: [ColorRes.BLACK_APP_BAR_BACKGROUND,
            ColorRes.BLACK_APP_BAR_BACKGROUND])
        ),
        child: Stack(
          alignment: Alignment.centerLeft,
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              child: Text(
                bind_license_enter_title,
                style: TextStyle(
                    color: Colors.white, fontSize: ScreenUtil().setSp(18)),
              ),
            ),
            Container(
              width: ScreenUtil().setWidth(40),
              height: ScreenUtil().setHeight(40),
              child: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      preferredSize: Size.fromHeight(ScreenUtil().setHeight(53)));
}
