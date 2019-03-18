import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_park/values/colors.dart';
import 'package:smart_park/values/strings.dart';
import 'package:smart_park/widget/common_gradient_button.dart';
import 'package:smart_park/widget/common_stroke_button.dart';

class ReserveSucceedPage extends StatefulWidget {
  @override
  _ReserveSucceedPageState createState() => _ReserveSucceedPageState();
}

class _ReserveSucceedPageState extends State<ReserveSucceedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        border: Border(),
        leading: GestureDetector(
          child: Container(
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.arrow_back_ios,
                  size: 18.0,
                  color: ColorRes.GERY_TEXT,
                ),
                Text(
                  reserve_success_title,
                  style: TextStyle(fontSize: 15.0, color: ColorRes.GERY_TEXT),
                )
              ],
            ),
          ),
        ),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(reserve_success,
              style: TextStyle(color: ColorRes.GERY_TEXT, fontSize: 18.0)),
          Text(reserve_success_desc,
              style: TextStyle(
                  color: ColorRes.RESERVE_SUCCESS_DESC, fontSize: 12.0)),
          Container(
            margin: const EdgeInsets.only(top: 50.0),
            height: ScreenUtil().setHeight(34),
            width: ScreenUtil().setWidth(232),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SizedBox(
                  width: ScreenUtil().setWidth(111),
                  child: GradientButton(
                    reserve_success_continue,
                    () {},
                    radius: 17,
                    fontSize: 12,
                  ),
                ),
                SizedBox(
                  width: ScreenUtil().setWidth(111),
                  child: buildCommonStrokeButton(reserve_success_my_reserve,
                      onTap: () {}, radius: 17.0),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
