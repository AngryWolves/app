import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_park/components/report_action/data/declare_response.dart';
import 'package:smart_park/dio/delcare_dao.dart';
import 'package:smart_park/redux/app_state.dart';
import 'package:smart_park/values/colors.dart';
import 'package:smart_park/values/strings.dart';
import 'package:smart_park/widget/base/base_state.dart';
import 'package:smart_park/widget/common_app_bar.dart';
import 'package:smart_park/widget/common_gradient_button.dart';
import 'package:smart_park/widget/common_stroke_button.dart';

class DetailPage extends StatefulWidget {
  DetailPage({this.newsTipId});

  final String newsTipId;

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends BaseState<DetailPage> {
  DeclareDao _declareDao;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCommonAppbar(report_action_detail_title, onLeadTop: onBack),
      body: FutureBuilder(
          future: _getDeclareDetail(),
          builder: (_, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Container(
                margin: const EdgeInsets.all(15.0),
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  children: <Widget>[
                    _buildHeadTitle(snapshot.data),
                    _buildDesc(snapshot.data)
                  ],
                ),
              );
            } else {
              return Container();
            }
          }),
    );
  }

  Widget _buildDesc(DeclareData data) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
//        Container(
//          margin: const EdgeInsets.only(top: 15.0),
//          height: ScreenUtil().setHeight(192),
//          child: CachedNetworkImage(
//            imageUrl: 'http://img8.zol.com.cn/bbs/upload/7676/7675079_0800.jpg',
//            width: double.infinity,
//            fit: BoxFit.fill,
//          ),
//        ),
        Padding(padding: const EdgeInsets.all(20.0)),
        Html(
          data: data?.newsContent ?? '',
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
  Widget _buildHeadTitle(DeclareData data) => Container(
        height: ScreenUtil().setHeight(30),
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: ColorRes.DIALOG_DIVIDER))),
        child: Text(
          data.newsTitle ?? '',
          style: TextStyle(color: ColorRes.GERY_TEXT, fontSize: 15.0),
        ),
      );

  Future<DeclareData> _getDeclareDetail() async {
    _declareDao ??= DeclareDao(StoreProvider.of<AppState>(context));

    return (await _declareDao.getDeclareDetail(newsTipId: widget.newsTipId))
        .data;
  }
}
