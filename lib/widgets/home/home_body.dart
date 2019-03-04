import 'package:flutter/material.dart';
import 'package:smart_park/widgets/base/refresh_list_view.dart';
import 'package:smart_park/widgets/home/home_body_list_head.dart';
import 'package:smart_park/widgets/home/home_list_notice_item.dart';

class HomeBodyView extends StatefulWidget {
  @override
  _HomeBodyViewState createState() => _HomeBodyViewState();
}

class _HomeBodyViewState extends RefreshListView<HomeBodyView, String> {

  @override
  Widget buildItem(String data) {
    return HomeNoticeItem();
  }

  @override
  Future<List<String>> requestData(int page) async {
    return [''];
  }

  @override
  Widget buildHead() {
    return HomeBodyListHead();
  }
}
