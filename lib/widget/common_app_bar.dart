import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_park/values/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget buildCommonAppbar(
    {Color backgroundColor = ColorRes.COLOR_COMMON_APP_BAR_BACKGROUND}) {
  return PreferredSize(
    preferredSize: Size.fromHeight(ScreenUtil().setHeight(64)),//设置AppBar高度
    child: AppBar(
      backgroundColor: backgroundColor,
      leading: GestureDetector(
        onTap: () {},
        child: Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
          size: 15.0,
        ),
      ),
      title: Text(
        '注册',
        style: TextStyle(color: Colors.white,fontSize: 18.0),
      ),
      centerTitle: true,//标题是否居中，默认为false
    ),
  );
}
