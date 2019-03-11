import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:smart_park/config/application.dart';
import 'package:smart_park/config/routes.dart';
import 'package:smart_park/router/navigator_util.dart';

class AppComponent extends StatefulWidget {
  @override
  State createState() {
    return _AppComponentState();
  }
}

class _AppComponentState extends State<AppComponent> {
  _AppComponentState() {
    final router = new Router();
    Routes.configureRoutes(router);
    Application.router = router;
  }

  bool _hasInit = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_hasInit) {
      return;
    }
    _hasInit = true;

    Future.delayed(Duration(seconds: 1)).then((value) {
      // todo check login status
      bool isLogin = false;
      if (isLogin) {
        NavigatorUtil.goLogin(context);
      } else {
        NavigatorUtil.goHome(context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // 开屏页
    return Container();
  }
}
