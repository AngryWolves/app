import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_park/values/colors.dart';
import 'package:smart_park/values/strings.dart';
import 'package:smart_park/widget/base/base_state.dart';
import 'package:smart_park/widget/common_app_bar.dart';

class ReserveSelectDate extends StatefulWidget {
  @override
  _ReserveSelectDateState createState() => _ReserveSelectDateState();
}

class _ReserveSelectDateState extends BaseState<ReserveSelectDate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCommonAppbar(reserve_select_date_title, onLeadTop: onBack),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[_buildReserveHead()],
        ),
      ),
    );
  }

  ///
  /// 场地的信息
  ///
  Widget _buildReserveHead() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15.0),
      color: Colors.white,
      child: Column(
        children: <Widget>[_roomInfoBuilder],
      ),
    );
  }

  ///
  /// 场地预览图, 描述信息
  ///
  Widget get _roomInfoBuilder {
    return Container(
      height: ScreenUtil().setHeight(83),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: ColorRes.DIALOG_DIVIDER))),
      child: Row(
        children: <Widget>[
          CachedNetworkImage(
            imageUrl: 'http://img8.zol.com.cn/bbs/upload/7676/7675079_0800.jpg',
            fit: BoxFit.fill,
            width: ScreenUtil().setWidth(104),
            height: ScreenUtil().setHeight(60),
          ),
          Container(
            margin:
                const EdgeInsets.symmetric(vertical: 12.0, horizontal: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'xxxx会议室',
                  style: TextStyle(color: ColorRes.GERY_TEXT, fontSize: 15.0),
                ),
                Padding(padding: const EdgeInsets.all(8.0)),
                Text(
                  reserve_select_date_location,
                  style: TextStyle(
                      color: ColorRes.REPAIR_SELECT_TYPE_TITLE, fontSize: 11.0),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
