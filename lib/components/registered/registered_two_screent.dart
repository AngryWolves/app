import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smart_park/router/navigator_util.dart';
import 'package:smart_park/utils/input_manage_util.dart';
import 'package:smart_park/values/colors.dart';
import 'package:smart_park/values/strings.dart';
import 'package:smart_park/widget/common_app_bar.dart';

class RegisteredTwoScreen extends StatefulWidget {
  RegisteredTwoScreen({@required this.mobile, this.code});

  final String mobile;
  final String code;

  @override
  State<StatefulWidget> createState() {
    return _RegisteredTwoScreenState();
  }
}

class _RegisteredTwoScreenState extends State<RegisteredTwoScreen> {
  Future<File> _imageFilePositive;
  Future<File> _imageFileBack;
  bool isPositive = false;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildCommonAppbar(registered_title_text, onLeadTop: () {
        InputManageUtil.shutdownInputKeyboard();
        Navigator.pop(context);
      }),
      body: Container(
        padding: EdgeInsets.only(
            top: ScreenUtil().setHeight(65),
            left: ScreenUtil().setWidth(15),
            right: ScreenUtil().setWidth(15)),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'images/icon_login@3x.png',
              width: ScreenUtil().setWidth(85),
              height: ScreenUtil().setHeight(98),
              fit: BoxFit.fill,
            ),
            Padding(
              padding: EdgeInsets.only(top: ScreenUtil().setHeight(64)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    width: ScreenUtil().setWidth(167),
                    height: ScreenUtil().setHeight(132),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          registered_two_id_card_positive_text,
                          style: TextStyle(
                              color: Color.fromRGBO(102, 102, 102, 1),
                              fontSize: ScreenUtil().setSp(14)),
                        ),
                        Expanded(
                            child: Padding(
                          padding:
                              EdgeInsets.only(top: ScreenUtil().setHeight(8)),
                          child: _positiveViewImage(),
                        ))
                      ],
                    ),
                  ),
                  Container(
                    width: ScreenUtil().setWidth(167),
                    height: ScreenUtil().setHeight(132),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          registered_two_id_card_positive_text,
                          style: TextStyle(
                              color: Color.fromRGBO(102, 102, 102, 1),
                              fontSize: ScreenUtil().setSp(14)),
                        ),
                        Expanded(
                            child: Padding(
                          padding:
                              EdgeInsets.only(top: ScreenUtil().setHeight(8)),
                          child: _backViewImage(),
                        ))
                      ],
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                print("下一步点击");
                if (_imageFileBack == null || _imageFilePositive == null) {
                  Fluttertoast.showToast(
                      msg: registered_two_check_upload_error_text);
                  return;
                }
                NavigatorUtil.goRegisteredThird(
                    context,
                    widget.mobile,
                    widget.code,
                    "http://oss.idCardFrontUrl.png",
                    "http://oss.idCardBackUrl.png");
              },
              child: Container(
                margin: EdgeInsets.only(
                    top: ScreenUtil().setHeight(77),
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
                child: Text(registered_two_check_next_text,
                    style: TextStyle(
                        color: ColorRes.WHITE,
                        fontSize: ScreenUtil().setSp(16),
                        decoration: TextDecoration.none)),
              ),
            ),
            Text(
              registered_two_instructions_text,
              style: TextStyle(
                  color: Color.fromRGBO(153, 153, 153, 1),
                  fontSize: ScreenUtil().setSp(12),
                  decoration: TextDecoration.none),
            )
          ],
        ),
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
                    print('update==== 相机');
                  },
                  child: Container(
                    color: Colors.white,
                    height: ScreenUtil().setHeight(55),
                    alignment: Alignment.center,
                    child: Text(
                      registered_two_upload_camera_text,
                      style: TextStyle(
                          color: Color.fromRGBO(46, 49, 56, 1),
                          fontSize: ScreenUtil().setSp(17)),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    _onImageButtonPressed(ImageSource.gallery);
                    print('update==== 相册');
                  },
                  child: Container(
                    height: ScreenUtil().setHeight(55),
                    margin: EdgeInsets.only(top: ScreenUtil().setHeight(1)),
                    color: Colors.white,
                    alignment: Alignment.center,
                    child: Text(
                      registered_two_upload_photo_text,
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
                    registered_two_upload_cancel_text,
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
      if (isPositive) {
        _imageFilePositive = ImagePicker.pickImage(source: source);
      } else {
        _imageFileBack = ImagePicker.pickImage(source: source);
      }
    });
  }

  Widget _positiveViewImage() {
    return FutureBuilder<File>(
        future: _imageFilePositive,
        builder: (BuildContext context, AsyncSnapshot<File> snapshot) {
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.data != null) {
            return Image.file(
              snapshot.data,
              width: ScreenUtil().setWidth(167),
              height: ScreenUtil().setHeight(107),
              fit: BoxFit.fill,
            );
          } else {
            return Stack(
              children: <Widget>[
                Image.asset(
                  'images/icon_id_card_positive@3x.png',
                  width: ScreenUtil().setWidth(167),
                  height: ScreenUtil().setHeight(100),
                  fit: BoxFit.fill,
                ),
                GestureDetector(
                  onTap: () {
                    isPositive = true;
                    _modalBottomSheetMenu(context);
                  },
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(
                            top: ScreenUtil().setHeight(32),
                            left: ScreenUtil().setWidth(66)),
                        child: Image.asset(
                          'images/icon_id_card_upload@3x.png',
                          width: ScreenUtil().setWidth(34),
                          height: ScreenUtil().setHeight(34),
                          fit: BoxFit.fill,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            top: ScreenUtil().setHeight(5),
                            left: ScreenUtil().setWidth(59)),
                        child: Text(
                          registered_two_upload_text,
                          style: TextStyle(
                              color: Color.fromRGBO(37, 184, 247, 1),
                              fontSize: ScreenUtil().setSp(12)),
                        ),
                      )
                    ],
                  ),
                )
              ],
            );
          }
        });
  }

  Widget _backViewImage() {
    return FutureBuilder<File>(
        future: _imageFileBack,
        builder: (BuildContext context, AsyncSnapshot<File> snapshot) {
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.data != null) {
            return Image.file(
              snapshot.data,
              width: ScreenUtil().setWidth(167),
              height: ScreenUtil().setHeight(107),
              fit: BoxFit.fill,
            );
          } else {
            return Stack(
              children: <Widget>[
                Image.asset(
                  'images/icon_id_card_back@3x.png',
                  width: ScreenUtil().setWidth(167),
                  height: ScreenUtil().setHeight(107),
                  fit: BoxFit.fill,
                ),
                GestureDetector(
                  onTap: () {
                    isPositive = false;
                    _modalBottomSheetMenu(context);
                  },
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(
                            top: ScreenUtil().setHeight(32),
                            left: ScreenUtil().setWidth(66)),
                        child: Image.asset(
                          'images/icon_id_card_upload@3x.png',
                          width: ScreenUtil().setWidth(34),
                          height: ScreenUtil().setHeight(34),
                          fit: BoxFit.fill,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            top: ScreenUtil().setHeight(5),
                            left: ScreenUtil().setWidth(59)),
                        child: Text(
                          registered_two_upload_text,
                          style: TextStyle(
                              color: Color.fromRGBO(37, 184, 247, 1),
                              fontSize: ScreenUtil().setSp(12)),
                        ),
                      )
                    ],
                  ),
                )
              ],
            );
          }
        });
  }
}
