import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_park/values/colors.dart';
import 'package:smart_park/values/strings.dart';
import 'package:smart_park/widget/base/base_state.dart';
import 'package:smart_park/widget/black_top_white_bottom_bg.dart';
import 'package:smart_park/widget/common_app_bar.dart';

class ParkingEnding extends StatefulWidget {
  @override
  _ParkingEndingState createState() => _ParkingEndingState();
}

class _ParkingEndingState extends BaseState<ParkingEnding> {
  final TextStyle _style = TextStyle(
      color: ColorRes.PARKING_FEE_GERY, fontSize: ScreenUtil().setSp(13));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCommonAppbar(home_action_parking, onLeadTop: onBack),
      body: Stack(
        children: <Widget>[
          BlackTopWhiteBottomLayer().layerBuilder,
          _buildParkingFeeBody()
        ],
      ),
    );
  }

  Widget _buildParkingFeeBody() {
    return Container(
      margin: const EdgeInsets.only(left: 15.0, right: 15.0, top: 25.0),
      child: Column(
        children: <Widget>[_buildFeeCover()],
      ),
    );
  }

  ///
  /// 停车费详情
  ///
  Widget _buildFeeCover() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0), color: Colors.white),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(parking_fee_this_time_title, style: TextStyle(
                color: ColorRes.PARKING_FEE_TITLE_GERY,
                fontSize: 15.0
              ),),
              Text(parking_fee_unit, style: TextStyle(
                color: ColorRes.PARKING_FEE_TITLE_GERY, fontSize: 24,
              ),)
            ],
          ),

        ],
      ),
    );
  }
}
