import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:smart_park/components/reserve/item/room_info_head.dart';
import 'package:smart_park/dio/reserve_dao.dart';
import 'package:smart_park/redux/app_state.dart';
import 'package:smart_park/values/colors.dart';
import 'package:smart_park/values/strings.dart';
import 'package:smart_park/widget/base/base_state.dart';
import 'package:smart_park/widget/common_app_bar.dart';
import 'package:smart_park/widget/common_gradient_button.dart';

class ReserveConfirmPage extends StatefulWidget {
  ReserveConfirmPage(
      {this.dateTime, this.startTime, this.endTime, this.yardId});

  final String dateTime;
  final String startTime;
  final String endTime;
  final String yardId;

  @override
  _ReserveConfirmPageState createState() => _ReserveConfirmPageState();
}

class _ReserveConfirmPageState extends BaseState<ReserveConfirmPage> {
  final TextStyle _style =
      TextStyle(color: ColorRes.REPAIR_SELECT_TYPE_TITLE, fontSize: 12.0);
  final TextStyle _infoStyle =
      TextStyle(color: ColorRes.GERY_TEXT, fontSize: 14.0);

  final TextEditingController _controller = TextEditingController();

  ReserveDao _reserveDao;

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
            () {
              _createAppointment();
            },
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
          Text.rich(
              TextSpan(text: reserve_confirm_time, style: _style, children: [
            TextSpan(
                text:
                    '${widget.dateTime} ${widget.startTime}-${widget.endTime}',
                style: _infoStyle)
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
              controller: _controller,
              maxLines: 10,
              decoration: InputDecoration.collapsed(
                  hintText: reserve_confirm_remarks_hint),
            ),
          )
        ],
      ),
    );
  }

  void _createAppointment() async {
    _reserveDao ??= ReserveDao(StoreProvider.of<AppState>(context));
    debugPrint('''
            startTime:::::${widget.startTime}, endTime::${widget.endTime}
            placeDate:::${widget.dateTime},
            note:::${_controller.text}
            '''
        .trim());
    showLoading();
    var response = await _reserveDao.createAppointment(
        beginTime: '${widget.dateTime} ${widget.startTime}:00',
        endTime: '${widget.dateTime} ${widget.endTime}:00',
        note: _controller.text,
        yardId: widget.yardId,
        placeDate: widget.dateTime);
    hideLoading();
    var msg = response?.msg;
    if (msg != null) {
      Fluttertoast.showToast(msg: msg);
    }
  }
}
