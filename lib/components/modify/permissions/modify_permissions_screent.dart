import 'dart:async';
import 'dart:io';

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
import 'package:flutter/material.dart';
import 'package:smart_park/values/colors.dart';
import 'package:smart_park/values/strings.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smart_park/router/navigator_util.dart';
import 'package:smart_park/widget/common_app_bar.dart';
import 'package:smart_park/utils/input_manage_util.dart';
import 'package:smart_park/widget/firm_dialog.dart';

class ModifyPermissionsScreen extends StatefulWidget {
  ModifyPermissionsScreen({@required this.userId});

  final String userId;

  @override
  State<StatefulWidget> createState() {
    return _ModifyPermissionsScreen();
  }
}

class _ModifyPermissionsScreen extends State<ModifyPermissionsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildCommonAppbar(permissions_title_text, onLeadTop: () {
        InputManageUtil.shutdownInputKeyboard();
        Navigator.pop(context);
      }),
      body: Container(
        padding: EdgeInsets.only(
            left: ScreenUtil().setWidth(15), right: ScreenUtil().setWidth(15)),
        child: Column(
          children: <Widget>[
            _firmInfoWidget(),
            Container(
              height: ScreenUtil().setHeight(1),
              color: Color.fromRGBO(240, 240, 240, 1),
            ),
            _buildPermissionsInfoWidget(),
            _buildPermissionsInfoWidget(),
            _buildPermissionsInfoWidget()
          ],
        ),
      ),
    );
  }

  Widget _firmInfoWidget() {
    return Container(
      height: ScreenUtil().setHeight(70),
      child: Row(
        children: <Widget>[
          Image.asset(
            'images/icon_login@3x.png',
            width: ScreenUtil().setWidth(49),
            height: ScreenUtil().setHeight(42),
            fit: BoxFit.fill,
          ),
          Padding(
            padding: EdgeInsets.only(left: ScreenUtil().setWidth(15)),
            child: Text(
              "上海xxxx股份有限公司",
              style: TextStyle(
                  color: Color.fromRGBO(46, 49, 56, 1),
                  fontSize: ScreenUtil().setSp(18)),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildPermissionsInfoWidget() {
    return ExpansionTile(
      title: Text(
        "总经理",
        style: TextStyle(
            color: Color.fromRGBO(46, 49, 56, 1),
            fontSize: ScreenUtil().setSp(15)),
      ),
      children: <Widget>[
        Container(
          height: ScreenUtil().setHeight(70),
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(left: ScreenUtil().setWidth(85)),
          child: Text(
            "张得三",
            style: TextStyle(
                color: Color.fromRGBO(46, 49, 56, 1),
                fontSize: ScreenUtil().setSp(15)),
          ),
        ),
        Container(
          height: ScreenUtil().setHeight(70),
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(left: ScreenUtil().setWidth(85)),
          child: Text(
            "李得四",
            style: TextStyle(
                color: Color.fromRGBO(46, 49, 56, 1),
                fontSize: ScreenUtil().setSp(15)),
          ),
        )
      ],
    );
  }
}
