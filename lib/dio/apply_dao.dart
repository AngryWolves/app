import 'package:redux/src/store.dart';
import 'package:smart_park/components/apply/data/my_apply_response.dart';
import 'package:smart_park/dio/base_dao.dart';
import 'package:smart_park/http/api.dart';
import 'package:smart_park/redux/app_state.dart';

class ApplyDao extends BaseDao {
  ApplyDao(Store<AppState> store) : super(store);

  ///
  /// 我的申请列表
  ///
  Future<MyApplyResponse> getMyApply() async {
      var response = await client.post(Api.SMART_MY_APPLY,
      headers: {Api.SMART_TOKEN: getToken()});

      var data = response?.data;
      if (data == null) {
        return null;
      }
      return MyApplyResponse.fromJson(data);
  }
}