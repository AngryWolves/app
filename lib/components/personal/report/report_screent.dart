import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:smart_park/values/colors.dart';
import 'package:smart_park/values/strings.dart';
import 'package:smart_park/widget/text_field_widget.dart';
import 'package:smart_park/utils/input_manage_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_park/widget/common_app_bar.dart';
import 'package:smart_park/router/navigator_util.dart';
import 'package:smart_park/components/personal/data/local_personal_data.dart';
import 'package:smart_park/values/json_strings.dart';
import 'package:smart_park/widgets/base/base_state.dart';

//数据报表/
class PersonalReportScreen extends StatefulWidget {
  PersonalReportScreen({@required this.userId});

  final String userId;

  @override
  State<StatefulWidget> createState() {
    return _PersonalReportScreenState();
  }
}

class _PersonalReportScreenState extends BaseState<PersonalReportScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(236, 236, 236, 1),
      appBar: buildCommonAppbar(report_title_text, onLeadTop: () {
        InputManageUtil.shutdownInputKeyboard();
        Navigator.pop(context);
      }),
      body: Column(
        children: <Widget>[
          _buildTopWidget(),
          _buildYearTitleWidget(),
          _buildPayWidget(0, 0),
          _buildRepairSituationWidget(),
          _buildRepairSituationListWidget()
        ],
      ),
    );
  }

  Widget _buildTopWidget() {
    return Container(
      height: ScreenUtil().setHeight(190),
      color: Color.fromRGBO(0, 0, 0, 51),
    );
  }

  Widget _buildYearTitleWidget() {
    return Container(
      height: ScreenUtil().setHeight(35),
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(
          left: ScreenUtil().setWidth(15), right: ScreenUtil().setWidth(15)),
      child: Row(
        children: <Widget>[
          Text(
            report_year_title_text,
            style: TextStyle(
                color: Color.fromRGBO(84, 86, 92, 1),
                fontSize: ScreenUtil().setSp(13)),
          ),
          Text(
            report_year_depict_title_text,
            style: TextStyle(
                color: Color.fromRGBO(143, 143, 143, 1),
                fontSize: ScreenUtil().setSp(9)),
          )
        ],
      ),
    );
  }

  Widget _buildPayWidget(payCount, firmCount) {
    return Container(
      color: Colors.white,
      height: ScreenUtil().setHeight(101),
      child: Column(
        children: <Widget>[
          Container(
            height: ScreenUtil().setHeight(50),
            margin: EdgeInsets.only(
                left: ScreenUtil().setWidth(28),
                right: ScreenUtil().setWidth(18)),
            child: Row(
              children: <Widget>[
                Text(
                  report_pay_count_text,
                  style: TextStyle(
                      color: Color.fromRGBO(46, 49, 56, 1),
                      fontSize: ScreenUtil().setSp(15)),
                ),
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Padding(
                        padding:
                            EdgeInsets.only(right: ScreenUtil().setWidth(10)),
                        child: Text(
                          payCount.toString() + " 万",
                          style: TextStyle(
                              color: Color.fromRGBO(46, 49, 56, 1),
                              fontSize: ScreenUtil().setSp(15)),
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Color.fromRGBO(143, 143, 143, 1),
                        size: 16.0,
                      )
                    ],
                  ),
                  flex: 1,
                )
              ],
            ),
          ),
          Container(
            color: Color.fromRGBO(240, 240, 240, 1),
            height: ScreenUtil().setHeight(1),
            margin: EdgeInsets.only(
                left: ScreenUtil().setWidth(15),
                right: ScreenUtil().setWidth(15)),
          ),
          Container(
            height: ScreenUtil().setHeight(50),
            margin: EdgeInsets.only(
                left: ScreenUtil().setWidth(28),
                right: ScreenUtil().setWidth(18)),
            child: Row(
              children: <Widget>[
                Text(
                  report_no_pay_firm_count_text,
                  style: TextStyle(
                      color: Color.fromRGBO(46, 49, 56, 1),
                      fontSize: ScreenUtil().setSp(15)),
                ),
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Padding(
                        padding:
                            EdgeInsets.only(right: ScreenUtil().setWidth(10)),
                        child: Text(
                          firmCount.toString() + " 家",
                          style: TextStyle(
                              color: Color.fromRGBO(46, 49, 56, 1),
                              fontSize: ScreenUtil().setSp(15)),
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Color.fromRGBO(143, 143, 143, 1),
                        size: 16.0,
                      )
                    ],
                  ),
                  flex: 1,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRepairSituationWidget() {
    return Container(
      alignment: Alignment.centerLeft,
      height: ScreenUtil().setHeight(35),
      margin: EdgeInsets.only(left: ScreenUtil().setWidth(15)),
      child: Text(
        report_repair_situation_text,
        style: TextStyle(
            color: Color.fromRGBO(84, 86, 92, 1),
            fontSize: ScreenUtil().setSp(13)),
      ),
    );
  }

  Widget _buildRepairSituationListWidget() {
    return Container(
      color: Colors.white,
      height: ScreenUtil().setHeight(210),
      child: Column(
        children: <Widget>[
          _buildRepairSituationItemWidget(report_repair_count_text, 32),
          _buildRepairSituationItemWidget(report_repair_review_text, 20),
          _buildRepairSituationItemWidget(report_repair_current_text, 10),
          _buildRepairSituationItemWidget(report_repair_new_text, 11),
          _buildRepairSituationItemWidget(report_repair_finish_text, 12)
        ],
      ),
    );
  }

  Widget _buildRepairSituationItemWidget(repairTitle, repairCount) {
    return Container(
      color: Colors.white,
      height: ScreenUtil().setHeight(42),
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(
          left: ScreenUtil().setWidth(15), right: ScreenUtil().setWidth(15)),
      child: Row(
        children: <Widget>[
          Container(
            width: ScreenUtil().setWidth(5),
            height: ScreenUtil().setWidth(5),
            decoration: BoxDecoration(
                color: Color.fromRGBO(37, 184, 247, 1),
                borderRadius: BorderRadius.all(Radius.circular(2.5))),
          ),
          Padding(padding: EdgeInsets.only(left: ScreenUtil().setWidth(9))),
          Text(
            repairTitle,
            style: TextStyle(
                color: Color.fromRGBO(37, 184, 247, 1),
                fontSize: ScreenUtil().setSp(15)),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.centerRight,
              child: Text(
                repairCount.toString() + " 件",
                style: TextStyle(
                    color: Color.fromRGBO(46, 49, 56, 1),
                    fontSize: ScreenUtil().setSp(15)),
              ),
            ),
            flex: 1,
          )
        ],
      ),
    );
  }
}
