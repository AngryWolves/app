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
import 'package:smart_park/data/local_pay_data.dart';

//支付Dialog/
@immutable
class ModalBottomSheetPay extends StatefulWidget {
  ModalBottomSheetPay(this.payCount,
      {Key key, this.onPayState})
      : super(key: key);
  final Function onPayState;
  final String payCount;
  int _checkIndex = 0;

  @override
  State<StatefulWidget> createState() {
    return _ModalBottomSheetPayState();
  }
}

class _ModalBottomSheetPayState extends State<ModalBottomSheetPay> {
  @override
  Widget build(BuildContext context) {
    final localPayJson = json.decode(JsonStrings.localPay);
    final localPayObjects = localPayJson.map((o) => LocalPay.fromJson(o));

    final listOfLocalPayObjects = localPayObjects.toList();
    return GestureDetector(
      onTap: () {
        Navigator.pop(context); //关闭对话框
      },
      child: Material(
          type: MaterialType.transparency, //透明类型
          child: GestureDetector(
            onTap: () {},
            child: Container(
              height: ScreenUtil().setHeight(323),
              child: Column(
                children: <Widget>[
                  _buildPayMethodTitleWidget(),
                  _buildListWidget(listOfLocalPayObjects),
                  _buildBottomWidget()
                ],
              ),
            ),
          )),
    );
  }

  Widget _buildPayMethodTitleWidget() {
    return Container(
      color: Color.fromRGBO(245, 245, 245, 1),
      height: ScreenUtil().setHeight(35),
      padding: EdgeInsets.only(left: ScreenUtil().setWidth(15)),
      alignment: Alignment.centerLeft,
      child: Text(
        pay_method_title,
        style: TextStyle(
            color: Color.fromRGBO(143, 143, 143, 1),
            fontSize: ScreenUtil().setSp(13)),
      ),
    );
  }

  Widget _buildListWidget(List<dynamic> objects) {
    return Container(
      height: ScreenUtil().setHeight(244),
      margin: EdgeInsets.only(
          left: ScreenUtil().setWidth(15), right: ScreenUtil().setWidth(15)),
      child: ListView.builder(
          itemCount: objects.length,
          itemBuilder: (BuildContext context, index) {
            return _buildItemWidget(objects[index], index);
          }),
    );
  }

  Widget _buildItemWidget(dynamic obj, index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          widget._checkIndex = index;
        });
        print("item 点击");
      },
      child: Container(
        height: ScreenUtil().setHeight(61),
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
            border: Border(
                bottom: Divider.createBorderSide(context,
                    color: Color.fromRGBO(240, 240, 240, 1)))),
        child: Row(
          children: <Widget>[
            Image.asset(
              obj.imagePath,
              width: ScreenUtil().setWidth(37),
              height: ScreenUtil().setHeight(37),
              fit: BoxFit.fill,
            ), //item 前置图
            Padding(
              padding: EdgeInsets.only(left: ScreenUtil().setWidth(25)),
              child: Text(
                obj.payTitle,
                maxLines: 1,
                style: TextStyle(
                    color: Color.fromRGBO(46, 49, 56, 1),
                    fontSize: ScreenUtil().setSp(18)),
              ),
            ),
            Expanded(
              child: Container(
                alignment: Alignment.centerRight,
                child: widget._checkIndex == index
                    ? Icon(
                        Icons.check_circle,
                        color: Colors.blue,
                        size: 18,
                      )
                    : Icon(
                        Icons.radio_button_unchecked,
                        color: Color.fromRGBO(179, 179, 179, 1),
                        size: 18,
                      ),
              ),
              flex: 1,
            )
          ],
        ),
      ),
    );
  }

  Widget _buildBottomWidget() {
    return Container(
      height: ScreenUtil().setHeight(44),
      color: Color.fromRGBO(58, 58, 58, 1),
      alignment: Alignment.centerRight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          _buildPayTagCount(),
          _buildPayRmbCount(),
          _buildPayCount(),
          _buildButtonPayWidget()
        ],
      ),
    );
  }

  Widget _buildButtonPayWidget() {
    return GestureDetector(
      onTap: () {
        if (widget.onPayState != null) {
          widget.onPayState(widget._checkIndex);
        }
        print("支付按钮点击");
      },
      child: Container(
        width: ScreenUtil().setWidth(100),
        height: ScreenUtil().setHeight(44),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Color.fromRGBO(95, 231, 243, 1.0),
          Color.fromRGBO(95, 195, 243, 1.0),
          Color.fromRGBO(95, 195, 243, 1.0)
        ], begin: Alignment.topLeft, end: Alignment.topRight)),
        child: Text(pay_immediate_title,
            style: TextStyle(
                color: ColorRes.WHITE, fontSize: ScreenUtil().setSp(15))),
      ),
    );
  }

  Widget _buildPayCount() {
    return Padding(
        padding: EdgeInsets.only(right: ScreenUtil().setWidth(20)),
        child: Text(widget.payCount,
            style: TextStyle(
                color: ColorRes.WHITE, fontSize: ScreenUtil().setSp(13))));
  }

  Widget _buildPayRmbCount() {
    return Padding(
        padding: EdgeInsets.only(right: ScreenUtil().setWidth(10)),
        child: Text(pay_rmb_title,
            style: TextStyle(
                color: ColorRes.WHITE, fontSize: ScreenUtil().setSp(15))));
  }

  Widget _buildPayTagCount() {
    return Padding(
        padding: EdgeInsets.only(right: ScreenUtil().setWidth(10)),
        child: Text(pay_tag_title,
            style: TextStyle(
                color: ColorRes.WHITE, fontSize: ScreenUtil().setSp(13))));
  }
}
