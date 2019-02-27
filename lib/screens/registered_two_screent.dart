import 'dart:async';

import 'package:flutter/material.dart';
import 'package:smart_park/values/colors.dart';
import 'package:smart_park/values/strings.dart';
import 'package:smart_park/widget/text_field_widget.dart';
import 'package:smart_park/utils/input_manage_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:common_utils/common_utils.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegisteredTwoScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RegisteredTwoScreenState();
  }
}

class _RegisteredTwoScreenState extends State<RegisteredTwoScreen> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 375, height: 667)..init(context);
    return Container(
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
                      Padding(
                        padding:
                            EdgeInsets.only(top: ScreenUtil().setHeight(8)),
                        child: Stack(
                          children: <Widget>[
                            Image.asset(
                              'images/icon_id_card_positive@3x.png',
                              width: ScreenUtil().setWidth(167),
                              height: ScreenUtil().setHeight(107),
                              fit: BoxFit.fill,
                            ),
                            GestureDetector(
                              onTap: () {},
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
                                          color:
                                              Color.fromRGBO(37, 184, 247, 1),
                                          fontSize: ScreenUtil().setSp(12)),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      )
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
                      Padding(
                        padding:
                            EdgeInsets.only(top: ScreenUtil().setHeight(8)),
                        child: Stack(
                          children: <Widget>[
                            Image.asset(
                              'images/icon_id_card_back@3x.png',
                              width: ScreenUtil().setWidth(167),
                              height: ScreenUtil().setHeight(107),
                              fit: BoxFit.fill,
                            ),
                            GestureDetector(
                              onTap: () {},
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
                                          color:
                                              Color.fromRGBO(37, 184, 247, 1),
                                          fontSize: ScreenUtil().setSp(12)),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.only(
                  top: ScreenUtil().setHeight(141),
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
    );
  }
}
