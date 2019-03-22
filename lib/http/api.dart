class Api {
  static const SMART_HOST = 'http://47.101.208.47:8080';

  static const SMART_TOKEN='Authorization';
  //登录接口/
  static const String SMART_LOGIN = SMART_HOST + '/app/user/login';
  static const PARAM_TELEPHONE = 'telephone';
  static const PARAM_PASSWORD = 'password';

  //获取验证码/
  static const String SMART_GET_CODE = SMART_HOST + '/app/user/getCode';
  static const String SMART_PHONE = 'phone';
  static const String SMART_TYPE = 'type';

  ///注册/
  static const String SMART_REGISTER = SMART_HOST + '/app/user/register';
  static const String SMART_CARD_FRONT = 'idCardFrontUrl';
  static const String SMART_CARD_BACK = 'idCardBackUrl';
  static const String SMART_PASSWORD = 'password';
  static const String SMART_NAME = 'name';
  static const String SMART_SEX = 'sex';
  static const String SMART_CODE= 'code';
  static const String SMART_EMAIL = 'email';
  //客服列表/
  static const String SMART_SERVICE_MAN=SMART_HOST +'/app/user/serviceMan';
  //公司列表/
  static const String SMART_ALL_COMPANY=SMART_HOST+'/app/user/allCompany';
}
