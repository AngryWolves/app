import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_park/values/colors.dart';
import 'package:smart_park/values/strings.dart';
import 'package:smart_park/widget/base/base_state.dart';
import 'package:smart_park/widget/common_app_bar.dart';
import 'package:smart_park/widget/common_gradient_button.dart';
import 'package:smart_park/widget/common_stroke_button.dart';

class DetailPage extends StatefulWidget {
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends BaseState<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCommonAppbar(report_action_detail_title, onLeadTop: onBack),
      body: Container(
        margin: const EdgeInsets.all(15.0),
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: <Widget>[_buildHeadTitle(), _buildReport()],
        ),
      ),
    );
  }

  Widget _buildDesc() {
    return Column(
      children: <Widget>[
        Container(
          margin: const EdgeInsets.only(top: 15.0),
          height: ScreenUtil().setHeight(192),
          child: CachedNetworkImage(
            imageUrl: 'http://img8.zol.com.cn/bbs/upload/7676/7675079_0800.jpg',
            width: double.infinity,
            fit: BoxFit.fill,
          ),
        ),
        Padding(padding: const EdgeInsets.all(20.0)),
        Text(
          '''
        很抱歉通知各位园区的小伙伴们，本园区将于2019年2月13日晚9:30至10:30园区将进行断电维护。届时请小伙伴们提前应对，

谢谢。


                                                                      ----智慧园区运营团队
        '''
              .trim(),
          style: TextStyle(color: ColorRes.GERY_TEXT_HINT, fontSize: 13.0),
        )
      ],
    );
  }

  Widget _buildReport() {
    return Column(
      children: <Widget>[
        Text(
          '''
            接国防科工局的通知，现申报国防科工局“十三五”XXXX项目指南（第三批）的建议书。此次指南涉及领域广、项目数量多、涉密

谢谢。

                                                  ----智慧园区运营团队
            '''
              .trim(),
          style: TextStyle(color: ColorRes.GERY_TEXT_HINT, fontSize: 13.0),
        ),
        Container(
          height: ScreenUtil().setHeight(60),
          margin: const EdgeInsets.only(top: 30.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              color: ColorRes.DIALOG_DIVIDER),
          child: Stack(
            alignment: Alignment.bottomRight,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Icon(
                    Icons.insert_drive_file,
                    size: 38.0,
                  ),
                  Container(
                    margin: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                            child: Text(
                          'XXXXXXXX项目申报统一格式表格',
                          style: TextStyle(
                              color: ColorRes.GERY_TEXT_HINT, fontSize: 12.0),
                        )),
                        Text('文件大小：675KB',
                            style: TextStyle(
                                color: ColorRes.REPORT_ACTION_DETAIL_EXCEL_TIME,
                                fontSize: 9.0))
                      ],
                    ),
                  )
                ],
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 5.0, right: 5.0),
                height: ScreenUtil().setHeight(23),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    buildCommonStrokeButton(report_action_detail_share_wx,
                        width: 69),
                    Container(
                      margin: const EdgeInsets.only(left: 10.0),
                      width: ScreenUtil().setWidth(45),
                      child: GradientButton(
                        report_action_detail_share_download,
                        () {},
                        fontSize: 12,
                        radius: 3.0,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  ///
  /// 信息标题
  ///
  Widget _buildHeadTitle() => Container(
        height: ScreenUtil().setHeight(30),
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: ColorRes.DIALOG_DIVIDER))),
        child: Text(
          '【重要】园区将于2月13日夜间停电',
          style: TextStyle(color: ColorRes.GERY_TEXT, fontSize: 15.0),
        ),
      );
}
