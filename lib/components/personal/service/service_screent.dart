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

//联系客服/
class PersonalServiceScreen extends StatefulWidget {
  PersonalServiceScreen({@required this.userId});

  final String userId;

  @override
  State<StatefulWidget> createState() {
    return _PersonalServiceScreenState();
  }
}

class _PersonalServiceScreenState extends BaseState<PersonalServiceScreen> {
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(236, 236, 236, 1),
      appBar: buildCommonAppbar(service_title_text, onLeadTop: () {
        InputManageUtil.shutdownInputKeyboard();
        Navigator.pop(context);
      }),
      body: Container(
        margin: EdgeInsets.only(
            left: ScreenUtil().setWidth(15),
            right: ScreenUtil().setWidth(15),
            top: ScreenUtil().setHeight(10)),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(2.5), topRight: Radius.circular(2.5))),
        child: Column(
          children: <Widget>[_buildListTitle(), _buildListWidget(null)],
        ),
      ),
    );
  }

  Widget _buildListTitle() {
    return Container(
      alignment: Alignment.centerLeft,
      height: ScreenUtil().setHeight(35),
      padding: EdgeInsets.only(left: ScreenUtil().setWidth(14)),
      child: Row(
        children: <Widget>[
          Text(
            service_floor_text,
            style: TextStyle(
                color: Color.fromRGBO(143, 143, 143, 1),
                fontSize: ScreenUtil().setSp(12)),
          ),
          Padding(
              padding: EdgeInsets.only(left: ScreenUtil().setWidth(50)),
              child: Text(
                service_name_text,
                style: TextStyle(
                    color: Color.fromRGBO(143, 143, 143, 1),
                    fontSize: ScreenUtil().setSp(12)),
              )),
          Padding(
              padding: EdgeInsets.only(left: ScreenUtil().setWidth(70)),
              child: Text(
                service_phone_text,
                style: TextStyle(
                    color: Color.fromRGBO(143, 143, 143, 1),
                    fontSize: ScreenUtil().setSp(12)),
              ))
        ],
      ),
    );
  }

  Widget _buildListWidget(List<dynamic> objects) {
    return Expanded(
        child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return _buildItemWidget(null, index);
            }),
        flex: 1);
  }

  Widget _buildItemWidget(object, index) {
    return GestureDetector(
      onTap: () {
        print("item点击");
      },
      child: Container(
        height: ScreenUtil().setHeight(30),
        margin: EdgeInsets.only(
            left: ScreenUtil().setWidth(8), right: ScreenUtil().setWidth(8)),
        color: index % 2 == 0
            ? Color.fromRGBO(245, 245, 245, 1)
            : Color.fromRGBO(255, 255, 255, 1),
        alignment: Alignment.centerLeft,
        child: Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: ScreenUtil().setWidth(17)),
              child: Text(
                (index + 1).toString(),
                style: TextStyle(
                    color: Color.fromRGBO(46, 49, 56, 1),
                    fontSize: ScreenUtil().setSp(12)),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: ScreenUtil().setWidth(58)),
              child: Text(
                "孙大圣",
                style: TextStyle(
                    color: Color.fromRGBO(46, 49, 56, 1),
                    fontSize: ScreenUtil().setSp(12)),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: ScreenUtil().setWidth(83)),
              child: Text(
                "18598109872",
                style: TextStyle(
                    color: Color.fromRGBO(46, 49, 56, 1),
                    fontSize: ScreenUtil().setSp(12)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
