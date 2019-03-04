import 'package:flutter/material.dart';
import 'package:smart_park/components/home/home_body_list_head.dart';
import 'package:smart_park/components/home/home_list_notice_item.dart';
import 'package:smart_park/widget/base/refresh_list_view.dart';

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
