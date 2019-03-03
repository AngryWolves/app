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
//我的报修/
class PersonalRepairsScreen extends StatefulWidget {
  PersonalRepairsScreen({@required this.userId});

  final String userId;

  @override
  State<StatefulWidget> createState() {
    return _PersonalRepairsScreenState();
  }
}

class _PersonalRepairsScreenState extends State<PersonalRepairsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(236, 236, 236, 1),
      appBar: buildCommonAppbar(repairs_title_text, onLeadTop: () {
        InputManageUtil.shutdownInputKeyboard();
        Navigator.pop(context);
      }),
      body: Center(
        child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {},
                child: _buildItemWidget(),
              );
            }),
      ),
    );
  }

  Widget _buildItemWidget() {
    return Container(
      margin: EdgeInsets.only(
          left: ScreenUtil().setWidth(15),
          right: ScreenUtil().setWidth(15),
          top: ScreenUtil().setHeight(10)),
      width: ScreenUtil().setWidth(345),
      height: ScreenUtil().setHeight(135),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(5.0))),
      child: Padding(
        padding: EdgeInsets.only(
            left: ScreenUtil().setWidth(10), right: ScreenUtil().setWidth(10)),
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
                      '弱电报修',
                      style: TextStyle(
                          color: Color.fromRGBO(46, 49, 56, 1),
                          fontSize: ScreenUtil().setSp(15)),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.centerRight,
                      child: Text("受理中..."),
                    ),
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
                  Text(
                    '预约日期：2019-01-27',
                    style: TextStyle(
                        color: Color.fromRGBO(46, 49, 56, 1),
                        fontSize: ScreenUtil().setSp(12)),
                  ),
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
                  Text(
                    '工单编号：20190123',
                    style: TextStyle(
                        color: Color.fromRGBO(46, 49, 56, 1),
                        fontSize: ScreenUtil().setSp(12)),
                  )
                ],
              ),
            ),
            Row(
              children: <Widget>[
                Text(
                  '上门时间：13:00',
                  style: TextStyle(
                      color: Color.fromRGBO(46, 49, 56, 1),
                      fontSize: ScreenUtil().setSp(12)),
                ),
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 1.0,
                                color: Color.fromRGBO(177, 177, 179, 1)),
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(3.0))),
                        padding: EdgeInsets.all(ScreenUtil().setHeight(7)),
                        alignment: Alignment.topRight,
                        child: Text('撤销报修'),
                      )
                    ],
                  ),
                  flex: 1,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
