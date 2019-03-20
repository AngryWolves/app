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

  //登录请求/
  Future<LoginResponse> login(String telephone, String password) async {
    var response = await client.post(Api.SMART_LOGIN, data: {
      Api.PARAM_TELEPHONE: telephone,
      Api.PARAM_PASSWORD: password,
    });
    var data = response?.data;
    if (data == null) {
      return null;
    }
    return await _handleLogin(data, telephone);
  }

  //注册请求/
  Future<LoginResponse> register(
      String telephone,
      String code,
      String idCardFrontUrl,
      String idCardBackUrl,
      String password,
      String name,
      String sex,
      String email) async {
    var response = await client.post(Api.SMART_REGISTER, data: {
      Api.PARAM_TELEPHONE: telephone,
      Api.SMART_CODE: code,
      Api.SMART_CARD_FRONT: idCardFrontUrl,
      Api.SMART_CARD_BACK: idCardBackUrl,
      Api.PARAM_PASSWORD: password,
      Api.SMART_NAME: name,
      Api.SMART_SEX: sex,
      Api.SMART_EMAIL: email
    });
    var data = response?.data;
    print("===register======" + data.toString());
    if (data == null) {
      return null;
    }
    return await _handleLogin(data, telephone);
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

  Future getCode(String telephone, int type) async {
    var response = await client.post(Api.SMART_GET_CODE, data: {
      Api.SMART_PHONE: telephone,
      Api.SMART_TYPE: type,
    });
    return response?.statusCode;
  }
}
