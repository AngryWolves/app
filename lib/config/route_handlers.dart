import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:smart_park/components/app/app_component.dart';
import 'package:smart_park/components/bluetooth/bluetooth_control_page.dart';
import 'package:smart_park/components/forget/forget_next_screent.dart';
import 'package:smart_park/components/forget/forget_screent.dart';
import 'package:smart_park/components/home/home_page.dart';
import 'package:smart_park/components/home/message_page.dart';
import 'package:smart_park/components/login/login_screent.dart';
import 'package:smart_park/components/modify/changepawd/change_password_code_screent.dart';
import 'package:smart_park/components/modify/changepawd/change_password_screent.dart';
import 'package:smart_park/components/modify/modify_screent.dart';
import 'package:smart_park/components/modify/permissions/modify_permissions_screent.dart';
import 'package:smart_park/components/modify/changemail/change_mail_screent.dart';
import 'package:smart_park/components/parking/parking_end.dart';
import 'package:smart_park/components/payment/payment_page.dart';
import 'package:smart_park/components/personal/personal_screent.dart';
import 'package:smart_park/components/monitor/monitor_page.dart';
import 'package:smart_park/components/parking/bind_license_page.dart';
import 'package:smart_park/components/parking/parking_page.dart';
import 'package:smart_park/components/parking/upload_license_page.dart';
import 'package:smart_park/components/personal/appointment/appointment_screent.dart';
import 'package:smart_park/components/personal/repairs/personal_repairs.dart';
import 'package:smart_park/components/personal/report/report_screent.dart';
import 'package:smart_park/components/personal/service/service_screent.dart';
import 'package:smart_park/components/property_repair/repair_page.dart';
import 'package:smart_park/components/registered/registered_one_screent.dart';
import 'package:smart_park/components/registered/registered_third_screent.dart';
import 'package:smart_park/components/registered/registered_two_screent.dart';

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
  return RegisteredThirdScreen(
    mobile: mobile,
    code: code,
  );
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
//      String mobile = params["mobile"]?.first;
//      String code = params["code"]?.first;
  return PersonalChangePasswordScreen();
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
