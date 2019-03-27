import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:smart_park/values/strings.dart';
import 'package:smart_park/utils/input_manage_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_park/widget/common_app_bar.dart';
import 'package:smart_park/values/json_strings.dart';
import 'package:common_utils/common_utils.dart';
import 'package:smart_park/widget/feedback_dialog_widget.dart';
import 'package:smart_park/dio/personal_dao.dart';
import 'package:smart_park/components/personal/repairs/data/repair_data_bean.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:smart_park/redux/app_state.dart';
import 'package:smart_park/config/application.dart';
//我的报修 注:0备货中1运输中2已撤销3已完成 共4种状态  0:待审核，1:审核成功, 2:驳回/
class PersonalRepairsScreen extends StatefulWidget {
  PersonalRepairsScreen({@required this.userId});

  final String userId;

  @override
  State<StatefulWidget> createState() {
    return _PersonalRepairsScreenState();
  }
}

class _PersonalRepairsScreenState extends State<PersonalRepairsScreen> {
  PersonalDao _dao;
  List<RepairData> listOfRepairData = [];

  @override
  void initState() {
    super.initState();

  }
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _getPersonalData();
  }
  void _getPersonalData() async {
    _dao ??= PersonalDao(StoreProvider.of<AppState>(context));
    RepairDataBean dataBean = await _dao.getRepairData(1);
    if (dataBean == null) {
      return;
    }
    setState(() {
      listOfRepairData.addAll(dataBean.data);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(236, 236, 236, 1),
      appBar: buildCommonAppbar(repairs_title_text, onLeadTop: () {
        InputManageUtil.shutdownInputKeyboard();
        Navigator.pop(context);
      }),
      body: Center(child: _buildListWidget(listOfRepairData)),
    );
  }

  Widget _buildListWidget(List<dynamic> objects) {
    return objects != null
        ? Container(
            padding: EdgeInsets.only(
                left: ScreenUtil().setWidth(15),
                right: ScreenUtil().setWidth(15),
                top: ScreenUtil().setHeight(15),
                bottom: ScreenUtil().setHeight(20)),
            child: ListView.builder(
                itemCount: objects.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {},
                    child: _buildItemWidget(objects[index], index),
                  );
                }),
          )
        : null;
  }

  Widget _buildItemWidget(dynamic obj, index) {
    return GestureDetector(
      onTap: () {
        print("item 点击");
      },
      child: Container(
        margin: EdgeInsets.only(bottom: ScreenUtil().setHeight(10)),
        width: ScreenUtil().setWidth(345),
        height: ScreenUtil().setHeight(135),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(5.0))),
        child: Padding(
          padding: EdgeInsets.only(
              left: ScreenUtil().setWidth(10),
              right: ScreenUtil().setWidth(10)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: ScreenUtil().setHeight(40),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: ScreenUtil().setWidth(15),
                      height: ScreenUtil().setHeight(27),
                      color: Color.fromRGBO(37, 184, 247, 1),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: ScreenUtil().setWidth(10),
                          top: ScreenUtil().setHeight(13)),
                      child: Text(
                        !ObjectUtil.isEmptyString(obj.applyContent)
                            ? obj.applyContent
                            : "",
                        style: TextStyle(
                            color: Color.fromRGBO(46, 49, 56, 1),
                            fontSize: ScreenUtil().setSp(15)),
                      ),
                    ),
                    Expanded(
                      child: _buildStateText(obj.applyStatus),
                      flex: 1,
                    )
                  ],
                ),
              ),
              Container(
                height: ScreenUtil().setWidth(1),
                color: Color.fromRGBO(240, 240, 240, 1),
              ),
              Container(
                height: ScreenUtil().setHeight(51),
                alignment: Alignment.centerLeft,
                child: Row(
                  children: <Widget>[
                    _buildStateTitleWidget(obj.applyStatus),
                    Padding(
                      padding: EdgeInsets.only(
                          left: ScreenUtil().setWidth(15),
                          right: ScreenUtil().setWidth(15)),
                      child: Container(
                        width: ScreenUtil().setWidth(1),
                        height: ScreenUtil().setHeight(10),
                        color: Color.fromRGBO(240, 240, 240, 1),
                      ),
                    ),
                    _buildNumberWidget('20190123')
                  ],
                ),
              ),
              obj.applyStatus == 0
                  ? _buildStateStockingGroupWidget(obj)
                  : Container(),
              obj.applyStatus == 1
                  ? _buildStateMoveGroupWidget(obj)
                  : Container(),
              obj.applyStatus == 3
                  ? _buildStateProblemGroupWidget(obj)
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStateText(applyStatus) {
    return Container(
      alignment: Alignment.centerRight,
      child: Text(
        applyStatus == 2
            ? repairs_revoke_state_text
            : applyStatus == 3 ? repairs_finish_state_text : "",
        style: TextStyle(
            color: Color.fromRGBO(177, 177, 179, 1),
            fontSize: ScreenUtil().setSp(12)),
      ),
    );
  }

  Widget _buildStateTitleWidget(applyStatus) {
    return Text(
      repairs_state_title +
          (applyStatus == 0
              ? repairs_stocking_state_text
              : applyStatus == 1
                  ? repairs_move_state_text
                  : applyStatus == 2
                      ? repairs_revoke_state_text
                      : applyStatus == 3 ? repairs_finish_state_text : ""),
      style: TextStyle(
          color: Color.fromRGBO(46, 49, 56, 1),
          fontSize: ScreenUtil().setSp(12)),
    );
  }

  Widget _buildNumberWidget(numberString) {
    return Text(
      repairs_number_title +
          (!ObjectUtil.isEmptyString(numberString) ? numberString : ""),
      style: TextStyle(
          color: Color.fromRGBO(46, 49, 56, 1),
          fontSize: ScreenUtil().setSp(12)),
    );
  }

  Widget _buildStateStockingGroupWidget(obj) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        _buildStateRevokeWidget(obj),
        Padding(padding: EdgeInsets.only(left: ScreenUtil().setWidth(10))),
        _buildStateCriteriaWidget(obj)
      ],
    );
  }

  Widget _buildStateMoveGroupWidget(obj) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        _buildStateRevokeWidget(obj),
        Padding(padding: EdgeInsets.only(left: ScreenUtil().setWidth(10))),
        _buildStateContactWidget(obj)
      ],
    );
  }

  Widget _buildStateProblemGroupWidget(obj) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        _buildStateProblemWidget(obj),
      ],
    );
  }

  //撤销报修Button/
  Widget _buildStateRevokeWidget(obj) {
    return GestureDetector(
      onTap: () {
        showDialog(
            barrierDismissible: true,
            context: context,
            builder: (context) {
              return FeedBackDialog(
                height: 149,
                title: repairs_feedback_revoke_title,
                subTitle: repairs_feedback_revoke_content_title,
              );
            });
        print('撤销报修Button点击');
      },
      child: Container(
        padding: EdgeInsets.only(
            left: ScreenUtil().setWidth(11),
            right: ScreenUtil().setWidth(11),
            top: ScreenUtil().setHeight(9),
            bottom: ScreenUtil().setHeight(9)),
        decoration: BoxDecoration(
            border:
                Border.all(width: 1.0, color: Color.fromRGBO(177, 177, 179, 1)),
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(3.0))),
        alignment: Alignment.center,
        child: Text(
          repairs_revoke_button_text,
          style: TextStyle(
              color: Color.fromRGBO(177, 177, 179, 1),
              fontSize: ScreenUtil().setSp(12)),
        ),
      ),
    );
  }

  //提醒审核Button/
  Widget _buildStateCriteriaWidget(obj) {
    return GestureDetector(
      onTap: () {
        showDialog(
            barrierDismissible: true,
            context: context,
            builder: (context) {
              return FeedBackDialog(
                height: 149,
                title: repairs_feedback_criteria_title,
                subTitle: repairs_feedback_criteria_content_title,
              );
            });
        print('提醒审核Button点击');
      },
      child: Container(
        padding: EdgeInsets.only(
            left: ScreenUtil().setWidth(11),
            right: ScreenUtil().setWidth(11),
            top: ScreenUtil().setHeight(9),
            bottom: ScreenUtil().setHeight(9)),
        decoration: BoxDecoration(
            border:
                Border.all(width: 1.0, color: Color.fromRGBO(46, 49, 56, 1)),
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(3.0))),
        alignment: Alignment.center,
        child: Text(
          repairs_criteria_button_text,
          style: TextStyle(
              color: Color.fromRGBO(46, 49, 56, 1),
              fontSize: ScreenUtil().setSp(12)),
        ),
      ),
    );
  }

  //联系维修人员Button/
  Widget _buildStateContactWidget(obj) {
    return GestureDetector(
      onTap: () {
        print('联系维修人员Button点击');
      },
      child: Container(
        padding: EdgeInsets.only(
            left: ScreenUtil().setWidth(11),
            right: ScreenUtil().setWidth(11),
            top: ScreenUtil().setHeight(10),
            bottom: ScreenUtil().setHeight(10)),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(3.0)),
            gradient: LinearGradient(colors: [
              Color.fromRGBO(95, 231, 243, 1),
              Color.fromRGBO(95, 195, 243, 1),
              Color.fromRGBO(71, 135, 213, 1)
            ], begin: Alignment.topLeft, end: Alignment.topRight)),
        alignment: Alignment.center,
        child: Text(
          repairs_contact_button_text,
          style: TextStyle(
              color: Color.fromRGBO(255, 255, 255, 1),
              fontSize: ScreenUtil().setSp(12)),
        ),
      ),
    );
  }

  //仍有问题Button/
  Widget _buildStateProblemWidget(obj) {
    return GestureDetector(
      onTap: () {
        showDialog(
            barrierDismissible: true,
            context: context,
            builder: (context) {
              return FeedBackDialog(
                height: 149,
                isShowCancel: false,
                title: repairs_feedback_problem_title,
                subTitle: repairs_feedback_problem_content_title,
              );
            });
        print('仍有问题Button点击');
      },
      child: Container(
        padding: EdgeInsets.only(
            left: ScreenUtil().setWidth(11),
            right: ScreenUtil().setWidth(11),
            top: ScreenUtil().setHeight(9),
            bottom: ScreenUtil().setHeight(9)),
        decoration: BoxDecoration(
            border:
                Border.all(width: 1.0, color: Color.fromRGBO(46, 49, 56, 1)),
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(3.0))),
        alignment: Alignment.center,
        child: Text(
          repairs_problem_button_text,
          style: TextStyle(
              color: Color.fromRGBO(46, 49, 56, 1),
              fontSize: ScreenUtil().setSp(12)),
        ),
      ),
    );
  }
}
