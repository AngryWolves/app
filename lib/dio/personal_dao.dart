import 'package:dio/dio.dart';
import 'package:redux/redux.dart';
import 'package:smart_park/redux/app_state.dart';
import 'package:smart_park/dio/base_dao.dart';
import 'package:smart_park/http/api.dart';
import 'package:smart_park/components/personal/appointment/data/appoint_data.dart';
import 'package:smart_park/components/personal/repairs/data/repair_data_bean.dart';
import 'package:smart_park/data/response_successful_data.dart';
class PersonalDao extends BaseDao {
  PersonalDao(Store<AppState> store) : super(store);

  //我的预约/
  Future<AppointDataBean> getAppoint(int page) async {
    Response response = await client.post(Api.SMART_APPOINT,
        headers: {Api.SMART_TOKEN: store?.state?.account?.token},
        data: {Api.SMART_PAGE: page, Api.SMART_SIZE: 10});

    var data = response?.data;
    if (data == null) {
      return null;
    }

    return AppointDataBean.fromJson(data);
  }

  //取消预约
  Future<ResponseSuccessfulData> appointCancel(String decorateId) async {
    Response response = await client.post(Api.SMART_APPOINT_CANCEL,
        headers: {Api.SMART_TOKEN: store?.state?.account?.token},
        data: {Api.SMART_DECORATE_ID: decorateId});

    var data = response?.data;
    if (data == null) {
      return null;
    }

    return ResponseSuccessfulData.fromJson(data);
  }

  //我的报修/
  Future<RepairDataBean> getRepairData(int page) async {
    Response response = await client.post(Api.SMART_REPAIR,
        headers: {Api.SMART_TOKEN: store?.state?.account?.token},
        data: {Api.SMART_PAGE: page, Api.SMART_SIZE: 10});

    var data = response?.data;
    if (data == null) {
      return null;
    }

    return RepairDataBean.fromJson(data);
  }
}
