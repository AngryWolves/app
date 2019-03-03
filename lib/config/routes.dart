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
  static String doModify = "/modify";

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
    router.define(doRepairs,
        handler: repairsRouteHandler,
        transitionType: TransitionType.nativeModal);
  }
}
