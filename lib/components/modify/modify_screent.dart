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
import 'package:smart_park/widget/modal_bottom_sheet_upload.dart';
import 'package:cached_network_image/cached_network_image.dart';

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
                modify_change_mail_tag_text, modify_change_password_text, 2),
            _buildContentWidget(
                modify_firm_logo_tag_text, modify_firm_logo_text, 3),
            _buildContentWidget(modify_power_tag_text, modify_power_text, 4)
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
                    child: _positiveViewImage()),
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

  Widget _positiveViewImage() {
    return FutureBuilder<File>(
        future: _imageFile,
        builder: (BuildContext context, AsyncSnapshot<File> snapshot) {
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.data != null) {
            return ClipOval(
                child: Image.file(
              snapshot.data,
              width: ScreenUtil().setWidth(57),
              height: ScreenUtil().setHeight(57),
              fit: BoxFit.fill,
            ));
          } else {
            return ClipOval(
              child: CachedNetworkImage(
                imageUrl:
                    "http://img4.duitang.com/uploads/item/201512/13/20151213102616_rCiEx.thumb.700_0.jpeg",
                placeholder: (context, url) => new CircularProgressIndicator(),
                errorWidget: (context, url, error) => new Icon(Icons.error),
                width: ScreenUtil().setWidth(57),
                height: ScreenUtil().setHeight(57),
                fit: BoxFit.cover,
              ),
            );
          }
        });
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
            NavigatorUtil.goChangePasswordOne(context, "18602987661");
            break;
          case 2:
            NavigatorUtil.goChangeMail(context);
            break;
          case 3:
            NavigatorUtil.goPermissions(context, "");
            break;
          case 4:
            NavigatorUtil.goPermissions(context, "");
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
          return ModalBottomSheetUpload(
            onPhotoUpload: () {
              _onImageButtonPressed(ImageSource.gallery);
              print('update==== 相册');
            },
            onCameraUpload: () {
              _onImageButtonPressed(ImageSource.camera);
              print('update==== 相机');
            },
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
