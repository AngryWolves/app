import 'package:flutter/material.dart';
import 'package:smart_park/values/colors.dart';
import 'package:smart_park/values/strings.dart';
import 'package:smart_park/widget/text_field_widget.dart';
import 'package:smart_park/widget/common_app_bar.dart';
import 'package:smart_park/utils/input_manage_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:common_utils/common_utils.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:smart_park/data/response_successful_data.dart';
import 'package:smart_park/config/routes.dart';
import 'package:smart_park/widget/base/base_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:smart_park/dio/user_dao.dart';
import 'package:smart_park/redux/app_state.dart';

//手机号修改密码第二步/
class PersonalChangePasswordScreen extends StatefulWidget {
  PersonalChangePasswordScreen({@required this.mobile,this.code});
  final String mobile;
  final String code;
  @override
  State<StatefulWidget> createState() {
    return _PersonalChangePasswordScreenState();
  }
}

class _PersonalChangePasswordScreenState
    extends BaseState<PersonalChangePasswordScreen> {
  final _changePasswordTextController = TextEditingController();
  bool checkLegal = false;
  UserDao _dao;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  change_password_tag_text,
                  style: TextStyle(
                      color: Color.fromRGBO(46, 49, 56, 1),
                      fontSize: ScreenUtil().setSp(30)),
                ),
                Padding(
                  padding: EdgeInsets.only(top: ScreenUtil().setHeight(40)),
                  child: TextFieldWidget(
                    change_password_hint,
                    _changePasswordTextController,
                    isMobile: false,
                    obscureText: true,
                    maxLength: 18,
                    lineColor: Color.fromRGBO(46, 49, 56, 1),
                    onChanged: (text) {
                      setState(() {
                        if (ObjectUtil.isEmptyString(text)) {
                          checkLegal = false;
                          return;
                        }
                        if (text.length < 8) {
                          checkLegal = false;
                          return;
                        }
                        checkLegal = true;
                      });
                    },
                  ),
                ),
                GestureDetector(
                    onTap: () {
                      InputManageUtil.shutdownInputKeyboard();
                      if (!checkLegal) {
                        return;
                      }
                      _forget();
                      print("修改密码按钮点击");
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: ScreenUtil().setHeight(60)),
                      height: ScreenUtil().setHeight(45),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                          gradient: checkLegal
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
  void _forget() async{
    InputManageUtil.shutdownInputKeyboard();
    String password = _changePasswordTextController.text;
    if (ObjectUtil.isEmptyString(password)) {
      Fluttertoast.showToast(msg: forget_password_error_text);
      return;
    }
    if(ObjectUtil.isEmptyString(widget.mobile)||ObjectUtil.isEmptyString(widget.code)){
      return;
    }
    showLoading();
    _dao ??= UserDao(StoreProvider.of<AppState>(context));
    ResponseSuccessfulData responseSuccessfulData=await _dao.forget(widget.mobile, widget.code, password);
    hideLoading();
    if (responseSuccessfulData != null && responseSuccessfulData.result == 0) {
      Navigator.of(context).pushNamedAndRemoveUntil(
          Routes.doLogin, (Route<dynamic> route) => false);
    } else if (responseSuccessfulData.result == 1) {
      Fluttertoast.showToast(msg: !ObjectUtil.isEmptyString(responseSuccessfulData.msg)?responseSuccessfulData.msg:registered_third_result_1_text);
    }
  }
}
