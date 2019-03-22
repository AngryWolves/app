import 'package:dio/dio.dart';
import 'package:redux/redux.dart';
import 'package:smart_park/redux/app_state.dart';
import 'package:smart_park/dio/base_dao.dart';
import 'package:smart_park/http/api.dart';
import 'package:smart_park/data/company_data.dart';

class CompanyDao extends BaseDao {
  CompanyDao(Store<AppState> store) : super(store);

  Future<CompanyData> getAllCompany() async {
    Response response = await client.post(Api.SMART_ALL_COMPANY);

    var data = response?.data;
    if (data == null) {
      return null;
    }

    return CompanyData.fromJson(data);
  }
}
