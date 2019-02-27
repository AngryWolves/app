import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smart_park/values/colors.dart';
import 'package:smart_park/values/strings.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@immutable
class ForgetNextScreen extends StatefulWidget {
  String mobile;

  ForgetNextScreen(String mobile) {
    this.mobile = mobile;
  }

  @override
  State<StatefulWidget> createState() {
    return _ForgetNextScreenState(mobile);
  }
}

class _ForgetNextScreenState extends State<ForgetNextScreen> {
  String mobile;

  _ForgetNextScreenState(String mobile) {
    this.mobile = mobile;
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 375, height: 667)..init(context);
    TextEditingController controller = TextEditingController();
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
                  height: ScreenUtil().setHeight(49),
                  child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding:
                            EdgeInsets.only(top: ScreenUtil().setHeight(22)),
                        hintText: forget_next_mobile_hint,
                        hintStyle: TextStyle(
                            color: ColorRes.COLOR_LOGIN_HINT,
                            fontSize: ScreenUtil().setSp(15))),
                    onChanged: (text) {
                      //内容改变的回调
//                    print('change');
                    },
                    onSubmitted: (text) {
                      //内容提交(按回车)的回调
//                    print('submit');
                    },
                    controller: TextEditingController(text: controller.text),
                    keyboardType: TextInputType.number,
                    //键盘类型
                    textInputAction: TextInputAction.next,
                    //显示的文字内容为 下一步
                    style: TextStyle(
                        color: Color.fromRGBO(46, 49, 56, 1),
                        fontSize: ScreenUtil().setSp(15)),
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
                    inputFormatters: [
                      WhitelistingTextInputFormatter.digitsOnly
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: ScreenUtil().setWidth(15),
                    right: ScreenUtil().setWidth(15),
                  ),
                  height: ScreenUtil().setHeight(1),
                  color: ColorRes.COLOR_LOGIN_BORDER_SIDE,
                ),
                Container(
                  margin: EdgeInsets.only(
                      left: ScreenUtil().setWidth(15),
                      right: ScreenUtil().setWidth(15)),
                  height: ScreenUtil().setHeight(49),
                  child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding:
                            EdgeInsets.only(top: ScreenUtil().setHeight(22)),
                        hintText: forget_next_check_code_hint,
                        hintStyle: TextStyle(
                            color: ColorRes.COLOR_LOGIN_HINT,
                            fontSize: ScreenUtil().setSp(15))),
                    onChanged: (text) {
                      //内容改变的回调
//                    print('change');
                    },
                    onSubmitted: (text) {
                      //内容提交(按回车)的回调
//                    print('submit');
                    },
                    controller: TextEditingController(text: controller.text),
                    keyboardType: TextInputType.text,
                    style: TextStyle(
                        color: Color.fromRGBO(46, 49, 56, 1),
                        fontSize: ScreenUtil().setSp(15)),
                    //键盘类型
                    textInputAction: TextInputAction.next,
                    //显示的文字内容为 下一步
                    maxLength: 11,
                    //最大长度
                    maxLines: 1,
                    //最大行数
                    autocorrect: false,
                    //是否自动更正
                    autofocus: false,
                    //是否自动对焦
                    obscureText: true,
                    //是否是密码
                    textAlign: TextAlign.left,
                    //文本对齐方式
                    inputFormatters: [
                      WhitelistingTextInputFormatter.digitsOnly
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: ScreenUtil().setWidth(15),
                    right: ScreenUtil().setWidth(15),
                  ),
                  height: ScreenUtil().setHeight(1),
                  color: ColorRes.COLOR_LOGIN_BORDER_SIDE,
                ),
                Container(
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
                )
              ],
            ),
          ),
        ));
  }
}
