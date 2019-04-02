import 'package:redux/src/store.dart';
import 'package:smart_park/components/reserve/data/yard_response.dart';
import 'package:smart_park/data/common_response.dart';
import 'package:smart_park/dio/base_dao.dart';
import 'package:smart_park/http/api.dart';
import 'package:smart_park/redux/app_state.dart';

class ReserveDao extends BaseDao {
  ReserveDao(Store<AppState> store) : super(store);

  ///
  /// 查询场地列表
  ///
  Future<YardResponse> getYardList({int type}) async {
    var response = await client.post(Api.SMART_YARD_LIST,
        headers: {Api.SMART_TOKEN: getToken()}, data: {Api.SMART_TYPE: type});

    var data = response?.data;
    if (data == null) {
      return null;
    }
    return YardResponse.fromJson(data);
  }

  ///
  /// 创建预约
  ///
  Future<CommonResponse> createAppointment(
      {String beginTime, String endTime, String note,
        String yardId, String placeDate}) async {
    var response = await client.post(Api.SMART_CREATE_APPOINTMENT, headers: {
      Api.SMART_TOKEN: getToken()
    }, data: {
      Api.CREATE_APPOINTMENT_BEGINTIME: beginTime,
      Api.CREATE_APPOINTMENT_ENDTIME: endTime,
      Api.CREATE_APPOINTMENT_NOTE: note,
      Api.CREATE_APPOINTMENT_YARDID: yardId,
      Api.CREATE_APPOINTMENT_PLACE_DATE:placeDate
    });
    var data = response?.data;
    if (data == null) {
      return null;
    }
    return CommonResponse.fromJson(data);
  }
}
