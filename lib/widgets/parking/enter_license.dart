import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_park/values/colors.dart';
import 'package:smart_park/values/strings.dart';

class EnterLicenseView extends StatefulWidget {
  @override
  _EnterLicenseViewState createState() => _EnterLicenseViewState();
}

class _EnterLicenseViewState extends State<EnterLicenseView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 25.0, left: 15.0, right: 15.0),
      padding: const EdgeInsets.symmetric(horizontal: 40.0),
      height: ScreenUtil().setHeight(200),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(5.0))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(
            bind_license_enter_number,
            style: TextStyle(
                color: ColorRes.BIND_LICENSE_TITLE,
                fontSize: ScreenUtil().setSp(30),
                fontWeight: FontWeight.w300),
          ),
          Text(
            bind_license_enter_number_detail,
            style: TextStyle(
              fontSize: ScreenUtil().setSp(13),
              color: ColorRes.BIND_LICENSE_TITLE,
            ),
          ),
          CupertinoTextField(
            padding: const EdgeInsets.all(12.0),
            prefix: _buildPrefix(),
            placeholder: bind_license_enter_number_hint,
            decoration: BoxDecoration(
                border: Border.all(color: ColorRes.TEXT_FIELD_BORDER),
                borderRadius: BorderRadius.circular(5.0)),
          )
        ],
      ),
    );
  }

  Widget _buildPrefix() => GestureDetector(
        onTap: () {},
        child: Container(
          margin: const EdgeInsets.only(left: 12.0),
          child: Row(
            children: <Widget>[
              Text(
                '京',
                style: TextStyle(
                    color: ColorRes.BLUE_TEXT,
                    fontSize: ScreenUtil().setSp(18)),
              ),
              Icon(
                Icons.arrow_drop_down,
                color: ColorRes.BLUE_TEXT,
                size: 18.0,
              ),
              Container(
                margin: const EdgeInsets.only(left: 10.0),
                height: ScreenUtil().setHeight(27),
                width: ScreenUtil().setWidth(1),
                color: ColorRes.TEXT_FIELD_BORDER,
              ),
            ],
          ),
        ),
      );
}
