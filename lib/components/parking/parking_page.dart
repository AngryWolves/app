import 'package:flutter/material.dart';
import 'package:smart_park/components/parking/has_no_bind_license_item.dart';
import 'package:smart_park/components/parking/parking_head.dart';
import 'package:smart_park/components/parking/parking_history_item.dart';
import 'package:smart_park/values/colors.dart';
import 'package:smart_park/values/strings.dart';
import 'package:smart_park/widget/base/refresh_list_view.dart';
import 'package:smart_park/widget/common_app_bar.dart';

class ParkingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorRes.APP_BACKGROUND,
      appBar: buildCommonAppbar(home_action_parking, onLeadTop: () {
        Navigator.pop(context);
      }),
      body: ParkingList(),
    );
  }
}

class ParkingList extends StatefulWidget {
  @override
  _ParkingListState createState() => _ParkingListState();
}

class _ParkingListState extends RefreshListView<ParkingList, String> {
  @override
  Widget buildItem(String data) {
    return ParkingHistoryItem();
  }

  @override
  Future<List<String>> requestData(int page) async {
    return ['ssss'];
  }

  @override
  Widget buildEmptyView() {
    return HasBindLicenseItem();
  }

  @override
  Widget buildHead() => ParkingHead();
}
