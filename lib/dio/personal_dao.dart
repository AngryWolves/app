import 'package:dio/dio.dart';
import 'package:redux/redux.dart';
import 'package:smart_park/redux/app_state.dart';
import 'package:smart_park/dio/base_dao.dart';
import 'package:smart_park/http/api.dart';
import 'package:smart_park/components/personal/appointment/data/appoint_data.dart';

class PersonalDao extends BaseDao {
  PersonalDao(Store<AppState> store) : super(store);

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
}
