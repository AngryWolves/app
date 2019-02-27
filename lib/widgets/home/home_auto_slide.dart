import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeAutoSlideView extends StatefulWidget {
  @override
  _HomeAutoSlideViewState createState() => _HomeAutoSlideViewState();
}

class _HomeAutoSlideViewState extends State<HomeAutoSlideView> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: ScreenUtil().setHeight(196),
        color: Colors.yellow,
    );
  }
}