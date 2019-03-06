import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:smart_park/values/colors.dart';
import 'package:smart_park/values/strings.dart';
import 'package:smart_park/widget/text_field_widget.dart';
import 'package:smart_park/utils/input_manage_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_park/widget/common_app_bar.dart';
import 'package:smart_park/router/navigator_util.dart';
import 'package:smart_park/components/personal/data/local_personal_data.dart';
import 'package:smart_park/values/json_strings.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smart_park/values/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_park/widget/check_box_widget.dart';
//人员权限Dialog/

class PersonalDialog extends StatefulWidget {
  PersonalDialog({Key key, this.groupValue = 1, this.onSureState})
      : super(key: key);
  final int groupValue;
  final Function onSureState;

  @override
  State<StatefulWidget> createState() {
    return _PersonalDialogState();
  }
}

class _PersonalDialogState extends State<PersonalDialog> {
  TextEditingController nameController = new TextEditingController();
  bool _values = false;
  bool _firmInfo1 = true;
  bool _firmInfo2 = false;
  bool _firmInfo3 = false;
  bool _firmInfo4 = false;
  bool _guardInfo1 = true;
  bool _guardInfo2 = false;
  bool _guardInfo3 = false;
  bool _guardInfo4 = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context); //关闭对话框
      },
      child: Material(
        ////创建透明层
        type: MaterialType.transparency, //透明类型
        child: GestureDetector(
          onTap: () {},
          child: Center(
            child: Container(
              width: ScreenUtil().setWidth(240),
//              height: ScreenUtil().setHeight(515),
              //TODO
              height: ScreenUtil().setHeight(411),
              padding: EdgeInsets.only(
                  left: ScreenUtil().setWidth(15),
                  right: ScreenUtil().setWidth(16),
                  top: ScreenUtil().setHeight(20)),
              decoration: ShapeDecoration(
                  color: Color.fromRGBO(255, 255, 255, 1),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    permissions_modify_title_text,
                    style: TextStyle(
                        color: Color.fromRGBO(46, 49, 56, 1),
                        fontSize: ScreenUtil().setSp(15)),
                  ),
                  _buildChangeNameWidget(),
                  _buildFilmTitleWidget(),
                  _buildFilmItemInfo1Widget(permissions_firm_info1_text),
                  _buildFilmItemInfo2Widget(permissions_firm_info2_text),
                  _buildFilmItemInfo3Widget(permissions_firm_info3_text),
                  _buildFilmItemInfo4Widget(permissions_firm_info4_text),
                  _buildGuardTitleWidget(),
                  _buildGuardItemInfo1Widget(permissions_guard_info1_text),
                  _buildGuardItemInfo2Widget(permissions_guard_info2_text),
                  _buildGuardItemInfo3Widget(permissions_guard_info3_text),
                  _buildGuardItemInfo4Widget(permissions_guard_info4_text),
                  _buildButtonWidget()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildChangeNameWidget() {
    return Container(
      margin: EdgeInsets.only(top: ScreenUtil().setHeight(15)),
      padding: EdgeInsets.only(
          left: ScreenUtil().setWidth(11), right: ScreenUtil().setWidth(11)),
      decoration: new BoxDecoration(
        border: Border.all(width: 1.0, color: Color.fromRGBO(177, 177, 179, 1)),
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(3.0)),
      ),
      height: ScreenUtil().setHeight(30),
      alignment: Alignment.centerLeft,
      child: TextField(
        decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(bottom: ScreenUtil().setHeight(0)),
            hintText: '请输入名称',
            hintStyle: TextStyle(
                color: ColorRes.COLOR_LOGIN_HINT,
                fontSize: ScreenUtil().setSp(12))),
        onChanged: (text) {
          nameController.text = text;
          //内容改变的回调
//                    print('change');
        },
        onSubmitted: (text) {
          //内容提交(按回车)的回调
//                    print('submit');
        },
        controller: TextEditingController(text: nameController.text),
        keyboardType: TextInputType.emailAddress,
        //键盘类型
        textInputAction: TextInputAction.none,
        //显示的文字内容为 下一步
        style: TextStyle(
            color: Color.fromRGBO(46, 49, 56, 1),
            fontSize: ScreenUtil().setSp(12)),
//          maxLength: 11,
        //最大长度，设置此项会让TextField右下角有一个输入数量的统计字符串
        //这种情况一般是不符合我们设计的要求的，但是有需要限制其输入的位数
        inputFormatters: [LengthLimitingTextInputFormatter(8)],
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

  Widget _buildFilmTitleWidget() {
    return Padding(
      padding: EdgeInsets.only(top: ScreenUtil().setHeight(20)),
      child: Text(
        permissions_firm_title_text,
        style: TextStyle(
            color: Color.fromRGBO(46, 49, 56, 1),
            fontSize: ScreenUtil().setSp(15)),
      ),
    );
  }

  Widget _buildFilmItemWidget(firmTitle) {
    return Container(
      height: ScreenUtil().setHeight(28),
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(left: ScreenUtil().setWidth(15)),
      child: Row(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
                top: ScreenUtil().setHeight(8),
                bottom: ScreenUtil().setHeight(8)),
            child: CheckBoxWidget(
              value: _values,
              onChanged: (bool newValue) {
                setState(() {
                  _values = !newValue;
                });
              },
              size: ScreenUtil().setHeight(12),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: ScreenUtil().setWidth(3)),
            child: Text(
              firmTitle,
              style: TextStyle(
                  color: Color.fromRGBO(46, 49, 56, 1),
                  fontSize: ScreenUtil().setSp(12)),
            ),
          )
        ],
      ),
    );
  }
  Widget _buildFilmItemInfo1Widget(firmTitle) {
    return Container(
      height: ScreenUtil().setHeight(28),
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(left: ScreenUtil().setWidth(15)),
      child: Row(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
                top: ScreenUtil().setHeight(8),
                bottom: ScreenUtil().setHeight(8)),
            child: CheckBoxWidget(
              value: _firmInfo1,
              onChanged: (bool newValue) {
                setState(() {
                  _firmInfo1 = !newValue;
                });
              },
              size: ScreenUtil().setHeight(12),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: ScreenUtil().setWidth(3)),
            child: Text(
              firmTitle,
              style: TextStyle(
                  color: Color.fromRGBO(46, 49, 56, 1),
                  fontSize: ScreenUtil().setSp(12)),
            ),
          )
        ],
      ),
    );
  }
  Widget _buildFilmItemInfo2Widget(firmTitle) {
    return Container(
      height: ScreenUtil().setHeight(28),
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(left: ScreenUtil().setWidth(15)),
      child: Row(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
                top: ScreenUtil().setHeight(8),
                bottom: ScreenUtil().setHeight(8)),
            child: CheckBoxWidget(
              value: _firmInfo2,
              onChanged: (bool newValue) {
                setState(() {
                  _firmInfo2 = !newValue;
                });
              },
              size: ScreenUtil().setHeight(12),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: ScreenUtil().setWidth(3)),
            child: Text(
              firmTitle,
              style: TextStyle(
                  color: Color.fromRGBO(46, 49, 56, 1),
                  fontSize: ScreenUtil().setSp(12)),
            ),
          )
        ],
      ),
    );
  }
  Widget _buildFilmItemInfo3Widget(firmTitle) {
    return Container(
      height: ScreenUtil().setHeight(28),
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(left: ScreenUtil().setWidth(15)),
      child: Row(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
                top: ScreenUtil().setHeight(8),
                bottom: ScreenUtil().setHeight(8)),
            child: CheckBoxWidget(
              value: _firmInfo3,
              onChanged: (bool newValue) {
                setState(() {
                  _firmInfo3 = !newValue;
                });
              },
              size: ScreenUtil().setHeight(12),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: ScreenUtil().setWidth(3)),
            child: Text(
              firmTitle,
              style: TextStyle(
                  color: Color.fromRGBO(46, 49, 56, 1),
                  fontSize: ScreenUtil().setSp(12)),
            ),
          )
        ],
      ),
    );
  }
  Widget _buildFilmItemInfo4Widget(firmTitle) {
    return Container(
      height: ScreenUtil().setHeight(28),
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(left: ScreenUtil().setWidth(15)),
      child: Row(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
                top: ScreenUtil().setHeight(8),
                bottom: ScreenUtil().setHeight(8)),
            child: CheckBoxWidget(
              value: _firmInfo4,
              onChanged: (bool newValue) {
                setState(() {
                  _firmInfo4 = !newValue;
                });
              },
              size: ScreenUtil().setHeight(12),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: ScreenUtil().setWidth(3)),
            child: Text(
              firmTitle,
              style: TextStyle(
                  color: Color.fromRGBO(46, 49, 56, 1),
                  fontSize: ScreenUtil().setSp(12)),
            ),
          )
        ],
      ),
    );
  }
  Widget _buildGuardItemInfo1Widget(firmTitle) {
    return Container(
      height: ScreenUtil().setHeight(28),
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(left: ScreenUtil().setWidth(15)),
      child: Row(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
                top: ScreenUtil().setHeight(8),
                bottom: ScreenUtil().setHeight(8)),
            child: CheckBoxWidget(
              value: _guardInfo1,
              onChanged: (bool newValue) {
                setState(() {
                  _guardInfo1 = !newValue;
                });
              },
              size: ScreenUtil().setHeight(12),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: ScreenUtil().setWidth(3)),
            child: Text(
              firmTitle,
              style: TextStyle(
                  color: Color.fromRGBO(46, 49, 56, 1),
                  fontSize: ScreenUtil().setSp(12)),
            ),
          )
        ],
      ),
    );
  }
  Widget _buildGuardItemInfo2Widget(firmTitle) {
    return Container(
      height: ScreenUtil().setHeight(28),
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(left: ScreenUtil().setWidth(15)),
      child: Row(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
                top: ScreenUtil().setHeight(8),
                bottom: ScreenUtil().setHeight(8)),
            child: CheckBoxWidget(
              value: _guardInfo2,
              onChanged: (bool newValue) {
                setState(() {
                  _guardInfo2 = !newValue;
                });
              },
              size: ScreenUtil().setHeight(12),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: ScreenUtil().setWidth(3)),
            child: Text(
              firmTitle,
              style: TextStyle(
                  color: Color.fromRGBO(46, 49, 56, 1),
                  fontSize: ScreenUtil().setSp(12)),
            ),
          )
        ],
      ),
    );
  }
  Widget _buildGuardItemInfo3Widget(firmTitle) {
    return Container(
      height: ScreenUtil().setHeight(28),
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(left: ScreenUtil().setWidth(15)),
      child: Row(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
                top: ScreenUtil().setHeight(8),
                bottom: ScreenUtil().setHeight(8)),
            child: CheckBoxWidget(
              value: _guardInfo3,
              onChanged: (bool newValue) {
                setState(() {
                  _guardInfo3 = !newValue;
                });
              },
              size: ScreenUtil().setHeight(12),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: ScreenUtil().setWidth(3)),
            child: Text(
              firmTitle,
              style: TextStyle(
                  color: Color.fromRGBO(46, 49, 56, 1),
                  fontSize: ScreenUtil().setSp(12)),
            ),
          )
        ],
      ),
    );
  }
  Widget _buildGuardItemInfo4Widget(firmTitle) {
    return Container(
      height: ScreenUtil().setHeight(28),
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(left: ScreenUtil().setWidth(15)),
      child: Row(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
                top: ScreenUtil().setHeight(8),
                bottom: ScreenUtil().setHeight(8)),
            child: CheckBoxWidget(
              value: _guardInfo4,
              onChanged: (bool newValue) {
                setState(() {
                  _guardInfo4 = !newValue;
                });
              },
              size: ScreenUtil().setHeight(12),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: ScreenUtil().setWidth(3)),
            child: Text(
              firmTitle,
              style: TextStyle(
                  color: Color.fromRGBO(46, 49, 56, 1),
                  fontSize: ScreenUtil().setSp(12)),
            ),
          )
        ],
      ),
    );
  }
  Widget _buildGuardTitleWidget() {
    return Text(
      permissions_guard_title_text,
      style: TextStyle(
          color: Color.fromRGBO(46, 49, 56, 1),
          fontSize: ScreenUtil().setSp(15)),
    );
  }

  Widget _buildButtonWidget() {
    return Expanded(
        child: Container(
//          color: Colors.red,
          alignment: Alignment.centerRight,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  Navigator.pop(context); //关闭对话框
                },
                child: Text(
                  permissions_cancel_text,
                  style: TextStyle(
                      color: Color.fromRGBO(37, 184, 247, 1),
                      fontSize: ScreenUtil().setSp(13)),
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(right: ScreenUtil().setWidth(30))),
              GestureDetector(
                onTap: () {
//                  if (widget.onSureState != null) {
//                    switch (widget.groupValue) {
//                      case 1:
//                        widget.onSureState("认证企业");
//                        break;
//                      case 2:
//                        widget.onSureState("园区十佳优秀企业");
//                        break;
//                      case 3:
//                        widget.onSureState("优秀企业");
//                        break;
//                      case 4:
//                        widget.onSureState("高效企业");
//                        break;
//                    }
//                  }
                  Navigator.pop(context); //关闭对话框
                },
                child: Text(
                  permissions_determine_text,
                  style: TextStyle(
                      color: Color.fromRGBO(37, 184, 247, 1),
                      fontSize: ScreenUtil().setSp(13)),
                ),
              )
            ],
          ),
        ),
        flex: 1);
  }
}
