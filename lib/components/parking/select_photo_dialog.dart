import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_park/values/colors.dart';
import 'package:smart_park/values/strings.dart';

class SelectPhotoDialog extends StatelessWidget {
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
            height: ScreenUtil().setHeight(174),
            width: ScreenUtil.screenWidth,
            color: ColorRes.APP_BACKGROUND,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      color: Colors.white,
                      alignment: Alignment.center,
                      height: ScreenUtil().setHeight(55),
                      child: Text(
                        parking_upload_dialog_photo,
                        style: TextStyle(
                            fontSize: ScreenUtil().setSp(17),
                            color: ColorRes.GERY_TEXT),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 1.0),
                      color: Colors.white,
                      alignment: Alignment.center,
                      height: ScreenUtil().setHeight(55),
                      child: Text(
                        parking_upload_dialog_select,
                        style: TextStyle(
                            fontSize: ScreenUtil().setSp(17),
                            color: ColorRes.GERY_TEXT),
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    color: Colors.white,
                    alignment: Alignment.center,
                    height: ScreenUtil().setHeight(55),
                    child: Text(
                      parking_upload_dialog_cancel,
                      style: TextStyle(
                          fontSize: ScreenUtil().setSp(17),
                          color: ColorRes.GERY_TEXT),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
