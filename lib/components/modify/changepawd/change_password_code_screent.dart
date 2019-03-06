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

//修改密码第一步204, 204, 204, 1/

class ModifyChangeCodePassword extends StatefulWidget {
  ModifyChangeCodePassword({@required this.mobile});

  final String mobile;

  @override
  State<StatefulWidget> createState() {
    return null;
  }
}

class _ModifyChangeCodePassword extends State<ModifyChangeCodePassword> {
  final TextEditingController _codeController1 = new TextEditingController();
  final TextEditingController _codeController2 = new TextEditingController();
  final TextEditingController _codeController3 = new TextEditingController();
  final TextEditingController _codeController4 = new TextEditingController();

  Timer _timer;
  int _countDownTime = 60;
  bool _isCountdown = false;

  @override
  void dispose() {
    super.dispose();
    _codeController1?.dispose();
    _codeController2?.dispose();
    _codeController3?.dispose();
    _codeController4?.dispose();
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
            children: <Widget>[
              _buildCodeTitleWidget(),
              _buildCodeSubTitleWidget(),
              _buildEdParentWidget()
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          _buildEdWidget(_codeController1),
          _buildEdWidget(_codeController2),
          _buildEdWidget(_codeController3),
          _buildEdWidget(_codeController4),
        ],
      ),
    );
  }

  Widget _buildEdWidget(TextEditingController controller) {
    return Container(
      //46, 49, 56, 1
      width: ScreenUtil().setWidth(50),
      height: ScreenUtil().setHeight(50),
      decoration: ShapeDecoration(
          color: Color.fromRGBO(46, 49, 56, 1),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(5.0)))),
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
          //内容改变的回调
//                    print('change');
        },
        onSubmitted: (text) {
          //内容提交(按回车)的回调
//                    print('submit');
        },
        controller: TextEditingController(text: controller.text),
        keyboardType: TextInputType.phone,
        //键盘类型
        textInputAction: TextInputAction.none,
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
        textAlign: TextAlign.left,
      ),
    );
  }
}
