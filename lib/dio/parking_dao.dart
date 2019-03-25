import 'package:redux/redux.dart';
import 'package:smart_park/components/parking/data/bind_card_data.dart';
import 'package:smart_park/components/parking/data/car_info.dart';
import 'package:smart_park/components/parking/data/parking_history_item.dart';
import 'package:smart_park/dio/base_dao.dart';
import 'package:smart_park/http/api.dart';
import 'package:smart_park/redux/app_state.dart';

class ParkingDao extends BaseDao {
  ParkingDao(Store<AppState> store) : super(store);

  ///
  /// 绑定车牌
  ///
  Future<BindCardData> bindLicense({String plate}) async {
    var response = await client.post(Api.BIND_CAR,
        headers: {Api.SMART_TOKEN: getToken()}, data: {Api.PARAM_PLATE: plate});

    var data = response?.data;
    if (data == null) {
      return null;
    }
    return BindCardData.fromJson(data);
  }

  Future<CarInfo> getCarInfo() async {
    var response = await client
        .post(Api.SMART_MY_CAR, headers: {Api.SMART_TOKEN: getToken()});

    var data = response?.data;
    if (data == null) {
      return null;
    }

    return CarInfo.fromJson(data);
  }

  ///
  /// 获取停车历史记录
  ///
  Future<ParkingHistoryItem> getParkingHistory({int page}) async {
    var response = await client.post(Api.SMART_PARKING_HISTORY,
        headers: {Api.SMART_TOKEN: getToken()},
        data: {Api.SMART_PAGE: page, Api.SMART_SIZE: 10});

    var data = response?.data;
    if (data == null) {
      return null;
    }

    return ParkingHistoryItem.fromJson(data);
  }
}
