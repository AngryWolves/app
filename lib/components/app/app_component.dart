import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_park/config/routes.dart';
import 'package:smart_park/config/application.dart';
import 'package:smart_park/components/login/login_screent.dart';

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

  @override
  Widget build(BuildContext context) {
//    ScreenUtil.instance = ScreenUtil(width: 375, height: 667)..init(context);
    final app = MaterialApp(
      title: 'Fluro',
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: Application.router.generator,
      home: LoginScreen(),
    );
    print("initial route = ${app.initialRoute}");
    return app;
  }
}
