import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BluetoothKeyItem extends StatelessWidget {
  BluetoothKeyItem({this.onItemTap}) : assert(onItemTap != null);

  final onItemTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onItemTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10.0),
        color: Colors.white,
        height: ScreenUtil().setHeight(60),
        alignment: Alignment.centerLeft,
        child: ListTile(
          leading: Icon(
            Icons.account_balance,
            size: 20.0,
          ),
          title: Text('4楼大门'),
          trailing: Icon(
            Icons.vpn_key,
            size: 25.0,
          ),
        ),
      ),
    );
  }
}
