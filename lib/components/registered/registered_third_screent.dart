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
import 'package:smart_park/widget/gender_dialog.dart';

class RegisteredThirdScreen extends StatefulWidget {
  RegisteredThirdScreen({@required this.mobile, this.code});

  final String mobile;
  final String code;
  String _gender = '男';

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
                  child: TextFieldWidget(
                    registered_third_password_hint,
                    _registeredPasswordTextController,
                    maxLength: 12,
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(
                        left: ScreenUtil().setWidth(15),
                        right: ScreenUtil().setWidth(15)),
                    height: ScreenUtil().setHeight(49),
                    child: TextFieldWidget(
                      registered_third_check_password_hint,
                      _registeredCheckPasswordTextController,
                      maxLength: 12,
                    )),
                Container(
                  margin: EdgeInsets.only(
                    left: ScreenUtil().setWidth(15),
                    right: ScreenUtil().setWidth(15),
                  ),
                  height: ScreenUtil().setHeight(50),
                  child: TextFieldWidget(
                    registered_third_name_hint,
                    _registeredUserNameTextController,
                    maxLength: 15,
                  ),
                ),
                _buildGenderWidget(),
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

  Widget _buildGenderWidget() {
    return GestureDetector(
      onTap: () {
        showDialog(
            barrierDismissible: true,
            context: context,
            builder: (context) {
              return GenderDialog(
                onSureState: (String firm) {
                  this.setState(() {
                    widget._gender = firm;
                  });
                },
              );
            });
        print("性别选择点击");
      },
      child: Container(
        margin: EdgeInsets.only(
          left: ScreenUtil().setWidth(15),
          right: ScreenUtil().setWidth(15),
        ),
        decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(color: Color.fromRGBO(240, 240, 240, 1))),
        ),
        height: ScreenUtil().setHeight(45),
        alignment: Alignment.centerLeft,
        child: Row(
          children: <Widget>[
            Text(
              registered_third_gender_title,
              style: TextStyle(
                  color: Color.fromRGBO(46, 49, 56, 1),
                  fontSize: ScreenUtil().setSp(15)),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Padding(
                      padding:
                          EdgeInsets.only(right: ScreenUtil().setWidth(10)),
                      child: Text(
                        widget._gender,
                        style: TextStyle(
                            color: Color.fromRGBO(46, 49, 56, 1),
                            fontSize: ScreenUtil().setSp(15)),
                      )),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Color.fromRGBO(46, 49, 56, 1),
                    size: 15.0,
                  )
                ],
              ),
              flex: 1,
            )
          ],
        ),
      ),
    );
  }
}
