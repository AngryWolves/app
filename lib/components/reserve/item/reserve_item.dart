import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_park/components/reserve/data/yard_response.dart';
import 'package:smart_park/router/navigator_util.dart';
import 'package:smart_park/values/colors.dart';
import 'package:smart_park/values/strings.dart';
import 'package:smart_park/widget/common_gradient_button.dart';

class RoomItem extends StatelessWidget {
  const RoomItem({Key key, this.data}) : super(key: key);

  final YardData data;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(260),
      margin: const EdgeInsets.only(top: 15.0),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: ColorRes.DIALOG_DIVIDER))),
      child: Column(
        children: <Widget>[_buildPreviewImage(), _buildRoomInfo(context)],
      ),
    );
  }

  ///
  /// 场地信息
  ///
  Widget _buildRoomInfo(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                data?.position ?? '',
                style: TextStyle(color: ColorRes.GERY_TEXT, fontSize: 15.0),
              ),
              Text(
                reserve_equipment + '${data?.equipment ?? ''}',
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
              () {
                NavigatorUtil.goReserveSelectDatePage(context, yardId: data.yardId);
              },
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
          Container(
            height: ScreenUtil().setHeight(200),
            child: CachedNetworkImage(
              imageUrl: data?.imageUrl ?? '',
              fit: BoxFit.fill,
              width: double.infinity,
            ),
          ),
        ],
      ),
    );
  }
}
