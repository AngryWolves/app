import 'package:flutter/material.dart';
import 'package:smart_park/values/colors.dart';
import 'package:smart_park/values/strings.dart';
import 'package:smart_park/widget/text_field_widget.dart';
import 'package:smart_park/utils/input_manage_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:common_utils/common_utils.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ForgetScreen extends StatefulWidget {
  ForgetScreen(this.mobile);

  final String mobile;

  @override
  State<StatefulWidget> createState() {
    return _ForgetScreenState();
  }
}

class _ForgetScreenState extends State<ForgetScreen> {
  final _forgetPasswordTextController = TextEditingController();
  final _forgetCheckPasswordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 375, height: 667)..init(context);
    return Scaffold(
        backgroundColor: Colors.white,
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
                      forget_new_password_hint, _forgetPasswordTextController),
                ),
                Container(
                    margin: EdgeInsets.only(
                        left: ScreenUtil().setWidth(15),
                        right: ScreenUtil().setWidth(15)),
                    height: ScreenUtil().setHeight(49),
                    child: TextFieldWidget(forget_check_new_password_hint,
                        _forgetCheckPasswordTextController)),
                GestureDetector(
                  onTap: () {
                    InputManageUtil.shutdownInputKeyboard();
                    String password = _forgetPasswordTextController.text;
                    String checkPassword =
                        _forgetCheckPasswordTextController.text;
                    if (ObjectUtil.isEmptyString(password) ||
                        ObjectUtil.isEmptyString(checkPassword)) {
                      Fluttertoast.showToast(msg: forget_password_error_text);
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
                        top: ScreenUtil().setHeight(40),
                        left: ScreenUtil().setWidth(15),
                        right: ScreenUtil().setWidth(15),
                        bottom: ScreenUtil().setHeight(25)),
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
                    child: Text(forget_check_text,
                        style: TextStyle(
                            color: ColorRes.WHITE,
                            fontSize: ScreenUtil().setSp(16))),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
