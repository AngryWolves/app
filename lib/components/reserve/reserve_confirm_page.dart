import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_park/components/reserve/item/room_info_head.dart';
import 'package:smart_park/values/colors.dart';
import 'package:smart_park/values/strings.dart';
import 'package:smart_park/widget/base/base_state.dart';
import 'package:smart_park/widget/common_app_bar.dart';
import 'package:smart_park/widget/common_gradient_button.dart';

class ReserveConfirmPage extends StatefulWidget {
  @override
  _ReserveConfirmPageState createState() => _ReserveConfirmPageState();
}

class _ReserveConfirmPageState extends BaseState<ReserveConfirmPage> {
  final TextStyle _style =
      TextStyle(color: ColorRes.REPAIR_SELECT_TYPE_TITLE, fontSize: 12.0);
  final TextStyle _infoStyle =
      TextStyle(color: ColorRes.GERY_TEXT, fontSize: 14.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCommonAppbar(reserve_confirm_title, onLeadTop: onBack),
      body: Column(
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  RoomInfoHead().roomInfoBuilder,
                  _buildFee(),
                  _buildRemarks()
                ],
              ),
            ),
          ),
          GradientButton(
            reserve_confirm,
            () {},
            height: 45,
            radius: 0.0,
          )
        ],
      ),
    );
  }

  ///
  /// 预约信息确认
  ///
  Widget _buildFee() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text.rich(TextSpan(
              text: reserve_confirm_time,
              style: _style,
              children: [
                TextSpan(text: '019-01-23 13:00-15:30', style: _infoStyle)
              ])),
          Padding(
            padding: const EdgeInsets.all(10.0),
          ),
          Text.rich(TextSpan(
              text: reserve_confirm_fee,
              style: _style,
              children: [TextSpan(text: '300元', style: _infoStyle)])),
        ],
      ),
    );
  }

  ///
  /// 添加备注
  ///
  Widget _buildRemarks() {
    return Container(
      margin: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            reserve_confirm_remarks,
            style: _style,
          ),
          Container(
            height: ScreenUtil().setHeight(141),
            margin: const EdgeInsets.only(top: 10.0),
            child: TextField(
              maxLines: 10,
              decoration: InputDecoration.collapsed(
                  hintText: reserve_confirm_remarks_hint),
            ),
          )
        ],
      ),
    );
  }
}
