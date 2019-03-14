import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_park/components/parking/pay_finish_dialog.dart';
import 'package:smart_park/values/colors.dart';
import 'package:smart_park/values/strings.dart';
import 'package:smart_park/widget/base/base_state.dart';
import 'package:smart_park/widget/black_top_white_bottom_bg.dart';
import 'package:smart_park/widget/common_app_bar.dart';
import 'package:smart_park/widget/common_gradient_button.dart';
import 'package:smart_park/widget/modal_bottom_sheet_pay.dart';

class ParkingFeeData {
  ParkingFeeData(this.title, this.desc);

  String title;
  String desc;
}

class ParkingEnding extends StatefulWidget {
  @override
  _ParkingEndingState createState() => _ParkingEndingState();
}

class _ParkingEndingState extends BaseState<ParkingEnding> {
  final List<ParkingFeeData> _feeItemData = [
    ParkingFeeData(parking_fee_start_time, '2019.01.23 13:30'),
    ParkingFeeData(parking_fee_end_time, '2019.01.23  15:00'),
    ParkingFeeData(parking_duration, '1个小时30分钟'),
  ];

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
      margin: const EdgeInsets.only(left: 15.0, right: 15.0, top: 20.0),
      child: Column(
        children: <Widget>[_buildFeeCover(), _buildFeePay()],
      ),
    );
  }

  ///
  /// 立即支付按钮
  ///
  Widget _buildFeePay() => Container(
        margin: EdgeInsets.only(top: ScreenUtil().setHeight(41)),
        child: GradientButton(parking_fee_pay_now, () {
          showDialog(
              context: context,
              builder: (ctx) => ModalBottomSheetPay(
                    '30',
                    onPayState: (int type) {
                      showDialog(
                          context: context, builder: (_) => PayFinishDialog());
                    },
                  ));
        }),
      );

  ///
  /// 停车费详情
  ///
  Widget _buildFeeCover() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0), color: Colors.white),
      child: Column(
        children: <Widget>[
          Container(
            padding:
                const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
            decoration: BoxDecoration(
                border:
                    Border(bottom: BorderSide(color: ColorRes.DIALOG_DIVIDER))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  parking_fee_this_time_title,
                  style: TextStyle(
                      color: ColorRes.PARKING_FEE_TITLE_GERY, fontSize: 15.0),
                ),
                Text(
                  parking_fee_unit,
                  style: TextStyle(
                    color: ColorRes.PARKING_FEE_TITLE_GERY,
                    fontSize: 24,
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Column(
              children: _feeItemData.map((data) {
                return ParkingFeeInfoItem(title: data.title, desc: data.desc)
                    .feeItemBuilder;
              }).toList(),
            ),
          )
        ],
      ),
    );
  }
}

class ParkingFeeInfoItem {
  ParkingFeeInfoItem({this.title, this.desc});

  final String title;
  final String desc;

  final TextStyle _style = TextStyle(
      color: ColorRes.PARKING_FEE_GERY, fontSize: ScreenUtil().setSp(13));

  Widget get feeItemBuilder {
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            title,
            style: _style,
          ),
          Text(
            desc,
            style: _style,
          )
        ],
      ),
    );
  }
}
