import 'dart:io';
import 'package:flutter/services.dart';

import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:smart_park/config/routes.dart';
import 'package:smart_park/components/app/app_component.dart';

void main() {
    // 固定竖屏
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
            .then((_) {
        runApp(new AppComponent());
    });
    if (Platform.isAndroid) {
// 以下两行 设置android状态栏为透明的沉浸。写在组件渲染之后，是为了在渲染后进行set赋值，覆盖状态栏，写在渲染之前MaterialApp组件会覆盖掉这个值。
        SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(statusBarColor: Colors.transparent);
        SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
    }
}