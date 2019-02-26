import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_park/widgets/home/app_bar.dart';
import 'package:smart_park/widgets/home_body.dart';

class HomePage extends StatefulWidget {
  static final sName = '/';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _hasInit = false;

  @override
  Widget build(BuildContext context) {
    if (!_hasInit) {
      ScreenUtil.instance = ScreenUtil(width: 375, height: 667)..init(context);
      _hasInit = true;
    }
    return Scaffold(
      appBar: buildHomeAppBar(),
      body: HomeBodyView() ,
    );
  }
}
