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
import 'package:smart_park/dio/user_dao.dart';
import 'package:smart_park/widget/base/base_state.dart';
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
import 'package:smart_park/data/response_successful_data.dart';

//修改邮箱/
class ModifyChangeMailScreen extends StatefulWidget {
  ModifyChangeMailScreen();

  @override
  State<StatefulWidget> createState() {
    return _modifyChangeMailScreenState();
  }
}

class _modifyChangeMailScreenState extends BaseState<ModifyChangeMailScreen> {
  final _changePasswordTextController = TextEditingController();
  bool _isCheckMail = false;
  UserDao _dao;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildCommonAppbar(change_mail_title_text, onLeadTop: () {
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
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  change_mail_title_text,
                  style: TextStyle(
                      color: Color.fromRGBO(46, 49, 56, 1),
                      fontSize: ScreenUtil().setSp(30)),
                ),
                Padding(
                  padding: EdgeInsets.only(top: ScreenUtil().setHeight(40)),
                  child: TextFieldWidget(
                    change_mail_hint,
                    _changePasswordTextController,
                    maxLength: 50,
                    obscureText: false,
                    lineColor: Color.fromRGBO(46, 49, 56, 1),
                    onChanged: (text) {
                      setState(() {
                        _isCheckMail = RegexUtil.isEmail(text);
                      });
                    },
                  ),
                ),
                GestureDetector(
                    onTap: () {
                      _setEmail(_changePasswordTextController.text);
                      print("修改密码按钮点击");
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: ScreenUtil().setHeight(60)),
                      height: ScreenUtil().setHeight(45),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                          gradient: _isCheckMail
                              ? LinearGradient(
                                  colors: [
                                      Color.fromRGBO(95, 231, 243, 1.0),
                                      Color.fromRGBO(95, 195, 243, 1.0),
                                      Color.fromRGBO(95, 195, 243, 1.0)
                                    ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.topRight)
                              : LinearGradient(
                                  colors: [
                                      Color.fromRGBO(204, 204, 204, 1),
                                      Color.fromRGBO(204, 204, 204, 1),
                                      Color.fromRGBO(204, 204, 204, 1)
                                    ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.topRight)),
                      child: Text(change_password_check_text,
                          style: TextStyle(
                              color: ColorRes.WHITE,
                              fontSize: ScreenUtil().setSp(16))),
                    ))
              ],
            ),
          )),
    );
  }

  void _setEmail(String email) async {
    InputManageUtil.shutdownInputKeyboard();
    if (!_isCheckMail) {
      return;
    }
    _dao ??= UserDao(StoreProvider.of<AppState>(context));
    showLoading();
    ResponseSuccessfulData responseSuccessfulData = await _dao.setEmail(email);
    hideLoading();
    if (responseSuccessfulData != null && responseSuccessfulData.result == 0) {
      Navigator.pop(context);
    }
  }
}
