import 'package:flutter/material.dart';
import 'package:smart_park/components/reserve/data/yard_response.dart';
import 'package:smart_park/components/reserve/item/reserve_item.dart';
import 'package:smart_park/components/reserve/reserve_page.dart';
import 'package:smart_park/components/reserve/tab/base_yard_list.dart';

class MeetingRoomTab extends StatefulWidget {
  @override
  _MeetingRoomTabState createState() => _MeetingRoomTabState();
}

class _MeetingRoomTabState extends State<MeetingRoomTab>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 15.0, top: 15.0, right: 15.0),
      child: _MeetingRoomList(),
    );
  }
}

class _MeetingRoomList extends StatefulWidget {
  @override
  _MeetingRoomListState createState() => _MeetingRoomListState();
}

class _MeetingRoomListState extends BaseYardList<_MeetingRoomList> {

  @override
  Widget buildItem(YardData data) {
    return RoomItem(data: data,);
  }

  @override
  int getType() => RESERVE_TAB_TYPE_MEETING;
}
