import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:smart_park/components/app/app_component.dart';
import 'package:smart_park/components/apply/apply_detail_page.dart';
import 'package:smart_park/components/apply/apply_page.dart';
import 'package:smart_park/components/bluetooth/bluetooth_control_page.dart';
import 'package:smart_park/components/forget/forget_next_screent.dart';
import 'package:smart_park/components/forget/forget_screent.dart';
import 'package:smart_park/components/home/home_page.dart';
import 'package:smart_park/components/home/message_page.dart';
import 'package:smart_park/components/login/login_screent.dart';
import 'package:smart_park/components/modify/changemail/change_mail_screent.dart';
import 'package:smart_park/components/modify/changepawd/change_password_code_screent.dart';
import 'package:smart_park/components/modify/changepawd/change_password_screent.dart';
import 'package:smart_park/components/modify/modify_screent.dart';
import 'package:smart_park/components/modify/permissions/audit/modify_permissions_audit_screent.dart';
import 'package:smart_park/components/modify/permissions/modify_permissions_screent.dart';
import 'package:smart_park/components/monitor/monitor_page.dart';
import 'package:smart_park/components/monitor/player_page.dart';
import 'package:smart_park/components/parking/bind_license_page.dart';
import 'package:smart_park/components/parking/parking_end.dart';
import 'package:smart_park/components/parking/parking_page.dart';
import 'package:smart_park/components/parking/upload_license_page.dart';
import 'package:smart_park/components/payment/payment_page.dart';
import 'package:smart_park/components/personal/appointment/appointment_screent.dart';
import 'package:smart_park/components/personal/personal_screent.dart';
import 'package:smart_park/components/personal/repairs/personal_repairs.dart';
import 'package:smart_park/components/personal/report/report_screent.dart';
import 'package:smart_park/components/personal/service/service_screent.dart';
import 'package:smart_park/components/property_repair/repair_page.dart';
import 'package:smart_park/components/registered/registered_one_screent.dart';
import 'package:smart_park/components/registered/registered_third_screent.dart';
import 'package:smart_park/components/registered/registered_two_screent.dart';
import 'package:smart_park/components/report_action/report_action_detail.dart';
import 'package:smart_park/components/report_action/report_action_page.dart';
import 'package:smart_park/components/reserve/fast_reserve_page.dart';
import 'package:smart_park/components/reserve/reserce_succeed_page.dart';
import 'package:smart_park/components/reserve/reserve_confirm_page.dart';
import 'package:smart_park/components/reserve/reserve_page.dart';
import 'package:smart_park/components/reserve/reserve_select_date_page.dart';
import 'package:smart_park/widget/web_view.dart';

var rootHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return AppComponent();
});

var loginHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return LoginScreen();
});

var forgetOneRouteHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return ForgetScreen();
});
var forgetTwoRouteHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  String mobile = params["mobile"]?.first;
  String code = params["code"]?.first;
  return ForgetNextScreen(
    mobile: mobile,
    code: code,
  );
});
var registeredOneRouteHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return RegisteredOneScreen();
});
var registeredTwoRouteHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  String mobile = params["mobile"]?.first;
  String code = params["code"]?.first;
  return RegisteredTwoScreen(
    mobile: mobile,
    code: code,
  );
});

var registeredThirdRouteHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  String mobile = params["mobile"]?.first;
  String code = params["code"]?.first;
  String idCardFrontUrl = params["idCardFrontUrl"]?.first;
  String idCardBackUrl = params["idCardBackUrl"]?.first;
  return RegisteredThirdScreen(
      mobile: mobile,
      code: code,
      idCardFrontUrl: idCardFrontUrl,
      idCardBackUrl: idCardBackUrl);
});
var personalRouteHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
//      String mobile = params["mobile"]?.first;
//      String code = params["code"]?.first;
  return PersonalScreen();
});
var modifyRouteHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
//      String mobile = params["mobile"]?.first;
//      String code = params["code"]?.first;
  return ModifyScreen(userId: null);
});
var permissionsRouteHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
//      String mobile = params["mobile"]?.first;
//      String code = params["code"]?.first;
  return ModifyPermissionsScreen(userId: null);
});
var auditRouteHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
//      String mobile = params["mobile"]?.first;
//      String code = params["code"]?.first;
  return ModifyPermissionsAuditScreen(userId: null);
});
var repairsRouteHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
//      String mobile = params["mobile"]?.first;
//      String code = params["code"]?.first;
  return PersonalRepairsScreen(userId: null);
});
var appointmentRouteHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
//      String mobile = params["mobile"]?.first;
//      String code = params["code"]?.first;
  return PersonalAppointmentScreen(userId: null);
});
var reportRouteHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
//      String mobile = params["mobile"]?.first;
//      String code = params["code"]?.first;
  return PersonalReportScreen(userId: null);
});
var serviceRouteHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
//      String mobile = params["mobile"]?.first;
//      String code = params["code"]?.first;
  return PersonalServiceScreen(userId: null);
});
var changePasswordRouteHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  String mobile = params["mobile"]?.first;
  String code = params["code"]?.first;
  return PersonalChangePasswordScreen(mobile: mobile, code: code);
});
var changeMailRouteHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
//      String mobile = params["mobile"]?.first;
//      String code = params["code"]?.first;
  return ModifyChangeMailScreen();
});
var changePasswordOneRouteHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  String mobile = params["mobile"]?.first;
//      String code = params["code"]?.first;
  return ModifyChangeCodePassword(mobile: mobile);
});
var homeRouteHandle = Handler(handlerFunc: (_, params) => HomePage());

var messageRouteHandle = Handler(handlerFunc: (_, params) => MessagePage());

var bluetoothRouteHandle =
    Handler(handlerFunc: (_, params) => BluetoothControl());

var parkingRouteHandle = Handler(handlerFunc: (_, params) => ParkingPage());

var bindLicenseRouteHandle =
    Handler(handlerFunc: (_, params) => BindLicensePage());

var uploadLicenseRouteHandle =
    Handler(handlerFunc: (_, params) => UploadLicensePage());

var repairRouteHandle =
    Handler(handlerFunc: (_, params) => PropertyRepairPage());

var monitorRouteHandle = Handler(handlerFunc: (_, params) => MonitorPage());

var paymentRouteHandle = Handler(handlerFunc: (_, params) => PaymentPage());

var parkingEndHandle = Handler(handlerFunc: (_, params) => ParkingEnding());

var reserveHandle = Handler(handlerFunc: (_, params) => ReservePage());

var reserveSelectDateHandle = Handler(handlerFunc: (_, params) {
  return ReserveSelectDate(
    yardId: params['yardId']?.first,
  );
});

var reserveConfirmHandle = Handler(handlerFunc: (_, params) {
  var dateTime = params['dateTime']?.first;
  var startTime = params['startTime']?.first;
  var endTime = params['endTime']?.first;
  var yardId = params['yardId']?.first;
  return ReserveConfirmPage(
    startTime: startTime,
    dateTime: dateTime,
    endTime: endTime,
    yardId: yardId,
  );
});

var fastReserveHandle = Handler(handlerFunc: (_, params) => FastReservePage());

var reserveSuccessHandle =
    Handler(handlerFunc: (_, params) => ReserveSucceedPage());

var reportActionHandle =
    Handler(handlerFunc: (_, params) => ReportActionPage());

var reportDetailHandle = Handler(
    handlerFunc: (_, params) => DetailPage(
          newsTipId: params['newsTipId']?.first,
        ));

var applyHandle = Handler(handlerFunc: (_, params) => ApplyPage());

var applyDetailHandle = Handler(handlerFunc: (_, params) => ApplyDetail());

var playerHandle = Handler(handlerFunc: (_, params) => PlayerPage());