import 'package:flutter/material.dart';
import 'package:smart_park/values/colors.dart';
import 'package:smart_park/values/strings.dart';
import 'package:smart_park/widgets/base/refresh_list_view.dart';
import 'package:smart_park/widgets/bluetooth/bluetooth_control_key_item.dart';
import 'package:smart_park/widgets/common_app_bar.dart';

class BluetoothControl extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCommonAppBar(home_action_bluetooth_control,
          brightness: Brightness.dark, onBack: () {
        Navigator.pop(context);
      }, color: ColorRes.BLACK_APP_BAR_BACKGROUND, titleColor: Colors.white),
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
    return BluetoothKeyItem();
  }

  @override
  Future<List<String>> requestData(int page) async {
    return ['hhhh'];
  }
}
