import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_park/values/colors.dart';
import 'package:smart_park/values/strings.dart';
import 'package:smart_park/widget/common_gradient_button.dart';

class RoomItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(260),
      margin: const EdgeInsets.only(top: 15.0),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: ColorRes.DIALOG_DIVIDER))),
      child: Column(
        children: <Widget>[_buildPreviewImage(), _buildRoomInfo()],
      ),
    );
  }

  ///
  /// 场地信息
  ///
  Widget _buildRoomInfo() {
    return Container(
      padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'xxxx会议室',
                style: TextStyle(color: ColorRes.GERY_TEXT, fontSize: 15.0),
              ),
              Text(
                reserve_equipment + '',
                style: TextStyle(
                    fontSize: 11.0, color: ColorRes.REPAIR_SELECT_TYPE_TITLE),
              )
            ],
          ),
          Container(
            width: ScreenUtil().setWidth(67),
            height: ScreenUtil().setHeight(30),
            child: GradientButton(
              reserve_item_now,
              () {},
              radius: 3.0,
              fontSize: 15,
            ),
          )
        ],
      ),
    );
  }

  ///
  /// 预览图
  ///
  Widget _buildPreviewImage() {
    return Container(
      child: Stack(
        children: <Widget>[
          CachedNetworkImage(
            imageUrl: 'http://img8.zol.com.cn/bbs/upload/7676/7675079_0800.jpg',
            fit: BoxFit.fill,
            height: ScreenUtil().setHeight(200),
            width: double.infinity,
          ),
        ],
      ),
    );
  }
}
