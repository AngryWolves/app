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
import 'package:image_picker/image_picker.dart';
import 'package:smart_park/widget/common_app_bar.dart';

class RegisteredThirdScreen extends StatefulWidget {
  RegisteredThirdScreen({@required this.mobile, this.code});

  final String mobile;
  final String code;

  @override
  State<StatefulWidget> createState() {
    return _RegisteredThirdScreenState();
  }
}

class _RegisteredThirdScreenState extends State<RegisteredThirdScreen> {
  final _registeredPasswordTextController = TextEditingController();
  final _registeredCheckPasswordTextController = TextEditingController();
  final _registeredUserNameTextController = TextEditingController();
  final _registeredGenderTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: buildCommonAppbar(registered_title_text, onLeadTop: () {
          InputManageUtil.shutdownInputKeyboard();
          Navigator.pop(context);
        }),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            color: ColorRes.WHITE,
            padding: EdgeInsets.only(top: ScreenUtil().setHeight(65)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'images/icon_login@3x.png',
                  width: ScreenUtil().setWidth(85),
                  height: ScreenUtil().setHeight(98),
                  fit: BoxFit.fill,
                ),
                Container(
                  margin: EdgeInsets.only(
                      left: ScreenUtil().setWidth(15),
                      right: ScreenUtil().setWidth(15),
                      top: ScreenUtil().setHeight(31)),
                  height: ScreenUtil().setHeight(50),
                  child: TextFieldWidget(registered_third_password_hint,
                      _registeredPasswordTextController),
                ),
                Container(
                    margin: EdgeInsets.only(
                        left: ScreenUtil().setWidth(15),
                        right: ScreenUtil().setWidth(15)),
                    height: ScreenUtil().setHeight(49),
                    child: TextFieldWidget(registered_third_check_password_hint,
                        _registeredCheckPasswordTextController)),
                Container(
                  margin: EdgeInsets.only(
                    left: ScreenUtil().setWidth(15),
                    right: ScreenUtil().setWidth(15),
                  ),
                  height: ScreenUtil().setHeight(50),
                  child: TextFieldWidget(registered_third_name_hint,
                      _registeredUserNameTextController),
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: ScreenUtil().setWidth(15),
                    right: ScreenUtil().setWidth(15),
                  ),
                  height: ScreenUtil().setHeight(50),
                  child: TextFieldWidget(registered_third_gender_hint,
                      _registeredGenderTextController),
                ),
                GestureDetector(
                  onTap: () {
                    String password = _registeredPasswordTextController.text;
                    String checkPassword =
                        _registeredCheckPasswordTextController.text;
                    String userName = _registeredUserNameTextController.text;
                    String gender = _registeredGenderTextController.text;
                    if (ObjectUtil.isEmptyString(password) ||
                        ObjectUtil.isEmptyString(checkPassword) ||
                        ObjectUtil.isEmptyString(userName) ||
                        ObjectUtil.isEmptyString(gender)) {
                      Fluttertoast.showToast(
                          msg: registered_third_empty_error_text);
                      return;
                    }
                    if (password != checkPassword) {
                      Fluttertoast.showToast(
                          msg: forget_password_same_error_text);
                      return;
                    }
                  },
                  child: Container(
                    margin: EdgeInsets.only(
                        top: ScreenUtil().setHeight(53),
                        bottom: ScreenUtil().setHeight(29)),
                    width: ScreenUtil().setWidth(345),
                    height: ScreenUtil().setHeight(45),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        gradient: LinearGradient(colors: [
                          Color.fromRGBO(95, 231, 243, 1.0),
                          Color.fromRGBO(95, 195, 243, 1.0),
                          Color.fromRGBO(95, 195, 243, 1.0)
                        ], begin: Alignment.topLeft, end: Alignment.topRight)),
                    child: Text(registered_third_ok_text,
                        style: TextStyle(
                            color: ColorRes.WHITE,
                            fontSize: ScreenUtil().setSp(16),
                            decoration: TextDecoration.none)),
                  ),
                ),
                Text(
                  registered_third_instructions_text,
                  style: TextStyle(
                      color: Color.fromRGBO(153, 153, 153, 1),
                      fontSize: ScreenUtil().setSp(12),
                      decoration: TextDecoration.none),
                )
              ],
            ),
          ),
        ));
  }
}
