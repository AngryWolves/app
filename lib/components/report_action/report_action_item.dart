import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_park/components/report_action/data/declare_response.dart';
import 'package:smart_park/router/navigator_util.dart';
import 'package:smart_park/values/colors.dart';

class ReportActionItem extends StatelessWidget {
  ReportActionItem({this.data});

  final DeclareData data;

  final TextStyle _titleStyle =
      TextStyle(color: ColorRes.GERY_TEXT, fontSize: 15.0);
  final TextStyle _contentStyle =
      TextStyle(color: ColorRes.GERY_TEXT_HINT, fontSize: 13.0);
  final TextStyle _timeStyle =
      TextStyle(color: ColorRes.NOTICE_ITEM_DATA, fontSize: 10.0);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
            NavigatorUtil.goReportDetailPage(context, data?.newstipId);
        },
        child: Container(
            height: ScreenUtil().setHeight(129),
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color: ColorRes.DIALOG_DIVIDER))),
            child: _buildBodyWithoutImg(),
        ),
    );
  }

  ///
  /// 纯文字 item
  ///
  Widget _buildBodyWithoutImg() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          data?.newsTitle ?? '',
          style: _titleStyle,
        ),
        Text(
          data?.newsContent ?? '',
          style: _contentStyle,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        Text(
          '2019年2月11日',
          style: _timeStyle,
        ),
      ],
    );
  }

  ///
  /// 带图片 item
  ///
  Widget _buildBodyImg() {
    return Row(
      children: <Widget>[
        Expanded(
          child: _buildBodyWithoutImg(),
        ),
        Padding(padding: const EdgeInsets.all(5.0)),
        Container(
          width: ScreenUtil().setWidth(104),
          height: ScreenUtil().setHeight(73),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3.0),
              image: DecorationImage(
                  image: CachedNetworkImageProvider(''), fit: BoxFit.fill)),
        )
      ],
    );
  }
}
