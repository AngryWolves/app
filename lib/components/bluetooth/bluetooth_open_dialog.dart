import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_park/values/colors.dart';
import 'package:smart_park/values/strings.dart';

class BlueToothOpenDialog extends Dialog {
  BlueToothOpenDialog();

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Center(
        child: Container(
          width: ScreenUtil().setWidth(249),
          height: ScreenUtil().setHeight(170),
          padding: const EdgeInsets.only(top: 20),
          decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.all(Radius.circular(5.0))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Column(
                  children: <Widget>[
                    Text(
                      bluetooth_dialog_opening_title,
                      style: TextStyle(
                              color: ColorRes.GERY_TEXT,
                              fontSize: ScreenUtil().setSp(18),
                              fontWeight: FontWeight.w600),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 5.0),
                      width: ScreenUtil().setWidth(44),
                      height: ScreenUtil().setHeight(46),
                      child: Stack(
                        alignment: Alignment.bottomRight,
                        children: <Widget>[
                          Icon(
                            Icons.bluetooth_connected,
                            size: ScreenUtil().setWidth(38),
                          ),
                          Image(image: AssetImage('images/ic_bluetootn_control_succeed.png'))
                        ],
                      ),
                    ),
                    Text(bluetooth_dialog_opening_done)
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  height: ScreenUtil().setHeight(45),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                          border:
                          Border(top: BorderSide(color: ColorRes.DIALOG_DIVIDER))),
                  child: Text(
                    bluetooth_dialog_ok,
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BluetoothControlStatus {
  int status;
  String operateTitle;
  String action;
}
