import 'package:flutter/material.dart';

class CommonTransparentBottomDialog extends StatefulWidget {
  CommonTransparentBottomDialog({this.bottomBody}) : assert(bottomBody != null);

  final Widget bottomBody;

  @override
  _CommonTransparentBottomDialogState createState() =>
      _CommonTransparentBottomDialogState();
}

class _CommonTransparentBottomDialogState
    extends State<CommonTransparentBottomDialog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        children: <Widget>[
          Expanded(
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                color: Colors.transparent,
              ),
            ),
          ),
          widget.bottomBody
        ],
      ),
    );
  }
}
