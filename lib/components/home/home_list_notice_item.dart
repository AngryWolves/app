import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_park/values/colors.dart';
import 'package:smart_park/values/strings.dart';

class HomeNoticeItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxHeight: ScreenUtil().setHeight(165)),
      padding: const EdgeInsets.all(15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildNoticeTitle(),
          _buildTitle(),
          _buildContent(),
          _buildData()
        ],
      ),
    );
  }

  Widget _buildTitle() {
    return Text(
      '【重要】园区将于2月13日夜间停电',
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
          color: ColorRes.GERY_TEXT,
          fontSize: ScreenUtil().setSp(15),
          fontWeight: FontWeight.w600),
    );
  }

  Widget _buildContent() {
    return Text(
      '很抱歉通知各位园区的小伙伴们，本园区将于2019年2月13日晚9:30至10：30'
          '进行断电维护。请于断电前对工很抱歉通知各位园区的小伙伴们',
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
          color: ColorRes.GERY_TEXT_HINT, fontSize: ScreenUtil().setSp(13)),
    );
  }

  Widget _buildData() {
    return Text(
      '2019年2月1日',
      style: TextStyle(
          color: ColorRes.NOTICE_ITEM_DATA, fontSize: ScreenUtil().setSp(10)),
    );
  }

  Widget _buildNoticeTitle() {
    return Text(
      home_notice_item_title,
      style: TextStyle(
          color: ColorRes.GERY_TEXT,
          fontSize: ScreenUtil().setSp(18),
          fontWeight: FontWeight.w600),
    );
  }
}
