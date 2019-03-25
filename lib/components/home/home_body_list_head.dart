import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_park/components/home/home_action_grid.dart';
import 'package:smart_park/components/home/home_auto_slide.dart';
import 'package:smart_park/values/colors.dart';
import 'package:smart_park/values/strings.dart';

class HomeBodyListHead extends StatefulWidget {
  @override
  _HomeBodyListHeadState createState() => _HomeBodyListHeadState();
}

class _HomeBodyListHeadState extends State<HomeBodyListHead> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        HomeAutoSlideView(),
        HomeActionGridView(),
        Container(
          padding: const EdgeInsets.only(left: 15.0, top: 15.0),
          margin: const EdgeInsets.only(top: 10.0),
          alignment: Alignment.topLeft,
          child: Text(
            home_notice_item_title,
            style: TextStyle(
                color: ColorRes.GERY_TEXT,
                fontSize: ScreenUtil().setSp(18),
                fontWeight: FontWeight.w600),
          ),
        )
      ],
    );
  }
}
