import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:smart_park/values/colors.dart';
import 'package:smart_park/values/strings.dart';
import 'package:smart_park/widget/text_field_widget.dart';
import 'package:smart_park/widget/common_app_bar.dart';
import 'package:smart_park/router/navigator_util.dart';
import 'package:smart_park/utils/input_manage_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:common_utils/common_utils.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:smart_park/dio/user_dao.dart';
import 'package:smart_park/widget/base/base_state.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:smart_park/redux/app_state.dart';
import 'package:smart_park/data/user_data.dart';
import 'package:smart_park/config/routes.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _LoginScreenState();
  }
}

class _LoginScreenState extends BaseState<LoginScreen> {
  final _loginPhoneTextController = TextEditingController();
  final _loginPasswordTextController = TextEditingController();

  UserDao _dao;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 375, height: 667)..init(context);
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: buildCommonAppbar(login_title_text, onLeadTop: () {
          InputManageUtil.shutdownInputKeyboard();
          SystemNavigator.pop();
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
                      isMobile: false,
                      obscureText: true,
                      maxLength: 18,
                    )),
                GestureDetector(
                  onTap: () {
                    _login(_loginPhoneTextController.text,
                        _loginPasswordTextController.text);
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

  void _login(phone, password) async {
    InputManageUtil.shutdownInputKeyboard();
    if (!RegexUtil.isMobileExact(phone)) {
      Fluttertoast.showToast(msg: login_mobile_error_text);
      return;
    }
    if (ObjectUtil.isEmptyString(password) ||
        password.length < 6 ||
        password.length > 18) {
      Fluttertoast.showToast(msg: login_password_error_text);
      return;
    }
    _dao ??= UserDao(StoreProvider.of<AppState>(context));
    showLoading();
    LoginResponse model = await _dao.login(phone, password);
    hideLoading();
    UserData userData = model?.userData;
    if (userData == null) {
      return;
    }
    Navigator.of(context).pushNamedAndRemoveUntil(
        Routes.doHome, (Route<dynamic> route) => false);
  }
}
