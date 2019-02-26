import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_park/values/colors.dart';
import 'package:smart_park/values/strings.dart';

Widget buildHomeAppBar() => AppBar(
    elevation: 0.0,
    title: Text(
        home_bar_title,
        style: TextStyle(color: ColorRes.GERY_TEXT),
    ),
    backgroundColor: Colors.white,
    leading: GestureDetector(
        child: Icon(Icons.account_circle, color: ColorRes.GERY_TEXT,),
    ),
    actions: <Widget>[
        GestureDetector(
            child: Container(
                width: ScreenUtil().setWidth(50),
                alignment: Alignment.center,
                child: Icon(Icons.mail_outline, color: ColorRes.GERY_TEXT),
            ),
        )
    ],
);