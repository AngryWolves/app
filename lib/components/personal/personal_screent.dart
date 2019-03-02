import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:smart_park/values/colors.dart';
import 'package:smart_park/values/strings.dart';
import 'package:smart_park/widget/text_field_widget.dart';
import 'package:smart_park/utils/input_manage_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:common_utils/common_utils.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:smart_park/widget/common_app_bar.dart';
import 'package:smart_park/components/personal/data/local_personal_data.dart';
import 'package:smart_park/values/json_strings.dart';

class PersonalScreen extends StatefulWidget {
//  PersonalScreen({@required this.personalId});

//  final String personalId;

  @override
  State<StatefulWidget> createState() {
    return _PersonalScreenState();
  }
}

class _PersonalScreenState extends State<PersonalScreen> {
  final List<String> items = ["我的报修", "我的缴费", "我的预约", "信息修改", "联系客服", "数据报表"];
  final localJson = json.decode(JsonStrings.localPersonal);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(236, 236, 236, 1),
      appBar: buildCommonAppbar(personal_title_text, onLeadTop: () {
        InputManageUtil.shutdownInputKeyboard();
        Navigator.pop(context);
      }),
      body: Column(
        children: <Widget>[
          Container(
            color: Colors.white,
            height: ScreenUtil().setHeight(95),
            child: Row(
              children: <Widget>[
                _buildIconWidget(),
                _buildInfoWidget(),
                _buildCcecsWidget()
              ],
            ),
          ),
          _buildListWidget(items)
        ],
      ),
    );
  }

  Widget _buildIconWidget() {
    return GestureDetector(
      onTap: () {
        print("头像点击");
      },
      child: Column(
        children: <Widget>[
          Container(
            width: ScreenUtil().setWidth(91),
            padding: EdgeInsets.only(
                left: ScreenUtil().setWidth(17),
                right: ScreenUtil().setHeight(17),
                top: ScreenUtil().setHeight(17),
                bottom: ScreenUtil().setHeight(5)),
            child: Image.asset(
              'images/icon_login@3x.png',
              width: ScreenUtil().setWidth(57),
              height: ScreenUtil().setHeight(57),
              fit: BoxFit.fill,
            ),
          ),
          Container(
            width: ScreenUtil().setWidth(91),
            alignment: Alignment.center,
            child: Text(
              personal_revise_text,
              style: TextStyle(
                  color: Color.fromRGBO(143, 143, 143, 1),
                  fontSize: ScreenUtil().setSp(9)),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildInfoWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          width: ScreenUtil().setWidth(172),
          padding: EdgeInsets.only(
              top: ScreenUtil().setHeight(20),
              right: ScreenUtil().setWidth(10)),
          child: Text(
            '林先生',
            textAlign: TextAlign.left,
            maxLines: 1,
            style: TextStyle(
                color: Color.fromRGBO(46, 49, 56, 1),
                fontSize: ScreenUtil().setSp(21)),
          ),
        ),
        Container(
          width: ScreenUtil().setWidth(172),
          padding: EdgeInsets.only(
              top: ScreenUtil().setHeight(10),
              right: ScreenUtil().setWidth(10)),
          child: Text(
            '部门经理人',
            textAlign: TextAlign.left,
            maxLines: 1,
            style: TextStyle(
                color: Color.fromRGBO(143, 143, 143, 1),
                fontSize: ScreenUtil().setSp(12)),
          ),
        ),
        Container(
          width: ScreenUtil().setWidth(172),
          padding: EdgeInsets.only(
              top: ScreenUtil().setHeight(5), right: ScreenUtil().setWidth(10)),
          child: Text(
            '上海xxxx股份有限公司',
            textAlign: TextAlign.left,
            maxLines: 1,
            style: TextStyle(
                color: Color.fromRGBO(143, 143, 143, 1),
                fontSize: ScreenUtil().setSp(12)),
          ),
        )
      ],
    );
  }

  Widget _buildCcecsWidget() {
    return Column(
      children: <Widget>[
        Padding(padding: EdgeInsets.only(top: ScreenUtil().setHeight(19))),
        Image.asset(
          'images/icon_ccecs.png',
          width: ScreenUtil().setWidth(79),
          height: ScreenUtil().setHeight(22),
          fit: BoxFit.fill,
        ),
        Padding(padding: EdgeInsets.only(top: ScreenUtil().setHeight(3))),
        Image.asset(
          'images/icon_login@3x.png',
          width: ScreenUtil().setWidth(52),
          height: ScreenUtil().setHeight(45),
          fit: BoxFit.fill,
        ),
      ],
    );
  }

  Widget _buildListWidget(List<String> items) {
    return Container(
        height: ScreenUtil().setHeight(276),
        margin: EdgeInsets.only(
            left: ScreenUtil().setWidth(15),
            right: ScreenUtil().setWidth(15),
            top: ScreenUtil().setHeight(15)),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(5.0))),
        child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              return Container(
                height: ScreenUtil().setHeight(46),
                child: Row(
                  children: <Widget>[_buildItemIcon(), _buildItemTitle()],
                ),
              );
            }));
  }

  Widget _buildItemIcon() {
    return Container(
      color: Colors.blue,
      width: ScreenUtil().setWidth(27),
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(
          left: ScreenUtil().setWidth(15)),
      child: Image.asset(
        'images/icon_choose@3x.png',
        width: ScreenUtil().setWidth(15),
        height: ScreenUtil().setHeight(16),
        fit: BoxFit.fill,
      ),
    );
  }

  Widget _buildItemTitle() {
    return Container(
      color: Colors.red,
      alignment: Alignment.centerLeft,
      child: Text(
        '林先生',
        textAlign: TextAlign.left,
        maxLines: 1,
        style: TextStyle(
            color: Color.fromRGBO(46, 49, 56, 1),
            fontSize: ScreenUtil().setSp(21)),
      ),
    );
  }
}
