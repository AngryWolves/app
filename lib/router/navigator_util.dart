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

  //人员权限
  static void goPermissions(BuildContext context, String userId) {
    TransitionType transitionType = TransitionType.nativeModal;
    Application.router.navigateTo(
        context, Routes.doPermissions + "?userId=$userId",
        transition: transitionType);
  }

//人员权限
  static void goAudit(BuildContext context, String userId) {
    TransitionType transitionType = TransitionType.nativeModal;
    Application.router.navigateTo(context, Routes.doAudit + "?userId=$userId",
        transition: transitionType);
  }

  //修改密码(第一步获取code)
  static void goChangePasswordOne(BuildContext context, String mobile) {
    TransitionType transitionType = TransitionType.nativeModal;
    Application.router.navigateTo(
        context, Routes.doChangePasswordOne + "?mobile=$mobile",
        transition: transitionType);
  }

  //修改密码
  static void goChangePassword(BuildContext context) {
    TransitionType transitionType = TransitionType.nativeModal;
    Application.router.navigateTo(context, Routes.doChangePassword,
        transition: transitionType);
  }

//修改邮箱
  static void goChangeMail(BuildContext context) {
    TransitionType transitionType = TransitionType.nativeModal;
    Application.router
        .navigateTo(context, Routes.doChangeMail, transition: transitionType);
  }

  //我的报修
  static void goRepairs(BuildContext context, String userId) {
    TransitionType transitionType = TransitionType.nativeModal;
    Application.router.navigateTo(context, Routes.doRepairs + "?userId=$userId",
        transition: transitionType);
  }

  //我的预约
  static void goAppointment(BuildContext context, String userId) {
    TransitionType transitionType = TransitionType.nativeModal;
    Application.router.navigateTo(
        context, Routes.doAppointment + "?userId=$userId",
        transition: transitionType);
  }

  //我的数据报表
  static void goReport(BuildContext context, String userId) {
    TransitionType transitionType = TransitionType.nativeModal;
    Application.router.navigateTo(context, Routes.doReport + "?userId=$userId",
        transition: transitionType);
  }

  //联系客服
  static void goService(BuildContext context, String userId) {
    TransitionType transitionType = TransitionType.nativeModal;
    Application.router.navigateTo(context, Routes.doService + "?userId=$userId",
        transition: transitionType);
  }

  /// 首页
  static void goHome(BuildContext context) {
    Application.router.navigateTo(context, Routes.doHome);
  }

  /// 站内信息
  static void goMessage(BuildContext context) {
    Application.router.navigateTo(context, Routes.doMessage);
  }

  /// 蓝牙门禁
  static void goBluetooth(BuildContext context) {
    Application.router.navigateTo(context, Routes.doBluetooth);
  }

  /// 智慧停车
  static void goParking(BuildContext context) {
    Application.router.navigateTo(context, Routes.doParking);
  }

  /// 智慧停车 -- (绑定车牌)
  static void goBindLicense(BuildContext context) {
    Application.router.navigateTo(context, Routes.doParkingBindLicense);
  }

  /// 智慧停车 -- (上传行驶证)
  static void goUploadLicense(BuildContext context) {
    Application.router.navigateTo(context, Routes.doParkingUploadLicense);
  }

  /// 物业报修
  static void goRepairPage(BuildContext context) =>
      Application.router.navigateTo(context, Routes.doPropertyRepair);

  /// 摄像监控
  static void goMonitorPage(BuildContext context) =>
      Application.router.navigateTo(context, Routes.doMonitor);

  /// 缴纳费用
  static void goPayment(BuildContext context) =>
      Application.router.navigateTo(context, Routes.doPayment);

  /// 结束停车
  static void goParkingEnd(BuildContext context) =>
      Application.router.navigateTo(context, Routes.doParkingEnd);

  /// 场地预定
  static void goReservePage(BuildContext context) =>
          Application.router.navigateTo(context, Routes.doReserve);

  /// 预约时间
  static void goReserveSelectDatePage(BuildContext context) =>
          Application.router.navigateTo(context, Routes.doReserveSelectDate);

  /// 预约确认
  static void goReserveConfirmPage(BuildContext context) =>
          Application.router.navigateTo(context, Routes.doReserveConfirm);

  /// 快速预约
  static void goFastReservePage(BuildContext context) =>
          Application.router.navigateTo(context, Routes.doFastReserve);

  /// 预约成功
  static void goReserveSuccessPage(BuildContext context) =>
          Application.router.navigateTo(context, Routes.doReserveSuccess);

  /// 项目申报
  static void goReportActionPage(BuildContext context) =>
          Application.router.navigateTo(context, Routes.doReportAction);

  /// 信息详情
  static void goReportDetailPage(BuildContext context) =>
          Application.router.navigateTo(context, Routes.doReportDetail);

  ///  申请入口
  static void goApplyPage(BuildContext context) =>
          Application.router.navigateTo(context, Routes.doApply);

  ///  申请详情
  static void goApplyDetailPage(BuildContext context) =>
          Application.router.navigateTo(context, Routes.doApplyDetail);
}
