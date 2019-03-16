import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:smart_park/values/colors.dart';
import 'package:smart_park/values/strings.dart';
import 'package:smart_park/widget/text_field_widget.dart';
import 'package:smart_park/utils/input_manage_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:configurable_expansion_tile/configurable_expansion_tile.dart';
import 'package:common_utils/common_utils.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:smart_park/widget/common_app_bar.dart';
import 'package:smart_park/components/personal/data/local_personal_data.dart';
import 'package:smart_park/values/json_strings.dart';
import 'package:flutter/material.dart';
import 'package:smart_park/values/colors.dart';
import 'package:smart_park/values/strings.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smart_park/router/navigator_util.dart';
import 'package:smart_park/widget/common_app_bar.dart';
import 'package:smart_park/utils/input_manage_util.dart';
import 'package:smart_park/widget/personal_dialog.dart';
import 'package:smart_park/widget/permissions_app_bar.dart';

class ModifyPermissionsScreen extends StatefulWidget {
  ModifyPermissionsScreen({@required this.userId});

  final String userId;

  @override
  State<StatefulWidget> createState() {
    return _ModifyPermissionsScreen();
  }
}

class _ModifyPermissionsScreen extends State<ModifyPermissionsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
//      appBar: buildCommonAppbar(permissions_title_text, onLeadTop: () {
//        InputManageUtil.shutdownInputKeyboard();
//        Navigator.pop(context);
//      }),
      body: Container(
//        padding: EdgeInsets.only(
//            left: ScreenUtil().setWidth(15), right: ScreenUtil().setWidth(15)),
        child: Column(
          children: <Widget>[
            PermissionsAppBar(
              onBackState: () {
                Navigator.pop(context);
              },
              onAuditState: () {
                NavigatorUtil.goAudit(context, '');
              },
            ),
            _firmInfoWidget(),
            _buildInfoWidget('总经理'),
            _buildInfoWidget('财务'),
            _buildInfoWidget('法务'),
            Container(
              height: ScreenUtil().setHeight(1),
              color: Color.fromRGBO(240, 240, 240, 1),
            )
          ],
        ),
      ),
    );
  }

  Widget _firmInfoWidget() {
    return Container(
      height: ScreenUtil().setHeight(70),
      padding: EdgeInsets.only(
          left: ScreenUtil().setWidth(15), right: ScreenUtil().setWidth(15)),
      child: Row(
        children: <Widget>[
          Image.asset(
            'images/icon_login@3x.png',
            width: ScreenUtil().setWidth(49),
            height: ScreenUtil().setHeight(42),
            fit: BoxFit.fill,
          ),
          Padding(
            padding: EdgeInsets.only(left: ScreenUtil().setWidth(15)),
            child: Text(
              "上海xxxx股份有限公司",
              style: TextStyle(
                  color: Color.fromRGBO(46, 49, 56, 1),
                  fontSize: ScreenUtil().setSp(18)),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildInfoWidget(title) {
    return Container(
      padding: EdgeInsets.only(
          left: ScreenUtil().setWidth(15), right: ScreenUtil().setWidth(15)),
      child: ConfigurableExpansionTile(
        topBorderOn: true,
        bottomBorderOn: false,
        borderColorStart: const Color(0xFFF0F0F0),
        borderColorEnd: const Color(0xFFF0F0F0),
        animatedWidgetFollowingHeader: const Icon(
          Icons.expand_more,
          color: const Color(0xFF2E3138),
        ),
        headerExpanded: Flexible(
            child: Container(
                height: ScreenUtil().setHeight(45),
                alignment: Alignment.centerRight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                          padding:
                              EdgeInsets.only(left: ScreenUtil().setWidth(45)),
                          alignment: Alignment.centerLeft,
                          child: Row(
                            children: <Widget>[
                              Text(
                                !ObjectUtil.isEmptyString(title) ? title : "",
                                style: TextStyle(
                                    color: Color.fromRGBO(46, 49, 56, 1),
                                    fontSize: ScreenUtil().setSp(15)),
                              ),
                              _buildInfoButtonWidget()
                            ],
                          )),
                      flex: 1,
                    ),
                    Text(
                      permissions_pack_up_title_text,
                      style: TextStyle(
                          color: Color.fromRGBO(46, 49, 56, 1),
                          fontSize: ScreenUtil().setSp(12)),
                    )
                  ],
                ))),
        header: Flexible(
            child: Container(
                height: ScreenUtil().setHeight(45),
                alignment: Alignment.centerRight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                          padding:
                              EdgeInsets.only(left: ScreenUtil().setWidth(45)),
                          alignment: Alignment.centerLeft,
                          child: Row(
                            children: <Widget>[
                              Text(
                                !ObjectUtil.isEmptyString(title) ? title : "",
                                style: TextStyle(
                                    color: Color.fromRGBO(46, 49, 56, 1),
                                    fontSize: ScreenUtil().setSp(15)),
                              ),
                              _buildInfoButtonWidget()
                            ],
                          )),
                      flex: 1,
                    ),
                    Text(
                      permissions_spread_out_title_text,
                      style: TextStyle(
                          color: Color.fromRGBO(46, 49, 56, 1),
                          fontSize: ScreenUtil().setSp(12)),
                    )
                  ],
                ))),
        children: <Widget>[
          _buildItemWidget("张得三", 0),
          _buildItemWidget("李得四", 1)
        ],
      ),
    );
  }

  Widget _buildInfoButtonWidget() {
    return GestureDetector(
      onTap: () {
        showDialog(context: context, builder: (ctx) => PersonalDialog());

        print("编辑按钮点击");
      },
      child: Container(
        margin: EdgeInsets.only(left: ScreenUtil().setWidth(20)),
        width: ScreenUtil().setWidth(50),
        height: ScreenUtil().setHeight(18),
        decoration: BoxDecoration(
            border:
                Border.all(width: 1.0, color: Color.fromRGBO(37, 184, 247, 1)),
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(3.0))),
        alignment: Alignment.centerLeft,
        child: Row(
          children: <Widget>[
            Padding(padding: EdgeInsets.only(left: ScreenUtil().setWidth(5))),
            Icon(
              Icons.edit,
              color: Color.fromRGBO(37, 184, 247, 1),
              size: 12.0,
            ),
            Text(
              "编辑",
              style: TextStyle(
                  color: Color.fromRGBO(37, 184, 247, 1),
                  fontSize: ScreenUtil().setSp(12)),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildItemWidget(obj, index) {
    return Container(
      height:
          index == 0 ? ScreenUtil().setHeight(47) : ScreenUtil().setHeight(46),
      margin: EdgeInsets.only(left: ScreenUtil().setWidth(45)),
      child: Column(
        children: <Widget>[
          Container(
            height: index == 0
                ? ScreenUtil().setHeight(1)
                : ScreenUtil().setHeight(0),
            color: Color.fromRGBO(240, 240, 240, 1),
          ),
          Container(
            height: ScreenUtil().setHeight(45),
            alignment: Alignment.centerLeft,
            child: Text(
              !ObjectUtil.isEmptyString(obj) ? obj.toString() : "",
              style: TextStyle(
                  color: Color.fromRGBO(46, 49, 56, 1),
                  fontSize: ScreenUtil().setSp(15)),
            ),
          ),
          Container(
            height: index == 0
                ? ScreenUtil().setHeight(1)
                : ScreenUtil().setHeight(0),
            color: Color.fromRGBO(240, 240, 240, 1),
          )
        ],
      ),
    );
  }
}
