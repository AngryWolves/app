import 'package:redux/src/store.dart';
import 'package:smart_park/components/home/data/home_new_response.dart';
import 'package:smart_park/components/home/data/message_data_response.dart';
import 'package:smart_park/dio/base_dao.dart';
import 'package:smart_park/http/api.dart';
import 'package:smart_park/redux/app_state.dart';

class HomeDao extends BaseDao {
  HomeDao(Store<AppState> store) : super(store);

  ///
  /// 账号信息
  ///
  Future getAccountInfo() async {
    var response = await client
        .post(Api.SMART_ACCOUNT_INFO, headers: {Api.SMART_TOKEN: getToken()});

    var data = response?.data;
    if (data == null) {
      return null;
    }
  }

  ///
  /// 获取站内信列表
  ///
  Future<MessageDataResponse> getTipMessage({int page}) async {
    var response = await client.post(Api.SMART_TIP_MESSAGE,
        headers: {Api.SMART_TOKEN: getToken()},
        data: {Api.SMART_PAGE: page, Api.SMART_SIZE: 10});

    var data = response?.data;
    if (data == null) {
      return null;
    }
    return MessageDataResponse.fromJson(data);
  }

  ///
  /// 查询新闻
  ///
  Future<HomeNewResponse> getHomeNews({int page}) async {
    var response = await client.post(Api.SMART_HOME_NEWS,
        headers: {Api.SMART_TOKEN: getToken()},
        data: {Api.SMART_PAGE: page, Api.SMART_SIZE: 10});

    var data = response?.data;
    if (data == null) {
      return null;
    }

    return HomeNewResponse.fromJson(data);
  }
}
