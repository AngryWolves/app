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

//手机号修改密码第二步/
class PersonalChangePasswordScreen extends StatefulWidget {
  PersonalChangePasswordScreen();

  @override
  State<StatefulWidget> createState() {
    return _PersonalChangePasswordScreenState();
  }
}

class _PersonalChangePasswordScreenState
    extends State<PersonalChangePasswordScreen> {
  final _changePasswordTextController = TextEditingController();
  bool checkLegal = false;

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
}
