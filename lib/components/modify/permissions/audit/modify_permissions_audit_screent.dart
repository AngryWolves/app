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
import 'package:cached_network_image/cached_network_image.dart';
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

class ModifyPermissionsAuditScreen extends StatefulWidget {
  ModifyPermissionsAuditScreen({@required this.userId});

  final String userId;

  @override
  State<StatefulWidget> createState() {
    return _ModifyPermissionsAuditScreen();
  }
}

class _ModifyPermissionsAuditScreen
    extends State<ModifyPermissionsAuditScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildCommonAppbar(audit_title_text, onLeadTop: () {
        InputManageUtil.shutdownInputKeyboard();
        Navigator.pop(context);
      }),
      body: Container(
        child: _buildListWidget(null),
      ),
    );
  }

  Widget _buildListWidget(objects) {
    return ListView.builder(
        itemCount: objects != null ? objects.length : 2,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {},
            child: _buildItemWidget(
                objects != null ? objects[index] : null, index),
          );
        });
  }

  Widget _buildItemWidget(object, index) {
    return Container(
      height: ScreenUtil().setHeight(66),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            width: ScreenUtil().setWidth(80),
            alignment: Alignment.center,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5.0),
              child: CachedNetworkImage(
                imageUrl:
                "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1551721293754&di=bb6ee09488026bb275f328db1bdf5906&imgtype=0&src=http%3A%2F%2Fimgsrc.baidu.com%2Fimgad%2Fpic%2Fitem%2F5882b2b7d0a20cf44a7720f27d094b36acaf993c.jpg",
                placeholder: (context, url) => new CircularProgressIndicator(),
                errorWidget: (context, url, error) => new Icon(Icons.error),
                height: ScreenUtil().setHeight(44),
                width: ScreenUtil().setWidth(44),
                fit: BoxFit.fill,
              ),
            )
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  border: Border(
                      bottom: Divider.createBorderSide(context,
                          color: Color.fromRGBO(239, 239, 239, 1)))),
              child: Row(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Padding(
                        padding:
                            EdgeInsets.only(top: ScreenUtil().setHeight(17)),
                        child: Text(
                          '名字名字名字',
                          style: TextStyle(
                              color: Color.fromRGBO(58, 58, 58, 1),
                              fontSize: ScreenUtil().setSp(15)),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(top: ScreenUtil().setHeight(6)),
                        child: Text(
                          '备注备注备注',
                          style: TextStyle(
                              color: Color.fromRGBO(154, 154, 154, 1),
                              fontSize: ScreenUtil().setSp(12)),
                        ),
                      )
                    ],
                    crossAxisAlignment: CrossAxisAlignment.start,
                  ),
                  Expanded(
                    child: Container(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          onTap: () {
                            print('通过按钮点击');
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: ScreenUtil().setWidth(55),
                            height: ScreenUtil().setHeight(30),
                            margin: EdgeInsets.only(
                                right: ScreenUtil().setWidth(15)),
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(37, 184, 247, 1),
                              borderRadius: BorderRadius.circular(3.0),
                            ),
                            child: Text(
                              '通过',
                              style: TextStyle(
                                  color: Color.fromRGBO(255, 255, 255, 1),
                                  fontSize: ScreenUtil().setSp(15)),
                            ),
                          ),
                        )),
                    flex: 1,
                  )
                ],
              ),
            ),
            flex: 1,
          )
        ],
      ),
    );
  }
}
