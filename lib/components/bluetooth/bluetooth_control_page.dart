import 'package:flutter/material.dart';
import 'package:smart_park/components/bluetooth/bluetooth_open_dialog.dart';
import 'package:smart_park/components/bluetooth/expand_title_item.dart';
import 'package:smart_park/values/colors.dart';
import 'package:smart_park/values/strings.dart';
import 'package:smart_park/widget/base/refresh_list_view.dart';
import 'package:smart_park/widget/common_app_bar.dart';

import 'bluetooth_control_key_item.dart';

class BluetoothControl extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCommonAppbar(home_action_bluetooth_control,
          brightness: Brightness.dark, onLeadTop: () {
        Navigator.pop(context);
      }),
      body: Container(
        color: ColorRes.APP_BACKGROUND,
        padding: const EdgeInsets.all(15.0),
        child: BluetoothControlList(),
      ),
    );
  }
}

class BluetoothControlList extends StatefulWidget {
  @override
  _BluetoothControlListState createState() => _BluetoothControlListState();
}

///BluetoothKeyItem
class _BluetoothControlListState
    extends RefreshListView<BluetoothControlList, String> {
  @override
  Widget buildItem(String data) {
    return ExpandTitleItem(
      title: '一号楼',
      child: Column(
        children: <Widget>[
          Divider(
            color: ColorRes.APP_BACKGROUND,
            height: 2.0,
          ),
          BluetoothKeyItem(),
          BluetoothKeyItem(),
          BluetoothKeyItem(),
          BluetoothKeyItem(),
        ],
      ),
    );
  }

  @override
  Future<List<String>> requestData(int page) async {
    return ['一号楼'];
  }

  void _handleItemTap() {
    showDialog(context: context, builder: (ctx) => BlueToothOpenDialog());
  }
}
