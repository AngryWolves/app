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
import 'package:smart_park/widget/text_field_widget.dart';
import 'package:flutter/services.dart';
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

//手机号修改密码第一步204, 204, 204, 1/

class ModifyChangeCodePassword extends StatefulWidget {
  ModifyChangeCodePassword({@required this.mobile});

  final String mobile;

  @override
  State<StatefulWidget> createState() {
    return _ModifyChangeCodePassword();
  }
}

class _ModifyChangeCodePassword extends State<ModifyChangeCodePassword> {
  final TextEditingController _codeController1 = new TextEditingController();
  final FocusNode _focusNode1 = FocusNode();
  final TextEditingController _codeController2 = new TextEditingController();
  final FocusNode _focusNode2 = FocusNode();
  final TextEditingController _codeController3 = new TextEditingController();
  final FocusNode _focusNode3 = FocusNode();
  final TextEditingController _codeController4 = new TextEditingController();
  final FocusNode _focusNode4 = FocusNode();
  Timer _timer;
  int _countDownTime = 60;
  bool _isCountdown = false;
  bool _isNextEnable = false;

  @override
  void initState() {
    super.initState();
    _focusNode1.addListener(() {
      if (!_focusNode1.hasFocus) {
        // TextField has lost focus
        setState(() {});
      }
    });
    _focusNode2.addListener(() {
      if (!_focusNode2.hasFocus) {
        // TextField has lost focus
        setState(() {});
      }
    });
    _focusNode3.addListener(() {
      if (!_focusNode3.hasFocus) {
        // TextField has lost focus
        setState(() {});
      }
    });
    _focusNode4.addListener(() {
      if (!_focusNode4.hasFocus) {
        // TextField has lost focus
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _codeController1?.dispose();
    _codeController2?.dispose();
    _codeController3?.dispose();
    _codeController4?.dispose();
    _focusNode1?.dispose();
    _focusNode2?.dispose();
    _focusNode3?.dispose();
    _focusNode4?.dispose();
    _timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCommonAppbar(change_password_title_text, onLeadTop: () {
        InputManageUtil.shutdownInputKeyboard();
        Navigator.pop(context);
      }),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          margin: EdgeInsets.only(
              left: ScreenUtil().setWidth(30),
              right: ScreenUtil().setWidth(30),
              top: ScreenUtil().setHeight(30)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _buildCodeTitleWidget(),
              _buildCodeSubTitleWidget(),
              _buildEdParentWidget(),
              _buildNextWidget()
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCodeTitleWidget() {
    return Text(
      change_password_code_text,
      style: TextStyle(
          color: Color.fromRGBO(46, 49, 56, 1),
          fontSize: ScreenUtil().setSp(30)),
    );
  }

  Widget _buildCodeSubTitleWidget() {
    return Container(
      margin: EdgeInsets.only(top: ScreenUtil().setHeight(19)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            change_password_mobile_country_text + widget.mobile,
            style: TextStyle(
                color: Color.fromRGBO(46, 49, 56, 1),
                fontSize: ScreenUtil().setSp(15)),
          ),
          GestureDetector(
              onTap: () {
                _requestCode(widget.mobile);
                print("重新获取Code");
              },
              child: _buildCodeGet()),
        ],
      ),
    );
  }

  Widget _buildCodeGet() {
    if (_isCountdown && _countDownTime > 0) {
      return Text(
        change_password_code_send_text +
            _countDownTime.toString() +
            change_password_code_time_text,
        style: TextStyle(
            color: Color.fromRGBO(37, 184, 247, 1),
            fontSize: ScreenUtil().setSp(15)),
      );
    } else {
      return Text(
        change_password_code_again_send_text,
        style: TextStyle(
            color: Color.fromRGBO(37, 184, 247, 1),
            fontSize: ScreenUtil().setSp(15)),
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
  }

  Widget _buildEdParentWidget() {
    return Container(
      height: ScreenUtil().setHeight(133),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          _buildEdWidget(_codeController1, _focusNode1, 0),
          _buildEdWidget(_codeController2, _focusNode2, 1),
          _buildEdWidget(_codeController3, _focusNode3, 2),
          _buildEdWidget(_codeController4, _focusNode4, 3),
        ],
      ),
    );
  }

  Widget _buildEdWidget(
      TextEditingController controller, FocusNode _focusNode, index) {
    return Container(
      //46, 49, 56, 1
      width: ScreenUtil().setWidth(50),
      height: ScreenUtil().setHeight(50),
      decoration: BoxDecoration(
        border: Border.all(
            width: 1.0,
            color: !_focusNode.hasFocus
                ? Color.fromRGBO(46, 49, 56, 0.3)
                : Color.fromRGBO(46, 49, 56, 1)),
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
      ),
      alignment: Alignment.center,
      child: TextField(
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: '',
            hintStyle: TextStyle(
                color: ColorRes.COLOR_LOGIN_HINT,
                fontSize: ScreenUtil().setSp(15))),
        onChanged: (text) {
          controller.text = text;
          setState(() {
            if (!ObjectUtil.isEmptyString(controller.text)) {
              if (index == 0) {
                FocusScope.of(context).requestFocus(_focusNode2);
              } else if (index == 1) {
                FocusScope.of(context).requestFocus(_focusNode3);
              } else if (index == 2) {
                FocusScope.of(context).requestFocus(_focusNode4);
              } else if (index == 3) {
//                FocusScope.of(context).requestFocus(_focusNode1);
              }
            }
            if (!ObjectUtil.isEmptyString(_codeController1.text) &&
                !ObjectUtil.isEmptyString(_codeController2.text) &&
                !ObjectUtil.isEmptyString(_codeController3.text) &&
                !ObjectUtil.isEmptyString(_codeController4.text)) {
              _isNextEnable = true;
            } else {
              _isNextEnable = false;
            }
          });
          //内容改变的回调
//                    print('change');
        },
        focusNode: _focusNode,
        onSubmitted: (text) {
          //内容提交(按回车)的回调
          print('submit' + text);
        },
        controller: TextEditingController.fromValue(TextEditingValue(
            text: controller.text,
            selection: TextSelection.fromPosition(TextPosition(
                affinity: TextAffinity.downstream,
                offset: controller.text.length)))),
        keyboardType: TextInputType.phone,
        //显示的文字内容为 下一步
        style: TextStyle(
            color: Color.fromRGBO(46, 49, 56, 1),
            fontSize: ScreenUtil().setSp(15)),
//          maxLength: 11,
        //最大长度，设置此项会让TextField右下角有一个输入数量的统计字符串
        //这种情况一般是不符合我们设计的要求的，但是有需要限制其输入的位数
        inputFormatters: [LengthLimitingTextInputFormatter(1)],
        maxLines: 1,
        //最大行数
        autocorrect: false,
        //是否自动更正
        autofocus: false,
        //是否自动对焦
        obscureText: false,
        //是否是密码
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildNextWidget() {
    return GestureDetector(
        onTap: () {
          if (!_isNextEnable) {
            return;
          }
          String code1 = _codeController1.text;
          String code2 = _codeController2.text;
          String code3 = _codeController3.text;
          String code4 = _codeController4.text;
          if (ObjectUtil.isEmptyString(code1) ||
              ObjectUtil.isEmptyString(code2) ||
              ObjectUtil.isEmptyString(code3) ||
              ObjectUtil.isEmptyString(code4)) {
            return;
          }
          NavigatorUtil.goChangePassword(context);
          print("下一步点击");
        },
        child: Container(
          margin: EdgeInsets.only(top: ScreenUtil().setHeight(60)),
          height: ScreenUtil().setHeight(45),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              gradient: _isNextEnable
                  ? LinearGradient(colors: [
                      Color.fromRGBO(95, 231, 243, 1.0),
                      Color.fromRGBO(95, 195, 243, 1.0),
                      Color.fromRGBO(95, 195, 243, 1.0)
                    ], begin: Alignment.topLeft, end: Alignment.topRight)
                  : LinearGradient(colors: [
                      Color.fromRGBO(204, 204, 204, 1),
                      Color.fromRGBO(204, 204, 204, 1),
                      Color.fromRGBO(204, 204, 204, 1)
                    ], begin: Alignment.topLeft, end: Alignment.topRight)),
          child: Text(change_password_code_check_text,
              style: TextStyle(
                  color: ColorRes.WHITE, fontSize: ScreenUtil().setSp(16))),
        ));
  }
}
