import 'package:flutter/material.dart';
import 'package:smart_park/values/colors.dart';
import 'package:smart_park/values/strings.dart';
import 'package:smart_park/widget/base/refresh_list_view.dart';
import 'package:smart_park/widget/common_app_bar.dart';

class MessagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCommonAppbar(message_title, onLeadTop: () {
        Navigator.pop(context);
      },
          titleColor: ColorRes.GERY_TEXT,
          backgroundColor: Colors.white,
          elevation: 1.0,
          brightness: Brightness.light),
    );
  }
}

class MessageList extends StatefulWidget {
  @override
  _MessageListState createState() => _MessageListState();
}

class _MessageListState extends RefreshListView<MessageList, String> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }

  @override
  Widget buildItem(String data) {
    // TODO: implement buildItem
    return null;
  }

  @override
  Future<List<String>> requestData(int page) {
    // TODO: implement requestData
    return null;
  }
}
