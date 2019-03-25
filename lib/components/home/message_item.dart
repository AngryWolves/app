import 'package:flutter/material.dart';
import 'package:smart_park/components/home/data/message_data_response.dart';
import 'package:smart_park/values/colors.dart';

class MessageItemView extends StatelessWidget {
  MessageItemView({this.data});

  final MessageData data;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      margin: const EdgeInsets.only(top: 15.0),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: ColorRes.DIALOG_DIVIDER))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Text(
              data?.alertTitle ?? '',
              style: TextStyle(
                  color: ColorRes.GERY_TEXT,
                  fontSize: 15.0,
                  fontWeight: FontWeight.w600),
            ),
          ),
          ListView(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.symmetric(vertical: 20.0),
                child: Text(
                  data?.alertContent ?? '',
                  style: TextStyle(
                    color: ColorRes.GERY_TEXT_HINT,
                    fontSize: 13.0,
                  ),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(bottom: 15.0),
                child: Text(
                  data?.createTime ?? '',
                  style: TextStyle(
                      color: ColorRes.NOTICE_ITEM_DATA, fontSize: 10.0),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
