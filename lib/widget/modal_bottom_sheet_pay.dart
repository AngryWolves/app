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

//支付Dialog/
class ModalBottomSheetPay extends StatefulWidget {
  ModalBottomSheetPay({Key key, this.onCameraUpload, this.onPhotoUpload})
      : super(key: key);
  final Function onCameraUpload;
  final Function onPhotoUpload;

  @override
  State<StatefulWidget> createState() {
    return _ModalBottomSheetPayState();
  }
}

class _ModalBottomSheetPayState extends State<ModalBottomSheetPay> {
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
            child: Container(
              height: ScreenUtil().setHeight(323),
              child: Column(
                children: <Widget>[_buildPayMethodTitleWidget()],
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
        "选择支付方式",
        style: TextStyle(
            color: Color.fromRGBO(143, 143, 143, 1),
            fontSize: ScreenUtil().setSp(13)),
      ),
    );
  }
}
