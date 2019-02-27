import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smart_park/pages/home_page.dart';

void main() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(new SmartParkApp());
  });
}

class SmartParkApp extends StatefulWidget {
  @override
  _SmartParkAppState createState() => _SmartParkAppState();
}

class _SmartParkAppState extends State<SmartParkApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.white, brightness: Brightness.light),
      routes: {
        HomePage.sName: (_) => HomePage(),
      },
    );
  }
}
