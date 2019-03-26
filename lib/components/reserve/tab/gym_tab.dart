import 'package:flutter/material.dart';
import 'package:smart_park/components/reserve/data/yard_response.dart';
import 'package:smart_park/components/reserve/item/reserve_item.dart';
import 'package:smart_park/components/reserve/reserve_page.dart';
import 'package:smart_park/components/reserve/tab/base_yard_list.dart';

class GymTab extends StatefulWidget {
  @override
  _GymTabState createState() => _GymTabState();
}

class _GymTabState extends State<GymTab> with AutomaticKeepAliveClientMixin {
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

class _GymListState extends BaseYardList<_GymList> {
  @override
  Widget buildItem(YardData data) => RoomItem(
        data: data,
      );

  @override
  int getType() => RESERVE_TAB_TYPE_GYM;
}
