import 'package:flutter/material.dart';
import 'package:smart_park/values/strings.dart';
import 'package:smart_park/widgets/base/refresh_list_view.dart';
import 'package:smart_park/widgets/common_app_bar.dart';

class MessagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildCommonAppBar(message_title, onBack: () {
            Navigator.pop(context);
        }),
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

