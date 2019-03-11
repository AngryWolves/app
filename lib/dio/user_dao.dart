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

class UserDao extends BaseDao {
  UserDao(Store<AppState> store) : super(store);

  Future<Account> getUserInfo() async {
    var userInfo = await SharePreferenceUtil.get(ACCOUNT_INFO);
    Account userData;
    if (userInfo != null) {
      var userMap = json.decode(userInfo);
      userData = Account.fromJson(userMap);
      store.dispatch(UpdateAccountAction(userData));
    }
    return userData;
  }

  Future<LoginResponse> login(String username, String password) async {
    var response = await client.post(Api.SMART_LOGIN, data: {
      Api.PARAM_USERNAME: username,
      Api.PARAM_PASSWORD: password,
    });
    var data = response?.data;
    if (data == null) {
      return null;
    }
    return await _handleLogin(data, username);
  }

  Future<LoginResponse> _handleLogin(dynamic data, String username) async {
    LoginResponse model = LoginResponse.fromJson(data);
    var userData = model?.userData;

    if (userData != null) {
      var account = Account(userData.token, username);
      var data = account.toJson();
      await SharePreferenceUtil.set(ACCOUNT_INFO, json.encode(data));
      store.dispatch(UpdateAccountAction(account));
    }
    return model;
  }
}
