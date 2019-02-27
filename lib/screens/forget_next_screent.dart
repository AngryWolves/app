import 'dart:async';

import 'package:flutter/material.dart';
import 'package:smart_park/values/colors.dart';
import 'package:smart_park/values/strings.dart';
import 'package:smart_park/widget/text_field_widget.dart';
import 'package:smart_park/utils/input_manage_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:common_utils/common_utils.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ForgetNextScreen extends StatefulWidget {
  ForgetNextScreen(this.mobile);

  final String mobile;

  @override
  State<StatefulWidget> createState() {
    return _ForgetNextScreenState();
  }
}

class _ForgetNextScreenState extends State<ForgetNextScreen> {
  final _forgetPhoneController = TextEditingController();
  final _forgetCodeController = TextEditingController();
  Timer _timer;
  int _countDownTime = 60;
  bool _isCountdown = false;

  @override
  void dispose() {
    super.dispose();
    _forgetCodeController?.dispose();
    _timer?.cancel();
  }

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
                      forget_next_mobile_hint,
                      _forgetPhoneController,
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
                          _forgetCodeController.text = text;
//                    print('change');
                        },
                        onSubmitted: (text) {
                          //内容提交(按回车)的回调
//                    print('submit');
                        },
                        controller: TextEditingController(
                            text: _forgetCodeController.text),
                        keyboardType: TextInputType.number,
                        style: TextStyle(
                            color: Color.fromRGBO(46, 49, 56, 1),
                            fontSize: ScreenUtil().setSp(15)),
                        //键盘类型
                        textInputAction: TextInputAction.none,
                        //显示的文字内容为 下一步
                        maxLength: 11,
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
                          _requestCode(_forgetPhoneController.text);
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
                    InputManageUtil.shutdownInputKeyboard();
                    String phone = _forgetPhoneController.text;
                    String code = _forgetCodeController.text;
                    if (!RegexUtil.isMobileExact(phone)) {
                      Fluttertoast.showToast(msg: login_mobile_error_text);
                      return;
                    }
                    if (ObjectUtil.isEmptyString(code)) {
                      Fluttertoast.showToast(msg: forget_check_error_code_text);
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
                    child: Text(forget_check_next_text,
                        style: TextStyle(
                            color: ColorRes.WHITE,
                            fontSize: ScreenUtil().setSp(16))),
                  ),
                ),
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
          _timer=null;
        }
      });
    });
  }
}
