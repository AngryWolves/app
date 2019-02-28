import 'package:flutter/material.dart';
import 'package:smart_park/pages/bluetooth_control_page.dart';
import 'package:smart_park/pages/message_page.dart';

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
}
