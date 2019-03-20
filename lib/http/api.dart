class Api {
  static const SMART_HOST = 'http://47.101.208.47:8080';

  //登录接口/
  static const String SMART_LOGIN = SMART_HOST + '/app/user/login';

  //获取验证码/
  static const String SMART_GET_CODE = SMART_HOST + '/app/user/getCode';
  static const String SMART_PHONE = 'phone';
  static const String SMART_TYPE = 'type';

  ///注册/
  static const String SMART_REGISTER = SMART_HOST + '/app/user/register';
  static const PARAM_TELEPHONE = 'telephone';
  static const PARAM_PASSWORD = 'password';
}
