import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:smart_park/config/application.dart';
import 'package:smart_park/config/routes.dart';
import 'package:smart_park/router/navigator_util.dart';
import 'package:smart_park/redux/app_state.dart';
import 'package:smart_park/dio/user_dao.dart';
import 'package:flutter_redux/flutter_redux.dart';

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
      UserDao(StoreProvider.of<AppState>(context))
          .getUserInfo()
          .then((account) async {
        if (false) {
          // 未登录
          NavigatorUtil.goLogin(context);
        } else {
          // 已登录
          NavigatorUtil.goHome(context);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // 开屏页
    return Container();
  }
}
