import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:smart_park/components/app/app_component.dart';
import 'package:smart_park/components/login/login_screent.dart';
import 'package:smart_park/components/forget/forget_screent.dart';
import 'package:smart_park/components/forget/forget_next_screent.dart';
import 'package:smart_park/components/registered/registered_one_screent.dart';
import 'package:smart_park/components/registered/registered_two_screent.dart';
import 'package:smart_park/components/registered/registered_third_screent.dart';
import 'package:smart_park/components/personal/personal_screent.dart';
import 'package:smart_park/components/modify/modify_screent.dart';
import 'package:smart_park/components/personal/repairs/personal_repairs.dart';
import 'package:smart_park/components/personal/appointment/appointment_screent.dart';
import 'package:smart_park/components/personal/report/report_screent.dart';
import 'package:smart_park/components/personal/service/service_screent.dart';
import 'package:smart_park/components/modify/changepawd/change_password_screent.dart';

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
