import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_park/values/colors.dart';
import 'package:smart_park/values/strings.dart';

class BluetoothKeyItem extends StatelessWidget {
  BluetoothKeyItem({this.onItemTap});

  final onItemTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          left: ScreenUtil().setWidth(47), right: ScreenUtil().setWidth(10),
      bottom: ScreenUtil().setHeight(13)),
      height: ScreenUtil().setHeight(40),
      alignment: Alignment.centerLeft,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            '1010 办公室',
            style: TextStyle(
                color: ColorRes.GERY_TEXT, fontSize: ScreenUtil().setSp(15)),
          ),
          GestureDetector(
            child: Container(
              width: ScreenUtil().setWidth(50),
              height: ScreenUtil().setHeight(22),
              padding: const EdgeInsets.only(left: 5.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3.0),
                  border: Border.all(color: ColorRes.BLUE_TEXT)),
              alignment: Alignment.center,
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.bluetooth,
                    color: ColorRes.BLUE_TEXT,
                    size: 15.0,
                  ),
                  Text(
                    bluetooth_item_open,
                    style: TextStyle(
                        color: ColorRes.BLUE_TEXT,
                        fontSize: ScreenUtil().setSp(12)),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
