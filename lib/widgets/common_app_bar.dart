import 'package:flutter/material.dart';
import 'package:smart_park/values/colors.dart';

Widget buildCommonAppBar(String title,
    {onBack,
    Widget onMenu,
    onTrailing,
    String trailingText,
    double elevation = 1.0,
    Brightness brightness = Brightness.light,
    Color color = Colors.white,
    Color titleColor = ColorRes.GERY_TEXT}) {
  var trailing;
  if (trailingText != null) {
    trailing = GestureDetector(
      onTap: () {
        if (onTrailing != null) {
          onTrailing();
        }
      },
    );
  } else {
    trailing = Container();
  }

  var leading;
  if (onBack != null) {
    leading = GestureDetector(
      onTap: () {
        onBack();
      },
      child: Container(
        width: 30.0,
        color: Colors.transparent,
        child: Center(
          child: Icon(
            Icons.arrow_back_ios,
            color: titleColor,
          ),
        ),
      ),
    );
  } else if (onMenu != null) {
    leading = onMenu;
  }

  return AppBar(
    elevation: elevation,
    brightness: brightness,
    backgroundColor: color,
    title: Text(title,
        style: TextStyle(
            color: titleColor, fontSize: 18.0, fontWeight: FontWeight.w600)),
    centerTitle: true,
    leading: leading,
    actions: <Widget>[trailing],
  );
}
