/*
 * fluro
 * Created by Yakka
 * https://theyakka.com
 * 
 * Copyright (c) 2018 Yakka, LLC. All rights reserved.
 * See LICENSE for distribution and usage details.
 */
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:smart_park/config/route_handlers.dart';

class Routes {
  static String root = "/";
  static String doLogin = "/login";
  static String doOneForget = "/forget";
  static String doNextForget = "/forget/next";
  static String doRegistered = "/registered";
  static String doRegisteredTwo = "/registered/two";
  static String doRegisteredThird = "/registered/third";
  static String doPersonal = "/personal";
  static String doRepairs = "/personal/repairs";
  static String doAppointment = "/personal/appointment";
  static String doReport = "/personal/report";
  static String doService = "/personal/service";
  static String doModify = "/modify";
  static String doPermissions = "/modify/permissions";
  static String doChangePassword = "/modify/changePassword";
  static String doChangeMail = "/modify/changeMail";
  static String doChangePasswordOne = "/modify/changePassword/one";
  static String doHome = "/home";
  static String doMessage = "/home/message";
  static String doBluetooth = "/home/bluetooth";
  static String doParking = "/home/parking";
  static String doParkingBindLicense = "/home/parking/bindLicense";
  static String doParkingUploadLicense = "/home/parking/uploadLicense";
  static String doPropertyRepair = "/home/repair";
  static String doMonitor = "/home/monitor";

  static void configureRoutes(Router router) {
    router.notFoundHandler = new Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      print("ROUTE WAS NOT FOUND !!!");
    });
    router.define(root, handler: rootHandler);
    router.define(doLogin,
        handler: loginHandler, transitionType: TransitionType.nativeModal);
    router.define(doOneForget,
        handler: forgetOneRouteHandler,
        transitionType: TransitionType.nativeModal);
    router.define(doNextForget,
        handler: forgetTwoRouteHandler,
        transitionType: TransitionType.nativeModal);
    router.define(doRegistered,
        handler: registeredOneRouteHandler,
        transitionType: TransitionType.nativeModal);
    router.define(doRegisteredTwo,
        handler: registeredTwoRouteHandler,
        transitionType: TransitionType.nativeModal);
    router.define(doRegisteredThird,
        handler: registeredThirdRouteHandler,
        transitionType: TransitionType.nativeModal);
    router.define(doPersonal,
        handler: personalRouteHandler,
        transitionType: TransitionType.nativeModal);
    router.define(doModify,
        handler: modifyRouteHandler,
        transitionType: TransitionType.nativeModal);
    router.define(doPermissions,
        handler: permissionsRouteHandler,
        transitionType: TransitionType.nativeModal);
    router.define(doRepairs,
        handler: repairsRouteHandler,
        transitionType: TransitionType.nativeModal);
    router.define(doAppointment,
        handler: appointmentRouteHandler,
        transitionType: TransitionType.nativeModal);
    router.define(doReport,
        handler: reportRouteHandler,
        transitionType: TransitionType.nativeModal);
    router.define(doService,
        handler: serviceRouteHandler,
        transitionType: TransitionType.nativeModal);
    router.define(doChangePassword,
        handler: changePasswordRouteHandler,
        transitionType: TransitionType.nativeModal);
    router.define(doChangeMail, handler: changeMailRouteHandler,transitionType: TransitionType.nativeModal);
    router.define(doChangePasswordOne,
        handler: changePasswordOneRouteHandler,
        transitionType: TransitionType.nativeModal);
    router.define(doHome,
        handler: homeRouteHandle, transitionType: TransitionType.nativeModal);
    router.define(doMessage,
        handler: messageRouteHandle, transitionType: TransitionType.native);
    router.define(doBluetooth,
        handler: bluetoothRouteHandle, transitionType: TransitionType.native);
    router.define(doParking,
        handler: parkingRouteHandle, transitionType: TransitionType.native);
    router.define(doParkingBindLicense,
        handler: bindLicenseRouteHandle, transitionType: TransitionType.native);
    router.define(doParkingUploadLicense,
        handler: uploadLicenseRouteHandle,
        transitionType: TransitionType.native);
    router.define(doPropertyRepair,
        handler: repairRouteHandle, transitionType: TransitionType.native);
    router.define(doMonitor,
        handler: monitorRouteHandle, transitionType: TransitionType.native);
  }
}
