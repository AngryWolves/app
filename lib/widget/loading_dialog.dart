import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoginDialog extends Dialog {
  LoginDialog({this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: WillPopScope(
        onWillPop: () => Future.value(null),
        child: Center(
          child: Container(
            width: ScreenUtil().setWidth(120),
            height: ScreenUtil().setHeight(120),
            decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.all(Radius.circular(8.0))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SpinKitWave(
                  color: Colors.black,
                  size: 40.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Text(title ?? ''),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}