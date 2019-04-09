class Api {
  static const SMART_HOST = 'http://47.101.208.47:8080';

  static const SMART_TOKEN = 'Authorization';

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
  static const String SMART_CODE = 'code';
  static const String SMART_EMAIL = 'email';
  static const String SMART_COMPANY_ID = 'companyId';

  //创建企业
  static const String SMART_CREATE_COMPANY = SMART_HOST + '/app/user/createCompany';

  //客服列表/
  static const String SMART_SERVICE_MAN = SMART_HOST + '/app/user/serviceMan';

  //公司列表/
  static const String SMART_ALL_COMPANY = SMART_HOST + '/app/user/allCompany';

  /// 绑定车牌
  static const BIND_CAR = SMART_HOST + '/app/user/bingCar';
  static const PARAM_PLATE = 'plate';

  //忘记密码/
  static const String SMART_FORGET = SMART_HOST + '/app/user/forget';

  //我的预约
  static const String SMART_APPOINT = SMART_HOST + '/app/user/appoint';
  static const String SMART_PAGE = 'page';
  static const String SMART_SIZE = 'size';

  //取消预约
  static const String SMART_APPOINT_CANCEL=SMART_HOST+'/app/user/abolishApply';
  static const String SMART_DECORATE_ID='decorateId';
  //我的报修
  static const String SMART_REPAIR = SMART_HOST + '/app/user/repair';

  //设置修改邮箱
  static const String SMART_SET_MAIL = SMART_HOST + '/app/user/setEmail';

  /// 用户信息
  static const String SMART_ACCOUNT_INFO = SMART_HOST + '/app/user/info';

  /// 我的车辆
  static const String SMART_MY_CAR = SMART_HOST + '/app/user/myCar';

  /// 停车历史记录
  static const String SMART_PARKING_HISTORY =
      SMART_HOST + '/app/user/myParkHistory';

  /// 站内信
  static const String SMART_TIP_MESSAGE = SMART_HOST + '/app/user/tipMsg';

  /// 查询新闻
  static const String SMART_HOME_NEWS = SMART_HOST + '/app/user/news';

  /// 查询场地列表
  static const String SMART_YARD_LIST = SMART_HOST + '/app/user/getYard';

  /// 创建预约
  static const String SMART_CREATE_APPOINTMENT =
      SMART_HOST + '/app/user/createAppoint';

  static const String CREATE_APPOINTMENT_BEGINTIME = 'beginTime';
  static const String CREATE_APPOINTMENT_ENDTIME = 'endTime';
  static const String CREATE_APPOINTMENT_NOTE = 'note';
  static const String CREATE_APPOINTMENT_YARDID = 'yardId';
  static const String CREATE_APPOINTMENT_PLACE_DATE = 'placeDate';
  static const String CREATE_APPOINTMENT_TIME = 'time';

  /// 项目申报
  static const String SMART_DECLARE = SMART_HOST + '/app/user/declare';

  /// 项目申报详情
  static const String SMART_DECLARE_DETAIL =
      SMART_HOST + '/app/user/detailsById';
  static const String SMART_NEW_TIP_ID = 'newstipId';

  /// 创建报修
  static const SMART_CREATE_REPAIR = SMART_HOST + '/app/user/createRepair';
  static const SMART_CONTENT = 'content';
  static const SMART_IMAGE_URL = 'imageUrl';

  /// 上传照片
  static const SMART_UPLOAD_IMAGE = SMART_HOST + '/app/user/saveFile';
  static const SMART_FILES = 'files';

  /// 我的缴费
  static const SMART_PAYMENT = SMART_HOST + '/app/user/payment';

  /// 更新头像
  static const SMART_UPDATE_HEAD = SMART_HOST + '/app/user/updateHeadImage';
  static const SMART_HEAD_IMAGE = 'headImage';

  /// 首页轮播图片
  static const SMART_HOME_PICTURE = SMART_HOST + '/app/user/selectPricture';

  /// 我的信息
  static const SMART_MY_INFO = SMART_HOST + '/app/user/myInfo';

  /// 我的申请
  static const SMART_MY_APPLY = SMART_HOST + '/app/user/getMyApply';

  /// 查询场地已被预订掉的时间段
  static const SMART_YARD_TIME = SMART_HOST + '/app/user/getYardTime';
}
