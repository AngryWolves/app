import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:smart_park/config/application.dart';
import 'package:smart_park/config/routes.dart';

//页面跳转管理/
class NavigatorUtil {
  //登录跳转
  static void goLogin(BuildContext context) {
    TransitionType transitionType = TransitionType.nativeModal;
    Application.router
        .navigateTo(context, Routes.doLogin, transition: transitionType);
  }

  //忘记密码 第一步
  static void goForget(BuildContext context) {
    TransitionType transitionType = TransitionType.nativeModal;
    Application.router
        .navigateTo(context, Routes.doOneForget, transition: transitionType);
  }

//忘记密码 第二步
  static void goForgetNext(BuildContext context, String mobile, String code) {
    TransitionType transitionType = TransitionType.nativeModal;
    Application.router.navigateTo(
        context, Routes.doNextForget + "?message=$mobile&code=$code",
        transition: transitionType);
  }

  //注册 第一步
  static void goRegisteredOne(BuildContext context) {
    TransitionType transitionType = TransitionType.nativeModal;
    Application.router
        .navigateTo(context, Routes.doRegistered, transition: transitionType);
  }

  //注册 第二步
  static void goRegisteredTwo(
      BuildContext context, String mobile, String code) {
    TransitionType transitionType = TransitionType.nativeModal;
    Application.router.navigateTo(
        context, Routes.doRegisteredTwo + "?message=$mobile&code=$code",
        transition: transitionType);
  }

  //注册 第三步
  static void goRegisteredThird(
      BuildContext context, String mobile, String code) {
    TransitionType transitionType = TransitionType.nativeModal;
    Application.router.navigateTo(
        context, Routes.doRegisteredThird + "?message=$mobile&code=$code",
        transition: transitionType);
  }

  //个人中心
  static void goPersona(BuildContext context, String personalId) {
    TransitionType transitionType = TransitionType.nativeModal;
    Application.router.navigateTo(
        context, Routes.doPersonal + "?personalId=$personalId",
        transition: transitionType);
  }

  //个人信息修改
  static void goModify(BuildContext context, String userId) {
    TransitionType transitionType = TransitionType.nativeModal;
    Application.router.navigateTo(context, Routes.doModify + "?userId=$userId",
        transition: transitionType);
  }

  //我的报修
  static void goRepairs(BuildContext context, String userId) {
    TransitionType transitionType = TransitionType.nativeModal;
    Application.router.navigateTo(context, Routes.doRepairs + "?userId=$userId",
        transition: transitionType);
  }
}
