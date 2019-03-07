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

//上传头像/
class ModalBottomSheetUpload extends StatefulWidget {
  ModalBottomSheetUpload({Key key, this.onCameraUpload, this.onPhotoUpload})
      : super(key: key);
  final Function onCameraUpload;
  final Function onPhotoUpload;

  @override
  State<StatefulWidget> createState() {
    return _ModalBottomSheetUploadState();
  }
}

class _ModalBottomSheetUploadState extends State<ModalBottomSheetUpload> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context); //关闭对话框
      },
      child: Material(
          type: MaterialType.transparency, //透明类型
          child: GestureDetector(
            onTap: () {},
            child: Opacity(
              opacity: 0.535,
              child: Container(
                height: ScreenUtil().setHeight(153),
                color: Colors.black,
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(
                          left: ScreenUtil().setWidth(15),
                          right: ScreenUtil().setWidth(15)),
                      height: ScreenUtil().setHeight(89),
                      decoration: ShapeDecoration(
                          color: Color.fromRGBO(255, 255, 255, 1),
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0)))),
                      child: Column(
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              if (widget.onPhotoUpload != null) {
                                widget.onPhotoUpload();
                              }
                              print("相册点击");
                            },
                            child: Container(
                              height: ScreenUtil().setHeight(44),
                              alignment: Alignment.center,
                              color: Colors.transparent,
                              child: Text(
                                modify_upload_photo_text,
                                style: TextStyle(
                                    color: Color.fromRGBO(37, 184, 247, 1),
                                    fontSize: ScreenUtil().setSp(18)),
                              ),
                            ),
                          ),
                          Container(
                            height: ScreenUtil().setHeight(1),
                            color: Color.fromRGBO(240, 240, 240, 1),
                          ),
                          GestureDetector(
                            onTap: () {
                              if (widget.onCameraUpload != null) {
                                widget.onCameraUpload();
                              }
                              print("相机点击");
                            },
                            child: Container(
                              height: ScreenUtil().setHeight(44),
                              alignment: Alignment.center,
                              color: Colors.transparent,
                              child: Text(
                                modify_upload_camera_text,
                                style: TextStyle(
                                    color: Color.fromRGBO(37, 184, 247, 1),
                                    fontSize: ScreenUtil().setSp(18)),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context); //关闭对话框
                        print("取消点击");
                      },
                      child: Container(
                        height: ScreenUtil().setHeight(44),
                        margin: EdgeInsets.only(
                            left: ScreenUtil().setWidth(15),
                            right: ScreenUtil().setWidth(15),
                            top: ScreenUtil().setHeight(10)),
                        alignment: Alignment.center,
                        decoration: ShapeDecoration(
                            color: Color.fromRGBO(255, 255, 255, 1),
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.0)))),
                        child: Text(
                          modify_upload_cancel_text,
                          style: TextStyle(
                              color: Color.fromRGBO(37, 184, 247, 1),
                              fontSize: ScreenUtil().setSp(18)),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
