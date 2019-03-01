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
  static void configureRoutes(Router router) {
    router.notFoundHandler = new Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      print("ROUTE WAS NOT FOUND !!!");
    });
    router.define(root, handler: rootHandler);
    router.define(doLogin,
        handler: loginHandler, transitionType: TransitionType.inFromLeft);
    router.define(doOneForget,
        handler: forgetOneRouteHandler,
        transitionType: TransitionType.inFromLeft);
    router.define(doNextForget,
        handler: forgetTwoRouteHandler,
        transitionType: TransitionType.inFromLeft);
    router.define(doRegistered,
        handler: registeredOneRouteHandler,
        transitionType: TransitionType.inFromLeft);
    router.define(doRegisteredTwo,
        handler: registeredTwoRouteHandler,
        transitionType: TransitionType.inFromLeft);
    router.define(doRegisteredThird,
        handler: registeredThirdRouteHandler,
        transitionType: TransitionType.inFromLeft);
  }
}
