import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_park/components/bluetooth/expand_title_item.dart';
import 'package:smart_park/components/monitor/room_expand_list.dart';
import 'package:smart_park/dio/room_dao.dart';
import 'package:smart_park/values/colors.dart';
import 'package:smart_park/widget/base/refresh_list_view.dart';

import 'data/room_response.dart';

class BuildBody extends StatefulWidget {
  BuildBody({this.buildName, this.roomDao});

  final String buildName;

  final RoomDao roomDao;
  @override
  _BuildBodyState createState() => _BuildBodyState();
}

class _BuildBodyState extends State<BuildBody>
        with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return BuildList(buildName: widget.buildName, roomDao: widget.roomDao,);
  }

  @override
  bool get wantKeepAlive => true;
}


class BuildList extends StatefulWidget {
  BuildList({this.buildName, this.roomDao});

  final String buildName;

  final RoomDao roomDao;

  @override
  _BuildListState createState() => _BuildListState();
}

class _BuildListState extends RefreshListView<BuildList, RoomData> {

  @override
  Widget buildItem(RoomData data) {
    print('roomData name ::::${data.name}');
    return RoomExpandList(roomDao: widget.roomDao, roomData: data,);
  }

  @override
  Future<List<RoomData>> requestData(int page) async {
    return (await widget.roomDao.getFloor(buildName: widget.buildName))?.data;
  }
}
