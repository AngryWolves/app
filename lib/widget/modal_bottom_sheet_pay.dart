import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_park/data/local_pay_data.dart';
import 'package:smart_park/plugin/unionpay_plugin.dart';
import 'package:smart_park/values/colors.dart';
import 'package:smart_park/values/json_strings.dart';
import 'package:smart_park/values/strings.dart';
import 'package:tobias/tobias.dart' as tobias;
import 'package:fluwx/fluwx.dart' as fluwx;

//支付Dialog/
@immutable
class ModalBottomSheetPay extends StatefulWidget {
  ModalBottomSheetPay(this.payCount, {Key key, this.onPayState})
      : super(key: key);
  final ValueChanged<int> onPayState;
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
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Container(),
                ),
                Container(
                  color: Colors.white,
                  height: ScreenUtil().setHeight(323),
                  child: Column(
                    children: <Widget>[
                      _buildPayMethodTitleWidget(),
                      _buildListWidget(listOfLocalPayObjects),
                      _buildBottomWidget()
                    ],
                  ),
                )
              ],
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
          widget._checkIndex = obj.type;
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
            ),
            //item 前置图
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

class PaymentHandle {
  static const PAY_TYPE_ALIPAY = 1;

  static const PAY_TYPE_WX = 2;

  static const PAY_TYPE_UPPAY_COM = 3;

  static const PAY_TYPE_UPPAY_PER = 4;

  void handlePay(int type) async {
    switch (type) {
      case PAY_TYPE_ALIPAY:
        tobias.pay("");
        break;
      case PAY_TYPE_WX:
        fluwx.pay(
                appId: '',
                partnerId: '1900000109',
                prepayId: '1101000000140415649af9fc314aa427',
                packageValue: 'Sign=WXPay',
                nonceStr: '1101000000140429eb40476f8896f4c9',
                timeStamp: 1398746574,
                sign: '7FFECB600D7157C5AA49810D2D8F28BC2811827B',
                signType: '选填',
                extData: '选填');
        break;
      case PAY_TYPE_UPPAY_COM:
      case PAY_TYPE_UPPAY_PER:
        var response =
            await Dio().get('http://101.231.204.84:8091/sim/getacptn');
        print('response ::: $response');
        var result = await UnionPayPlugin().pay(response?.data?.toString());
        print('get native pay result :: $result');
        break;
    }
  }
}
