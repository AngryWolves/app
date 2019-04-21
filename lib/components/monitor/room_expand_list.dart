import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_park/components/bluetooth/expand_title_item.dart';
import 'package:smart_park/dio/room_dao.dart';
import 'package:smart_park/router/navigator_util.dart';
import 'package:smart_park/values/colors.dart';

import 'data/room_response.dart';

class RoomExpandList extends StatefulWidget {
  RoomExpandList({this.roomData, this.roomDao});

  final RoomData roomData;

  final RoomDao roomDao;

  @override
  _RoomExpandListState createState() => _RoomExpandListState();
}

class _RoomExpandListState extends State<RoomExpandList> {
  final TextStyle _itemTitleStyle =
      TextStyle(fontSize: 12.0, color: ColorRes.GERY_TEXT);

  List<RoomData> _list;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    print('expand list build ----------');
    return Container(
      margin: const EdgeInsets.only(top: 15.0, left: 15.0, right: 15.0),
      child: ExpandTitleItem(
        title: widget.roomData.name,
        child: _buildBody(),
        callback: () {
          _getRoomData();
        },
      ),
//child: Text(widget.roomData.name),
//      child: _list == null || _list.isEmpty ? Container() : _buildBody(),
//      child: FutureBuilder<List<RoomData>>(
//          future: _getRoomData(widget.roomData.id),
//          builder: (_, snapShot) {
//            var list = snapShot.data;
//            if (snapShot.connectionState == ConnectionState.done &&
//                list != null &&
//                list.isNotEmpty) {
////              return ExpandTitleItem(
////                title: widget.roomData.name,
////                child: Text('ss'),
////              );
//            return Container(
//              child: Text('ssss'),
//            );
//            } else {
//              return Container();
//            }
//          }),
    );
  }

  Widget _buildBody() {
    if (_list == null || _list.isEmpty) {
      return Container();
    }
    return Container(
      margin: const EdgeInsets.all(10.0),
      child: GridView.count(
        shrinkWrap: true,
        crossAxisCount: 2,
        mainAxisSpacing: 1.1,
        crossAxisSpacing: 1.6,
        childAspectRatio: 1.2,
        children: _list.map((data) {
          return _buildMonitorItem(data);
        }).toList(),
      ),
    );
  }

  void _getRoomData() async {
    if (_list != null) {
      return;
    }
    _list = (await widget.roomDao.getRoom(floorId: widget.roomData.id))?.data;
    if (_list != null && _list.isNotEmpty && mounted) {
      setState(() {});
    }
  }

  Widget _buildMonitorItem(RoomData data) {
    return GestureDetector(
      onTap: () {
        NavigatorUtil.goPlayerPage(context);
      },
      child: Container(
        width: ScreenUtil().setWidth(158),
        height: ScreenUtil().setHeight(108),
        margin: const EdgeInsets.symmetric(horizontal: 5.0),
        child: Column(
          children: <Widget>[
            Container(
              height: ScreenUtil().setHeight(98),
              alignment: Alignment.center,
              margin: const EdgeInsets.only(bottom: 9.0),
              decoration: BoxDecoration(
                      color: ColorRes.PARKING_FEE_GERY,
                      borderRadius: BorderRadius.circular(3.0)),
              child: Icon(
                Icons.play_circle_outline,
                size: 35.0,
              ),
            ),
            Text(
              data.name,
              style: _itemTitleStyle,
            )
          ],
        ),
      ),
    );
  }
}
