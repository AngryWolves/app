import 'package:redux/redux.dart';
import 'package:smart_park/data/bind_card_data.dart';
import 'package:smart_park/dio/base_dao.dart';
import 'package:smart_park/http/api.dart';
import 'package:smart_park/redux/app_state.dart';

class ParkingDao extends BaseDao {
  ParkingDao(Store<AppState> store) : super(store);

  ///
  /// 绑定车牌
  ///
  Future<BindCardData> bindLicense({String plate}) async {
      var response = await client.post(Api.BIND_CAR, data: {
          Api.PARAM_PLATE : plate
      });

      var data = response?.data;
      if (data == null) {
        return null;
      }
      return BindCardData.fromJson(data);
  }
}