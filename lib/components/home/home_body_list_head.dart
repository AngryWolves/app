import 'package:flutter/material.dart';
import 'package:smart_park/components/home/home_action_grid.dart';
import 'package:smart_park/components/home/home_auto_slide.dart';
import 'package:smart_park/values/colors.dart';

class HomeBodyListHead extends StatefulWidget {
  @override
  _HomeBodyListHeadState createState() => _HomeBodyListHeadState();
}

class _HomeBodyListHeadState extends State<HomeBodyListHead> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        HomeAutoSlideView(),
        HomeActionGridView(),
        Container(
          height: 5.0,
          color: ColorRes.APP_BACKGROUND,
        )
      ],
    );
  }
}
