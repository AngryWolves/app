import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_park/components/personal/data/local_personal_data.dart';
import 'package:smart_park/router/navigator_util.dart';
import 'package:smart_park/utils/input_manage_util.dart';
import 'package:smart_park/values/json_strings.dart';
import 'package:smart_park/values/strings.dart';
import 'package:smart_park/widget/common_app_bar.dart';

class PersonalScreen extends StatefulWidget {
//  PersonalScreen({@required this.personalId});

//  final String personalId;

  @override
  State<StatefulWidget> createState() {
    return _PersonalScreenState();
  }
}

class _PersonalScreenState extends State<PersonalScreen> {
  @override
  Widget build(BuildContext context) {
    final localPersonalJson = json.decode(JsonStrings.localPersonal);
    final localPersonalObjects =
        localPersonalJson.map((o) => LocalPersonalData.fromJson(o));

    final listOfLocalPersonalObjects = localPersonalObjects.toList();
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
          _buildListWidget(listOfLocalPersonalObjects)
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
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(
            top: ScreenUtil().setHeight(20),
            right: ScreenUtil().setWidth(10),
            bottom: ScreenUtil().setWidth(10)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
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
        ),
      ),
    );
  }

  Widget _buildCcecsWidget() {
    return Container(
      padding: EdgeInsets.only(right: ScreenUtil().setHeight(15)),
      child: Column(
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
      ),
    );
  }

  Widget _buildListWidget(List<dynamic> objects) {
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
            itemCount: objects.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  if (index == null) {
                    return;
                  }
                  switch (index) {
                    //我的报修
                    case 0:
                      NavigatorUtil.goRepairs(context, '');
                      break;
                    //我的缴费
                    case 1:
                      NavigatorUtil.goPayment(context);
                      break;
                    //我的预约
                    case 2:
                      NavigatorUtil.goAppointment(context, "");
                      break;
                    //信息修改
                    case 3:
                      NavigatorUtil.goModify(context, "");
                      break;
                    //联系客服
                    case 4:
                      NavigatorUtil.goService(context, "");
                      break;
                    //数据报表
                    case 5:
                      NavigatorUtil.goReport(context, "");
                      break;
                  }
                },
                child: Container(
                  height: ScreenUtil().setHeight(46),
                  child: Row(
                    children: <Widget>[
                      _buildItemIcon(objects[index]),
                      _buildItemTitle(objects[index]),
                      _buildItemBackIcon()
                    ],
                  ),
                ),
              );
//              return _buildItemWidget(objects[index], index);
            }));
  }

  Widget _buildItemListTile(dynamic obj, index) {
    return Container(
      height: ScreenUtil().setHeight(46),
      child: ListTile(
        leading: Image.asset(
          obj.imagePath,
          width: ScreenUtil().setWidth(15),
          height: ScreenUtil().setHeight(16),
          fit: BoxFit.fill,
        ),
        //item 前置图标
        title: Text(
          obj.title,
          maxLines: 1,
          style: TextStyle(
              color: Color.fromRGBO(46, 49, 56, 1),
              fontSize: ScreenUtil().setSp(15)),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          color: Color.fromRGBO(177, 177, 179, 1),
          size: 11.0,
        ),
        onTap: () {},
      ),
    );
  }

  Widget _buildItemIcon(dynamic obj) {
    return Container(
      color: Colors.transparent,
      width: ScreenUtil().setWidth(27),
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(left: ScreenUtil().setWidth(15)),
      child: Image.asset(
        obj.imagePath,
        width: ScreenUtil().setWidth(15),
        height: ScreenUtil().setHeight(16),
        fit: BoxFit.fill,
      ),
    );
  }

  Widget _buildItemTitle(dynamic obj) {
    return Container(
      color: Colors.transparent,
      alignment: Alignment.centerLeft,
      child: Text(
        obj.title,
        textAlign: TextAlign.left,
        maxLines: 1,
        style: TextStyle(
            color: Color.fromRGBO(46, 49, 56, 1),
            fontSize: ScreenUtil().setSp(15)),
      ),
    );
  }

  Widget _buildItemBackIcon() {
    return Container(
      color: Colors.transparent,
      width: ScreenUtil().setWidth(225),
      alignment: Alignment.centerRight,
      child: Icon(
        Icons.arrow_forward_ios,
        color: Color.fromRGBO(177, 177, 179, 1),
        size: 11.0,
      ),
    );
  }
}
