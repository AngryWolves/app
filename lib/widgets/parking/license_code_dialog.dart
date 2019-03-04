import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_park/pages/bind_license_page.dart';
import 'package:smart_park/values/colors.dart';

class LicenseCodeDialog extends StatelessWidget {
  LicenseCodeDialog({this.selectedCode, this.onCodeTap})
      : assert(selectedCode != null);

  final String selectedCode;
  final ValueChanged<String> onCodeTap;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        children: <Widget>[
          Expanded(
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                color: Colors.transparent,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10.0),
            width: ScreenUtil.screenWidth,
            height: ScreenUtil().setHeight(192),
            color: ColorRes.APP_BACKGROUND,
            child: Wrap(
              spacing: 10.0,
              runSpacing: 8.0,
              children: BindLicensePage.codeList.map((code) {
                Color textColor = selectedCode == code
                    ? ColorRes.BLUE_TEXT
                    : ColorRes.GERY_TEXT;
                return GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    if (onCodeTap != null) {
                      onCodeTap(code);
                    }
                  },
                  child: Container(
                    width: ScreenUtil().setWidth(30),
                    height: ScreenUtil().setHeight(36),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(2.0)),
                    child: Text(
                      code,
                      style: TextStyle(
                          color: textColor, fontSize: ScreenUtil().setSp(13)),
                    ),
                  ),
                );
              }).toList(),
            ),
          )
        ],
      ),
    );
  }
}
