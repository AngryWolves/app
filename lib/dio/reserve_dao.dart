import 'package:redux/src/store.dart';
import 'package:smart_park/components/reserve/data/yard_response.dart';
import 'package:smart_park/dio/base_dao.dart';
import 'package:smart_park/http/api.dart';
import 'package:smart_park/redux/app_state.dart';

class ReserveDao extends BaseDao {
  ReserveDao(Store<AppState> store) : super(store);

  ///
  /// 查询场地列表
  ///
  Future<YardResponse> getYardList({int page}) async {
    var response = await client.post(Api.SMART_YARD_LIST,
        headers: {Api.SMART_TOKEN: getToken()},
        data: {Api.SMART_PAGE: page, Api.SMART_SIZE: 10});

    var data = response?.data;
    if (data == null) {
      return null;
    }
    return YardResponse.fromJson(data);
  }
}
