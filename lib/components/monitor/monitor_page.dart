import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_park/dio/room_dao.dart';
import 'package:smart_park/redux/app_state.dart';
import 'package:smart_park/values/colors.dart';
import 'package:smart_park/values/strings.dart';
import 'package:smart_park/widget/base/base_state.dart';
import 'package:smart_park/widget/common_app_bar.dart';

import 'data/build_response.dart';
import 'monitor_build_list.dart';

class MonitorPage extends StatefulWidget {
  @override
  _MonitorPageState createState() => _MonitorPageState();
}

class _MonitorPageState extends BaseState<MonitorPage>
    with TickerProviderStateMixin {
  RoomDao _roomDao;

  TabController _tabController;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorRes.APP_BACKGROUND,
      appBar: buildCommonAppbar(home_action_monitor, onLeadTop: onBack),
      body: FutureBuilder<List<BuildData>>(
          future: _getBuild(),
          builder: (_, snapShot) {
            var list = snapShot.data;
            if (snapShot.connectionState == ConnectionState.done &&
                list != null) {
              _tabController = TabController(length: list.length, vsync: this);
              return Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerLeft,
                    color: Colors.white,
                    height: ScreenUtil().setHeight(40),
                    child: TabBar(
                        isScrollable: true,
                        controller: _tabController,
                        tabs: list.map((data) {
                          return Container(
                            alignment: Alignment.center,
                            child: Text(
                              data.name,
                              style: TextStyle(
                                  color: ColorRes.GERY_TEXT, fontSize: 12.0),
                            ),
                          );
                        }).toList()),
                  ),
                  Expanded(
                    child: TabBarView(
                        controller: _tabController,
                        children: list.map((data) {
//                            return Container();
                          return BuildBody(buildName: data.name, roomDao: _roomDao,);
                        }).toList()),
                  )
                ],
              );
            } else {
              return Container();
            }
          }),
    );
  }

  ///
  /// 获取全部楼栋信息
  ///
  Future<List<BuildData>> _getBuild() async {
    _roomDao ??= RoomDao(StoreProvider.of<AppState>(context));

    return (await _roomDao.getBuild())?.data;
  }
}
