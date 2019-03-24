import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:smart_park/components/parking/data/car_info.dart';
import 'package:smart_park/components/parking/has_no_bind_license_item.dart';
import 'package:smart_park/components/parking/parking_head.dart';
import 'package:smart_park/components/parking/parking_history_item.dart';
import 'package:smart_park/dio/parking_dao.dart';
import 'package:smart_park/redux/app_state.dart';
import 'package:smart_park/router/navigator_util.dart';
import 'package:smart_park/values/colors.dart';
import 'package:smart_park/values/strings.dart';
import 'package:smart_park/widget/base/refresh_list_view.dart';
import 'package:smart_park/widget/common_app_bar.dart';

class ParkingPage extends StatefulWidget {
  @override
  _ParkingPageState createState() => _ParkingPageState();
}

class _ParkingPageState extends State<ParkingPage> {
  ParkingDao _parkingDao;

  bool _hasInit = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorRes.APP_BACKGROUND,
      appBar: buildCommonAppbar(home_action_parking, onLeadTop: () {
        Navigator.pop(context);
      }),
      body: FutureBuilder(
          future: _getMyCarInfo(),
          builder: (_, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return ParkingList(
                carInfoData: snapshot.data,
              );
            } else {
              return Container();
            }
          }),
    );
  }

  ///
  /// 获取绑定的车辆信息
  ///
  Future<CarInfoData> _getMyCarInfo() async {
    if (_hasInit) {
      return null;
    }
    _hasInit = true;
    _parkingDao ??= ParkingDao(StoreProvider.of<AppState>(context));
    print('getMyCarInfo ======');
    var model = await _parkingDao.getCarInfo();
    var carInfoData = model?.data;
    if (carInfoData != null && mounted) {
      return carInfoData;
    } else {
      NavigatorUtil.goBindLicense(context);
      return null;
    }
  }
}

class ParkingList extends StatefulWidget {
  ParkingList({this.carInfoData});

  final CarInfoData carInfoData;

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
