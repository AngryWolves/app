import 'package:flutter/material.dart';
import 'package:smart_park/components/reserve/item/reserve_item.dart';
import 'package:smart_park/widget/base/refresh_list_view.dart';

class GymTab extends StatefulWidget {
  @override
  _GymTabState createState() => _GymTabState();
}

class _GymTabState extends State<GymTab>
        with AutomaticKeepAliveClientMixin {
  
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 15.0, top: 15.0, right: 15.0),
      child: _GymList(),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class _GymList extends StatefulWidget {
  @override
  _GymListState createState() => _GymListState();
}

class _GymListState extends RefreshListView<_GymList, String> {

  @override
  Widget buildItem(String data) {
    return RoomItem();
  }

  @override
  Future<List<String>> requestData(int page) async {
    return ['ss'];
  }
}

