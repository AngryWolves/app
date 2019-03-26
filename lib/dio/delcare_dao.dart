import 'package:redux/src/store.dart';
import 'package:smart_park/components/report_action/data/declare_response.dart';
import 'package:smart_park/dio/base_dao.dart';
import 'package:smart_park/http/api.dart';
import 'package:smart_park/redux/app_state.dart';

class DeclareDao extends BaseDao {
  DeclareDao(Store<AppState> store) : super(store);

  ///
  /// 查询项目申报列表
  ///
  Future<DeclareResponse> getDeclareResponse({int page}) async {
    var response = await client.post(Api.SMART_DECLARE,
        headers: {Api.SMART_TOKEN: getToken()},
        data: {Api.SMART_PAGE: page, Api.SMART_SIZE: 10});

    var data = response?.data;
    if (data == null) {
      return null;
    }

    return DeclareResponse.fromJson(data);
  }

  ///
  /// 查询详情
  ///
  Future<DeclareDetail> getDeclareDetail({String newsTipId}) async {
    var response = await client.post(Api.SMART_DECLARE_DETAIL,
        headers: {Api.SMART_TOKEN: getToken()},
        data: {Api.SMART_NEW_TIP_ID: newsTipId});

    var data = response?.data;

    if (data== null) {
      return null;
    }
    return DeclareDetail.fromJson(data);
  }
}
