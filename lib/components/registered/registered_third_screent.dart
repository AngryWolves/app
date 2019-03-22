import 'package:flutter/material.dart';
import 'package:smart_park/values/colors.dart';
import 'package:smart_park/values/strings.dart';
import 'package:smart_park/utils/input_manage_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:common_utils/common_utils.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:smart_park/widget/common_app_bar.dart';
import 'package:smart_park/widget/gender_dialog.dart';
import 'package:flutter/services.dart';
import 'package:smart_park/dio/user_dao.dart';
import 'package:smart_park/redux/app_state.dart';
import 'package:smart_park/widget/company_list_dialog.dart';
import 'package:smart_park/widget/base/base_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:smart_park/data/response_successful_data.dart';
import 'package:smart_park/config/routes.dart';

class RegisteredThirdScreen extends StatefulWidget {
  RegisteredThirdScreen(
      {@required this.mobile,
      this.code,
      this.idCardFrontUrl,
      this.idCardBackUrl});

  final String mobile;
  final String code;
  final String idCardFrontUrl;
  final String idCardBackUrl;

  @override
  State<StatefulWidget> createState() {
    return _RegisteredThirdScreenState();
  }
}

class _RegisteredThirdScreenState extends BaseState<RegisteredThirdScreen> {
  UserDao _dao;
  String _gender = '男';
  String _company;
  String _companyId;
  final _registeredPasswordTextController = TextEditingController();
  final _registeredCheckPasswordTextController = TextEditingController();
  final _registeredUserNameTextController = TextEditingController();
  final _registeredMailTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: buildCommonAppbar(registered_title_text, onLeadTop: () {
          InputManageUtil.shutdownInputKeyboard();
          Navigator.pop(context);
        }),
        resizeToAvoidBottomPadding: false,
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          reverse: true,
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
                  margin: EdgeInsets.only(top: ScreenUtil().setHeight(30)),
                ),
                _buildItemWidget(
                    registered_third_password_title,
                    _registeredPasswordTextController,
                    registered_third_password_hint,
                    18,
                    true,
                    TextInputType.text),
                _buildItemWidget(
                    registered_third_check_password_title,
                    _registeredCheckPasswordTextController,
                    registered_third_check_password_hint,
                    18,
                    true,
                    TextInputType.text),
                _buildItemWidget(
                    registered_third_mail_title,
                    _registeredMailTextController,
                    registered_third_mail_hint,
                    50,
                    false,
                    TextInputType.emailAddress),
                _buildItemWidget(
                    registered_third_name_title,
                    _registeredUserNameTextController,
                    registered_third_name_hint,
                    8,
                    false,
                    TextInputType.text),
                _buildGenderWidget(),
                _buildCompanyWidget(),
                GestureDetector(
                  onTap: () {
                    _register();
                  },
                  child: Container(
                    margin: EdgeInsets.only(
                        top: ScreenUtil().setHeight(30),
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

  Widget _buildItemWidget(title, TextEditingController controller, hint,
      maxLength, obscureText, keyboardType) {
    return Container(
      margin: EdgeInsets.only(
        left: ScreenUtil().setWidth(15),
        right: ScreenUtil().setWidth(15),
      ),
      decoration: BoxDecoration(
        border:
            Border(bottom: BorderSide(color: Color.fromRGBO(240, 240, 240, 1))),
      ),
      height: ScreenUtil().setHeight(45),
      alignment: Alignment.centerLeft,
      child: Row(
        children: <Widget>[
          Text(
            !ObjectUtil.isEmptyString(title) ? title : '',
            style: TextStyle(
                color: Color.fromRGBO(46, 49, 56, 1),
                fontSize: ScreenUtil().setSp(15)),
          ),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                  border: InputBorder.none,
//                  contentPadding:
//                      EdgeInsets.only(bottom: ScreenUtil().setHeight(22)),
                  hintText: !ObjectUtil.isEmptyString(hint) ? hint : '',
                  hintStyle: TextStyle(
                      color: ColorRes.COLOR_LOGIN_HINT,
                      fontSize: ScreenUtil().setSp(15))),
              onChanged: (text) {
                controller.text = text;
                //内容改变的回调
              },
              onSubmitted: (text) {
                //内容提交(按回车)的回调
//                    print('submit');
              },
              controller: TextEditingController.fromValue(TextEditingValue(
                  text: controller.text,
                  selection: TextSelection.fromPosition(TextPosition(
                      affinity: TextAffinity.downstream,
                      offset: controller.text.length)))),
              keyboardType:
                  keyboardType == null ? TextInputType.text : keyboardType,
              //显示的文字内容为 下一步
              style: TextStyle(
                  color: Color.fromRGBO(46, 49, 56, 1),
                  fontSize: ScreenUtil().setSp(15)),
//          maxLength: 11,
              //最大长度，设置此项会让TextField右下角有一个输入数量的统计字符串
              //这种情况一般是不符合我们设计的要求的，但是有需要限制其输入的位数
              inputFormatters: [LengthLimitingTextInputFormatter(maxLength)],
              maxLines: 1,

              //最大行数
              autocorrect: false,
              //是否自动更正
              autofocus: false,
              //是否自动对焦
              obscureText: obscureText,
              //是否是密码
              textAlign: TextAlign.end,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildGenderWidget() {
    return GestureDetector(
      onTap: () {
        showDialog(
            barrierDismissible: true,
            context: context,
            builder: (context) {
              return GenderDialog(
                onSureState: (String gender) {
                  this.setState(() {
                    _gender = gender;
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
                        !ObjectUtil.isEmptyString(_gender) ? _gender : '',
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

  Widget _buildCompanyWidget() {
    return GestureDetector(
      onTap: () {
        showDialog(
            barrierDismissible: true,
            context: context,
            builder: (context) {
              return CompanyListDialog(
                onSureState: (String company, String companyId) {
                  this.setState(() {
                    _company = company;
                    _companyId = companyId;
                  });
                },
              );
            });
        print("我的公司点击");
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
              registered_third_company_title,
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
                        !ObjectUtil.isEmptyString(_company) ? _company : '',
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

  void _register() async {
    InputManageUtil.shutdownInputKeyboard();
    String password = _registeredPasswordTextController.text;
    String checkPassword = _registeredCheckPasswordTextController.text;
    String userName = _registeredUserNameTextController.text;
    String mail = _registeredMailTextController.text;
    if (ObjectUtil.isEmptyString(password) ||
        ObjectUtil.isEmptyString(checkPassword) ||
        ObjectUtil.isEmptyString(userName) ||
        ObjectUtil.isEmptyString(_gender) ||
        ObjectUtil.isEmptyString(mail) ||
        ObjectUtil.isEmptyString(_companyId)) {
      Fluttertoast.showToast(msg: registered_third_empty_error_text);
      return;
    }
    if (!RegexUtil.isEmail(mail)) {
      Fluttertoast.showToast(msg: registered_third_mail_error_text);
    }
    if (password != checkPassword) {
      Fluttertoast.showToast(msg: forget_password_same_error_text);
      return;
    }
    showLoading();
    _dao ??= UserDao(StoreProvider.of<AppState>(context));
    ResponseSuccessfulData responseSuccessfulData = await _dao.register(
        widget.mobile,
        widget.code,
        widget.idCardFrontUrl,
        widget.idCardBackUrl,
        password,
        userName,
        _gender,
        mail,
        _companyId);
    hideLoading();
    if (responseSuccessfulData != null && responseSuccessfulData.result == 0) {
      Navigator.of(context).pushNamedAndRemoveUntil(
          Routes.doLogin, (Route<dynamic> route) => false);
    } else if (responseSuccessfulData.result == 1) {
      Fluttertoast.showToast(msg: registered_third_result_1_text);
    }
  }
}
