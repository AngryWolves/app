import 'package:flutter/material.dart';

class SelectDateTabItem {
  String _title = '';
  String _date = '';

  SelectDateTabItem setInfo(String title, String date) {
    this._title = title;
    this._date = date;
    return this;
  }

  Widget get itemBuilder {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            _title,
            style: TextStyle(fontSize: 11.0),
          ),
          Text(
            _date,
            style: TextStyle(fontSize: 9.0),
          ),
        ],
      ),
    );
  }
}
