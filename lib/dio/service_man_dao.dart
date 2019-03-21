import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:redux/redux.dart';
import 'package:redux/redux.dart';
import 'package:smart_park/http/http_client.dart';
import 'package:smart_park/redux/app_state.dart';
import 'package:smart_park/dio/base_dao.dart';
import 'package:smart_park/data/user_data.dart';
import 'package:smart_park/utils/share_preference_util.dart';
import 'package:smart_park/http/api.dart';
import 'package:smart_park/redux/account_reducer.dart';
import 'package:common_utils/common_utils.dart';
import 'package:smart_park/components/personal/service/data/master_data.dart';

class ServiceManDao extends BaseDao{
  ServiceManDao(Store<AppState> store) : super(store);
  Future<MasterDataBean> getMasterDataList() async {
    Response response = await client.get(Api.SMART_SERVICE_MAN, headers: {
      Api.SMART_TOKEN: store?.state?.account?.token
    });

    var data = response?.data;
    if (data == null) {
      return null;
    }

    return MasterDataBean.fromJson(data);
  }
}
