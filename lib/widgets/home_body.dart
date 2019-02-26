import 'package:flutter/material.dart';
import 'package:smart_park/widgets/refresh_list_view.dart';

class HomeBodyView extends StatefulWidget {
  @override
  _HomeBodyViewState createState() => _HomeBodyViewState();
}

class _HomeBodyViewState extends RefreshListView<HomeBodyView, String> {


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
