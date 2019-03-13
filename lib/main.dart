import 'dart:io';

import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smart_park/config/application.dart';
import 'package:smart_park/config/routes.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux/redux.dart';
import 'package:smart_park/http/http_client.dart';
import 'package:smart_park/redux/app_state.dart';
import 'package:smart_park/data/user_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

void main() {
  // 固定竖屏
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(new SmartParkApp());
  });
  if (Platform.isAndroid) {
// 以下两行 设置android状态栏为透明的沉浸。写在组件渲染之后，是为了在渲染后进行set赋值，覆盖状态栏，写在渲染之前MaterialApp组件会覆盖掉这个值。
    SystemUiOverlayStyle systemUiOverlayStyle =
        SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}

class SmartParkApp extends StatefulWidget {
  @override
  _SmartParkAppState createState() => _SmartParkAppState();
}

class _SmartParkAppState extends State<SmartParkApp> {
  final Store<AppState> _store = Store<AppState>(
    appReducer,
    initialState: AppState(account: Account.empty()),
  );
  _SmartParkAppState() {
    final router = new Router();
    Routes.configureRoutes(router);
    Application.router = router;
  }
  @override
  Widget build(BuildContext context) => StoreProvider(
    store: _store,
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: Application.router.generator,
    ),
  );
}
