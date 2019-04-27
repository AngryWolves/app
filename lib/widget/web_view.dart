import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:smart_park/widget/common_app_bar.dart';

class WebViewPage extends StatefulWidget {
  WebViewPage({this.url});

  final String url;

  @override
  _WebViewPageState createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      appBar: buildCommonAppbar('', onLeadTop: () {
        Navigator.pop(context);
      },
          backgroundColor: Colors.white,
          titleColor: Colors.black,
          brightness: Brightness.light),
      url: widget.url,
      withJavascript: true,
      withLocalStorage: true,
    );
  }

  @override
  void dispose() {
    FlutterWebviewPlugin().close();
    super.dispose();
  }
}
