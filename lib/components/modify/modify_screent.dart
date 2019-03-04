import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:smart_park/values/colors.dart';
import 'package:smart_park/values/strings.dart';
import 'package:smart_park/widget/text_field_widget.dart';
import 'package:smart_park/utils/input_manage_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
import 'package:smart_park/widget/firm_dialog.dart';

class ModifyScreen extends StatefulWidget {
  ModifyScreen({@required this.userId});

  final String userId;

  @override
  State<StatefulWidget> createState() {
    return _ModifyScreenState();
  }
}

class _ModifyScreenState extends State<ModifyScreen> {
  Future<File> _imageFile;
  String firmText = modify_firm_text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildCommonAppbar(modify_title_text, onLeadTop: () {
        InputManageUtil.shutdownInputKeyboard();
        Navigator.pop(context);
      }),
      body: Container(
        padding: EdgeInsets.only(
            left: ScreenUtil().setWidth(15), right: ScreenUtil().setWidth(20)),
        child: Column(
          children: <Widget>[
            _buildIconWidget(),
            _buildContentWidget(modify_firm_tag_text, firmText, 0),
            _buildContentWidget(modify_change_password_tag_text,
                modify_change_password_text, 1),
            _buildContentWidget(
                modify_firm_logo_tag_text, modify_firm_logo_text, 2),
            _buildContentWidget(modify_power_tag_text, modify_power_text, 3)
          ],
        ),
      ),
    );
  }

  Widget _buildIconWidget() {
    return GestureDetector(
      onTap: () {
        _modalBottomSheetMenu(context);
        print("头像点击");
      },
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              height: ScreenUtil().setHeight(95),
              alignment: Alignment.centerLeft,
              child: Text(
                modify_icon_text,
                textAlign: TextAlign.left,
                maxLines: 1,
                style: TextStyle(
                    color: Color.fromRGBO(46, 49, 56, 1),
                    fontSize: ScreenUtil().setSp(15)),
              ),
            ),
            flex: 1,
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  width: ScreenUtil().setWidth(57),
                  height: ScreenUtil().setHeight(57),
                  margin: EdgeInsets.only(right: ScreenUtil().setWidth(7)),
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.all(Radius.circular(28.5))),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Color.fromRGBO(177, 177, 179, 1),
                  size: 11.0,
                ),
              ],
            ),
            flex: 2,
          )
        ],
      ),
    );
  }

  Widget _buildContentWidget(tag, content, index) {
    return GestureDetector(
      onTap: () {
        if (index == null) {
          return;
        }
        switch (index) {
          case 0:
            showDialog(
                barrierDismissible: true,
                context: context,
                builder: (context) {
                  return FirmDialog(
                    onSureState: (String firm) {
                      this.setState(() {
                        firmText = firm;
                      });
                    },
                  );
                });
            break;
          case 1:
            NavigatorUtil.goChangePassword(context);
            break;
        }
        print("头像点击");
      },
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              color: Colors.transparent,
              height: ScreenUtil().setHeight(46),
              alignment: Alignment.centerLeft,
              child: Text(
                tag,
                textAlign: TextAlign.left,
                maxLines: 1,
                style: TextStyle(
                    color: Color.fromRGBO(46, 49, 56, 1),
                    fontSize: ScreenUtil().setSp(15)),
              ),
            ),
            flex: 1,
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(right: ScreenUtil().setWidth(7)),
                  child: Text(
                    content,
                    textAlign: TextAlign.left,
                    maxLines: 1,
                    style: TextStyle(
                        color: index == 0
                            ? Color.fromRGBO(37, 184, 247, 1)
                            : Color.fromRGBO(177, 177, 179, 1),
                        fontSize: ScreenUtil().setSp(12)),
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Color.fromRGBO(177, 177, 179, 1),
                  size: 11.0,
                )
              ],
            ),
            flex: 2,
          )
        ],
      ),
    );
  }

  void _modalBottomSheetMenu(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return new Container(
            height: ScreenUtil().setHeight(174),
            color: Color.fromRGBO(240, 240, 240, 1),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    _onImageButtonPressed(ImageSource.camera);
                    print('update==== 相册');
                  },
                  child: Container(
                    color: Colors.white,
                    height: ScreenUtil().setHeight(55),
                    alignment: Alignment.center,
                    child: Text(
                      modify_upload_photo_text,
                      style: TextStyle(
                          color: Color.fromRGBO(46, 49, 56, 1),
                          fontSize: ScreenUtil().setSp(17)),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    _onImageButtonPressed(ImageSource.gallery);
                    print('update==== 相机');
                  },
                  child: Container(
                    height: ScreenUtil().setHeight(55),
                    margin: EdgeInsets.only(top: ScreenUtil().setHeight(1)),
                    color: Colors.white,
                    alignment: Alignment.center,
                    child: Text(
                      modify_upload_camera_text,
                      style: TextStyle(
                          color: Color.fromRGBO(46, 49, 56, 1),
                          fontSize: ScreenUtil().setSp(17)),
                    ),
                  ),
                ),
                Container(
                  height: ScreenUtil().setHeight(55),
                  color: Colors.white,
                  margin: EdgeInsets.only(top: ScreenUtil().setHeight(8)),
                  alignment: Alignment.center,
                  child: Text(
                    modify_upload_cancel_text,
                    style: TextStyle(
                        color: Color.fromRGBO(46, 49, 56, 1),
                        fontSize: ScreenUtil().setSp(17)),
                  ),
                ),
              ],
            ),
          );
        });
  }

  void _onImageButtonPressed(ImageSource source) {
    setState(() {
      Navigator.pop(context);
      _imageFile = ImagePicker.pickImage(source: source);
    });
  }
}
