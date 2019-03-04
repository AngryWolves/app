import 'package:flutter/material.dart';
import 'package:smart_park/values/colors.dart';
import 'package:smart_park/values/strings.dart';
import 'package:smart_park/widget/text_field_widget.dart';
import 'package:smart_park/widget/common_app_bar.dart';
import 'package:smart_park/router/navigator_util.dart';
import 'package:smart_park/utils/input_manage_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:common_utils/common_utils.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _LoginScreenState();
  }
}

class _LoginScreenState extends State<LoginScreen> {
  final _loginPhoneTextController = TextEditingController();
  final _loginPasswordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 375, height: 667)..init(context);
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: buildCommonAppbar(login_title_text, onLeadTop: () {
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
                      login_check_mobile_hint,
                      _loginPhoneTextController,
                      isMobile: true,
                    )),
                Container(
                    margin: EdgeInsets.only(
                        left: ScreenUtil().setWidth(15),
                        right: ScreenUtil().setWidth(15)),
                    height: ScreenUtil().setHeight(50),
                    child: TextFieldWidget(
                      login_check_password_hint,
                      _loginPasswordTextController,
                      maxLength: 12,
                    )),
                GestureDetector(
                  onTap: () {
                    InputManageUtil.shutdownInputKeyboard();
                    String phone = _loginPhoneTextController.text;
                    String password = _loginPasswordTextController.text;
                    if (!RegexUtil.isMobileExact(phone)) {
                      Fluttertoast.showToast(msg: login_mobile_error_text);
                      return;
                    }
                    if (ObjectUtil.isEmptyString(password)) {
                      Fluttertoast.showToast(msg: login_password_error_text);
                      return;
                    }
                    print('登录点击');
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
                    child: Text(login_text,
                        style: TextStyle(
                            color: ColorRes.WHITE,
                            fontSize: ScreenUtil().setSp(16))),
                  ),
                ),
                FlatButton(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onPressed: () {
                    InputManageUtil.shutdownInputKeyboard();
                    NavigatorUtil.goForget(context);
                    print('忘记密码点击');
                  },
                  child: Text(
                    login_forget_password_text,
                    style: TextStyle(
                        color: Color.fromRGBO(37, 184, 247, 1),
                        fontSize: ScreenUtil().setSp(14)),
                  ),
                ),
                FlatButton(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  padding: EdgeInsets.only(
                    top: ScreenUtil().setHeight(86),
                  ),
                  onPressed: () {
                    InputManageUtil.shutdownInputKeyboard();
                    NavigatorUtil.goRegisteredOne(context);
                    print('注册点击');
                  },
                  child: Text(
                    login_registered_text,
                    style: TextStyle(
                        color: Color.fromRGBO(37, 184, 247, 1),
                        fontSize: ScreenUtil().setSp(14)),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}