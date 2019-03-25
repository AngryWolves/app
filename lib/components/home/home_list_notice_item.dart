import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_park/components/home/data/home_new_response.dart';
import 'package:smart_park/values/colors.dart';

class HomeNoticeItem extends StatelessWidget {
  HomeNoticeItem({this.data});

  final HomeNewData data;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: ColorRes.DIALOG_DIVIDER))),
      padding: const EdgeInsets.all(15.0),
      margin: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[_buildTitle(), _buildContent(), _buildData()],
      ),
    );
  }

  Widget _buildTitle() {
    return Text(
      data?.newsTitle ?? '',
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
          color: ColorRes.GERY_TEXT,
          fontSize: ScreenUtil().setSp(15),
          fontWeight: FontWeight.w600),
    );
  }

  Widget _buildContent() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15.0),
      child: ListView(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        children: <Widget>[
          Text(
            data?.newsContent ?? '',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                color: ColorRes.GERY_TEXT_HINT,
                fontSize: ScreenUtil().setSp(13)),
          )
        ],
      ),
    );
  }

  Widget _buildData() {
    return Text(
      data?.createTime ?? '',
      style: TextStyle(
          color: ColorRes.NOTICE_ITEM_DATA, fontSize: ScreenUtil().setSp(10)),
    );
  }
}
