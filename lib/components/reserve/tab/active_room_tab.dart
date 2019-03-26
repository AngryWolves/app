import 'package:flutter/material.dart';
import 'package:smart_park/components/reserve/data/yard_response.dart';
import 'package:smart_park/components/reserve/item/reserve_item.dart';
import 'package:smart_park/components/reserve/reserve_page.dart';
import 'package:smart_park/components/reserve/tab/base_yard_list.dart';

class ActiveRoomTab extends StatefulWidget {
  @override
  _ActiveRoomTabState createState() => _ActiveRoomTabState();
}

class _ActiveRoomTabState extends State<ActiveRoomTab>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 15.0, top: 15.0, right: 15.0),
      child: _ActiveRoomList(),
    );
  }
}

class _ActiveRoomList extends StatefulWidget {
  @override
  _ActiveRoomListState createState() => _ActiveRoomListState();
}

class _ActiveRoomListState extends BaseYardList<_ActiveRoomList> {
  @override
  Widget buildItem(YardData data) {
    return RoomItem(
      data: data,
    );
  }

  @override
  int getType() => RESERVE_TAB_TYPE_ACTIVE;
}
