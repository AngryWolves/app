import 'package:flutter/material.dart';
import 'package:smart_park/values/colors.dart';
import 'package:smart_park/values/strings.dart';
import 'package:smart_park/widget/text_field_widget.dart';
import 'package:smart_park/utils/input_manage_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:common_utils/common_utils.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:smart_park/widget/common_app_bar.dart';

class PersonalScreen extends StatefulWidget {
//  PersonalScreen({@required this.personalId});

//  final String personalId;

  @override
  State<StatefulWidget> createState() {
    return _PersonalScreenState();
  }
}

class _PersonalScreenState extends State<PersonalScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(236, 236, 236, 1),
      appBar: buildCommonAppbar(personal_title_text, onLeadTop: () {
        InputManageUtil.shutdownInputKeyboard();
        Navigator.pop(context);
      }),
      body: Column(
        children: <Widget>[_buildIcon()],
      ),
    );
  }

  Widget _buildIcon() {
    return Container(
      color: Colors.white,
      height: ScreenUtil().setHeight(95),
      child: Row(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              print("头像点击");
            },
            child: Column(
              children: <Widget>[
                Container(
                  width: ScreenUtil().setWidth(91),
                  padding: EdgeInsets.only(
                      left: ScreenUtil().setWidth(17),
                      top: ScreenUtil().setHeight(17),
                      bottom: ScreenUtil().setHeight(5)),
                  child: Image.asset(
                    'images/icon_login@3x.png',
                    width: ScreenUtil().setWidth(57),
                    height: ScreenUtil().setHeight(57),
                    fit: BoxFit.fill,
                  ),
                ),
                Container(
                  width: ScreenUtil().setWidth(91),
                  alignment: Alignment.center,
                  child: Text(
                    personal_revise_text,
                    style: TextStyle(
                        color: Color.fromRGBO(143, 143, 143, 1),
                        fontSize: ScreenUtil().setSp(9)),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
