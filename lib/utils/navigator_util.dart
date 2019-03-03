import 'package:flutter/material.dart';
import 'package:smart_park/pages/bind_license_page.dart';
import 'package:smart_park/pages/bluetooth_control_page.dart';
import 'package:smart_park/pages/message_page.dart';
import 'package:smart_park/pages/parking_page.dart';

class NavigatorUtil {
  ///
  /// 站内信息
  ///
  static goMessagePage(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => MessagePage()));
  }

  ///
  /// 蓝牙门禁
  ///
  static goBluetoothPage(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (_) => BluetoothControl()));
  }

  ///
  /// 智慧停车 -- (绑定车牌)
  ///
  static goBindLicensePage(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (_) => BindLicensePage()));
  }

  ///
  /// 智慧停车 -- (上传行驶证)
  ///
  static goParingPage(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => ParkingPage()));
  }
}
