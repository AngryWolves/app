import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:smart_park/components/home/data/message_data_response.dart';
import 'package:smart_park/components/home/message_item.dart';
import 'package:smart_park/dio/home_dao.dart';
import 'package:smart_park/redux/app_state.dart';
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
      body: MessageList(),
    );
  }
}

class MessageList extends StatefulWidget {
  @override
  _MessageListState createState() => _MessageListState();
}

class _MessageListState extends RefreshListView<MessageList, MessageData> {

  HomeDao _homeDao;
  
  @override
  Widget buildItem(MessageData data) {
    return MessageItemView(data: data,);
  }

  @override
  Future<List<MessageData>> requestData(int page) async {
    _homeDao ??= HomeDao(StoreProvider.of<AppState>(context));

    var model = await _homeDao.getTipMessage(page: page);
    return model?.data;
  }
}
