import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_park/values/colors.dart';

class GradientButton extends StatelessWidget {
  GradientButton(this.text, this.onTap,
      {this.radius = 5.0, this.height = 50, this.fontSize = 17});

  final String text;
  final onTap;
  final double radius;
  final int height;
  final int fontSize;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: ScreenUtil().setHeight(height),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          gradient: LinearGradient(
              colors: [ColorRes.BUTTON_START_COLOR, ColorRes.BUTTON_END_COLOR]),
        ),
        child: Text(
          text,
          style: TextStyle(
              color: Colors.white, fontSize: ScreenUtil().setSp(fontSize)),
        ),
      ),
    );
  }
}
