import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_park/values/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:common_utils/common_utils.dart';

Widget buildCommonAppbar(String title,
    {Color backgroundColor = ColorRes.COLOR_COMMON_APP_BAR_BACKGROUND,
    Color titleColor = Colors.white,
    onLeadTop}) {
  return PreferredSize(
    preferredSize: Size.fromHeight(ScreenUtil().setHeight(64)), //设置AppBar高度
    child: AppBar(
      backgroundColor: backgroundColor,
      leading: onLeadTop != null
          ? GestureDetector(
              onTap: () {
                onLeadTop();
              },
              child: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
                size: 15.0,
              ),
            )
          : null,
      title: !ObjectUtil.isEmptyString(title)
          ? Text(
              title,
              style: TextStyle(
                  color: Colors.white, fontSize: ScreenUtil().setSp(18)),
            )
          : null,
      centerTitle: true, //标题是否居中，默认为false
    ),
  );
//  return AppBar(
//    backgroundColor: backgroundColor,
//    leading: onLeadTop != null
//        ? GestureDetector(
//            onTap: () {
//              onLeadTop();
//            },
//            child: Icon(
//              Icons.arrow_back_ios,
//              color: Colors.white,
//              size: 15.0,
//            ),
//          )
//        : null,
//    title: !ObjectUtil.isEmptyString(title)
//        ? Text(
//            title,
//            style: TextStyle(
//                color: Colors.white, fontSize: ScreenUtil().setSp(18)),
//          )
//        : null,
//    centerTitle: true, //标题是否居中，默认为false
//  );
}
