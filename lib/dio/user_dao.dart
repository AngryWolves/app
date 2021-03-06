import 'dart:convert';

import 'package:common_utils/common_utils.dart';
import 'package:redux/redux.dart';
import 'package:smart_park/components/personal/data/my_info_response.dart';
import 'package:smart_park/data/response_successful_data.dart';
import 'package:smart_park/data/user_data.dart';
import 'package:smart_park/dio/base_dao.dart';
import 'package:smart_park/http/api.dart';
import 'package:smart_park/redux/account_reducer.dart';
import 'package:smart_park/redux/app_state.dart';
import 'package:smart_park/redux/my_info_reducer.dart';
import 'package:smart_park/utils/share_preference_util.dart';
import 'package:smart_park/data/common_response.dart';

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

  void logout() async {
    await SharePreferenceUtil.remove([ACCOUNT_INFO]);
    store.dispatch(UpdateAccountAction(null));
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

  //创建公司/
  Future<CommonResponse> createCompany(String name) async {
    var response = await client
        .post(Api.SMART_CREATE_COMPANY, data: {Api.SMART_NAME: name});
    var data = response?.data;
    if (data == null) {
      return null;
    }
    return CommonResponse.fromJson(data);
  }

  //注册请求/
  Future<ResponseSuccessfulData> register(
      String telephone,
      String code,
      String idCardFrontUrl,
      String idCardBackUrl,
      String password,
      String name,
      String sex,
      String email,
      String companyId) async {
    var response = await client.post(Api.SMART_REGISTER, data: {
      Api.PARAM_TELEPHONE: telephone,
      Api.SMART_CODE: code,
      Api.SMART_CARD_FRONT: idCardFrontUrl,
      Api.SMART_CARD_BACK: idCardBackUrl,
      Api.PARAM_PASSWORD: password,
      Api.SMART_NAME: name,
      Api.SMART_SEX: sex,
      Api.SMART_EMAIL: email,
      Api.SMART_COMPANY_ID: companyId
    });
    var data = response?.data;
    if (data == null) {
      return null;
    }
    return ResponseSuccessfulData.fromJson(data);
  }

  //忘记密码/
  Future<ResponseSuccessfulData> forget(
      String telephone, String code, String password) async {
    var response = await client.post(Api.SMART_FORGET, data: {
      Api.PARAM_TELEPHONE: telephone,
      Api.SMART_CODE: code,
      Api.PARAM_PASSWORD: password
    });
    var data = response?.data;
    if (data == null) {
      return null;
    }
    return ResponseSuccessfulData.fromJson(data);
  }

  //设置修改email/
  Future<ResponseSuccessfulData> setEmail(String email) async {
    var response =
        await client.post(Api.SMART_SET_MAIL, data: {Api.SMART_EMAIL: email});
    var data = response?.data;
    if (data == null) {
      return null;
    }
    return ResponseSuccessfulData.fromJson(data);
  }

  Future<LoginResponse> _handleLogin(dynamic data, String username) async {
    LoginResponse model = LoginResponse.fromJson(data);
    var userData = model?.data;

    if (!ObjectUtil.isEmptyString(userData)) {
      var account = Account(userData, username);
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

  ///
  /// 账号信息
  ///
  Future<MyInfoResponse> getAccountInfo() async {
    var response = await client
        .post(Api.SMART_MY_INFO, headers: {Api.SMART_TOKEN: getToken()});

    var data = response?.data;
    if (data == null) {
      return null;
    }
    var model = MyInfoResponse.fromJson(data);
    store?.dispatch(UpdateMyInfoAction(model?.data));
    return model;
  }
}
