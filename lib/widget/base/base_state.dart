import 'package:flutter/material.dart';
import 'package:smart_park/widget/loading_dialog.dart';

abstract class BaseState<T extends StatefulWidget> extends State<T> {
  bool _loadingIsShow = false;

  BuildContext _loadingContext;

  void hideLoading() {
    if (_loadingIsShow && _loadingContext != null) {
      Navigator.pop(_loadingContext);
      _loadingIsShow = false;
      _loadingContext = null;
    }
  }

  void showLoading() {
    if (_loadingIsShow) {
      return;
    }
    showDialog(
        context: context,
        builder: (ctx) {
          _loadingContext = ctx;
          _loadingIsShow = true;
          return LoginDialog();
        });
  }

  void onBack({result}) {
      Navigator.pop(context, result);
  }
}
