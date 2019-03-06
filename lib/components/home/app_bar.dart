import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_park/values/colors.dart';
import 'package:smart_park/values/strings.dart';

Widget buildHomeAppBar({onTap, onPersonalTap}) => AppBar(
      brightness: Brightness.light,
      elevation: 0.0,
      title: Text(
        home_bar_title,
        style: TextStyle(color: ColorRes.GERY_TEXT),
      ),
      backgroundColor: Colors.white,
      leading: GestureDetector(
          onTap: onPersonalTap,
        child: Icon(
          Icons.account_circle,
          color: ColorRes.GERY_TEXT,
        ),
      ),
      actions: <Widget>[
        GestureDetector(
          onTap: onTap,
          child: Stack(
            alignment: Alignment(0.8, -0.7),
            children: <Widget>[
              Container(
                width: ScreenUtil().setWidth(50),
                alignment: Alignment.center,
                child: Icon(Icons.mail_outline, color: ColorRes.GERY_TEXT),
              ),
              Container(
                width: ScreenUtil().setWidth(22),
                height: ScreenUtil().setWidth(22),
                child: CircleAvatar(
                  backgroundColor: Colors.red,
                  child: Text(
                    '99+',
                    style: TextStyle(
                        fontSize: ScreenUtil().setSp(10), color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
