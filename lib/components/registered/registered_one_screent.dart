import 'dart:async';

import 'package:flutter/material.dart';
import 'package:smart_park/values/colors.dart';
import 'package:smart_park/values/strings.dart';
import 'package:smart_park/widget/text_field_widget.dart';
import 'package:smart_park/utils/input_manage_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:common_utils/common_utils.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:smart_park/widget/common_app_bar.dart';
import 'package:smart_park/router/navigator_util.dart';
import 'package:flutter/services.dart';
import 'package:smart_park/config/routes.dart';
import 'package:smart_park/widget/base/base_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:smart_park/dio/user_dao.dart';
import 'package:smart_park/redux/app_state.dart';

class RegisteredOneScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RegisteredOneScreenState();
  }
}

class _RegisteredOneScreenState extends BaseState<RegisteredOneScreen> {
  final _registeredPhoneController = TextEditingController();
  final _registeredCodeController = TextEditingController();
  Timer _timer;
  int _countDownTime = 60;
  bool _isCountdown = false;
  UserDao _dao;

  @override
  void dispose() {
    super.dispose();
    _registeredPhoneController?.dispose();
    _timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 375, height: 667)..init(context);
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
                      registered_one_mobile_hint,
                      _registeredPhoneController,
                      isMobile: true,
                    )),
                Stack(
                  alignment: Alignment.bottomRight,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(
                          left: ScreenUtil().setWidth(15),
                          right: ScreenUtil().setWidth(15)),
                      height: ScreenUtil().setHeight(49),
                      child: TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.only(
                                top: ScreenUtil().setHeight(22)),
                            hintText: forget_next_check_code_hint,
                            hintStyle: TextStyle(
                                color: ColorRes.COLOR_LOGIN_HINT,
                                fontSize: ScreenUtil().setSp(15))),
                        onChanged: (text) {
                          //内容改变的回调
                          _registeredCodeController.text = text;
//                    print('change');
                        },
                        onSubmitted: (text) {
                          //内容提交(按回车)的回调
//                    print('submit');
                        },
                        controller: TextEditingController.fromValue(TextEditingValue(
                            text: _registeredCodeController.text,
                            selection: TextSelection.fromPosition(TextPosition(
                                affinity: TextAffinity.downstream,
                                offset: _registeredCodeController.text.length)))),
                        keyboardType: TextInputType.number,
                        style: TextStyle(
                            color: Color.fromRGBO(46, 49, 56, 1),
                            fontSize: ScreenUtil().setSp(15)),
                        //显示的文字内容为 下一步
                        inputFormatters: [LengthLimitingTextInputFormatter(6)],
                        //最大长度
                        maxLines: 1,
                        //最大行数
                        autocorrect: false,
                        //是否自动更正
                        autofocus: false,
                        //是否自动对焦
                        obscureText: false,
                        //是否是密码
                        textAlign: TextAlign.left,
                        //文本对齐方式
                      ),
                    ),
                    GestureDetector(
                        onTap: () {
                          _requestCode(_registeredPhoneController.text);
                        },
                        child: Container(
                          padding: EdgeInsets.only(
                              bottom: ScreenUtil().setHeight(14),
                              right: ScreenUtil().setWidth(15)),
                          child: _buildCodeGet(),
                        ))
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: ScreenUtil().setWidth(15),
                    right: ScreenUtil().setWidth(15),
                  ),
                  height: ScreenUtil().setHeight(1),
                  color: ColorRes.COLOR_LOGIN_BORDER_SIDE,
                ),
                GestureDetector(
                  onTap: () {
                    print("下一步点击");
                    _checkNext(_registeredPhoneController.text,
                        _registeredCodeController.text);
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
                    child: Text(forget_check_next_text,
                        style: TextStyle(
                            color: ColorRes.WHITE,
                            fontSize: ScreenUtil().setSp(16))),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    print("已有账户,去登录点击");
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        Routes.doLogin, (Route<dynamic> route) => false);
                  },
                  child: Text(
                    registered_one_go_login_text,
                    style: TextStyle(
                        color: Color.fromRGBO(37, 184, 247, 1),
                        fontSize: ScreenUtil().setSp(14)),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: ScreenUtil().setHeight(92)),
                  child: Text(
                    registered_one_instructions_text,
                    style: TextStyle(
                        color: Color.fromRGBO(153, 153, 153, 1),
                        fontSize: ScreenUtil().setSp(12)),
                  ),
                )
              ],
            ),
          ),
        ));
  }

  Widget _buildCodeGet() {
    if (_isCountdown && _countDownTime > 0) {
      return Text(
        forget_next_again_get_code_text +
            "(" +
            _countDownTime.toString() +
            "s)",
        style: TextStyle(
            color: Color.fromRGBO(37, 184, 247, 1),
            fontSize: ScreenUtil().setSp(12)),
      );
    } else {
      return Text(
        forget_next_get_code_text,
        style: TextStyle(
            color: Color.fromRGBO(171, 171, 171, 1),
            fontSize: ScreenUtil().setSp(12)),
      );
    }
  }

  void _requestCode(String mobile) {
    if (_isCountdown && _countDownTime != 60) {
      return;
    }
    if (!RegexUtil.isMobileExact(mobile)) {
      Fluttertoast.showToast(msg: login_mobile_error_text);
      return;
    }
    _isCountdown = true;
    _timer = Timer.periodic(Duration(seconds: 1), (duration) {
      setState(() {
        _countDownTime -= 1;
        if (_countDownTime <= 0) {
          //  倒计时结束
          _countDownTime = 60;
          _isCountdown = false;
          _timer.cancel();
          _timer = null;
        }
      });
    });
    _getCode(mobile);
  }

  void _getCode(phone) async {
    InputManageUtil.shutdownInputKeyboard();
    if (!RegexUtil.isMobileExact(phone)) {
      Fluttertoast.showToast(msg: login_mobile_error_text);
      return;
    }
    showLoading();
    _dao ??= UserDao(StoreProvider.of<AppState>(context));
    await _dao.getCode(phone, 1);
    hideLoading();
  }

  void _checkNext(phone, String code) {
    InputManageUtil.shutdownInputKeyboard();
    if (_isCountdown == false || _countDownTime == 60) {
      Fluttertoast.showToast(msg: forget_check_get_code_error_text);
      return;
    }
    if (!RegexUtil.isMobileExact(phone)) {
      Fluttertoast.showToast(msg: login_mobile_error_text);
      return;
    }
    if (ObjectUtil.isEmptyString(code) || code.length != 6) {
      Fluttertoast.showToast(msg: forget_check_error_code_text);
      return;
    }
    NavigatorUtil.goRegisteredTwo(context, phone, code);
  }
}
