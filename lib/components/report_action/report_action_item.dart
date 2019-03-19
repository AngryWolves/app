import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_park/router/navigator_util.dart';
import 'package:smart_park/values/colors.dart';

class ReportActionItem extends StatelessWidget {
  ReportActionItem({this.image});

  final String image;

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
            if (image.isEmpty) {

            } else {
                NavigatorUtil.goReportDetailPage(context);
            }
        },
        child: Container(
            height: ScreenUtil().setHeight(129),
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color: ColorRes.DIALOG_DIVIDER))),
            child: image.isEmpty ? _buildBodyWithoutImg() : _buildBodyImg(),
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
          '【项目申报】XXXXX可申报',
          style: _titleStyle,
        ),
        Text(
          '''
              由XXXXXXX公司承建的XXXX项目，位于XXXX海域，用海面积约为X公顷，主要建设内容包括XXXX、XXXX（...
              '''.trim(),
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
                  image: CachedNetworkImageProvider(image), fit: BoxFit.fill)),
        )
      ],
    );
  }
}
