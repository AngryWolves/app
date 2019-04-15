import 'package:flutter/material.dart';
import 'package:smart_park/router/navigator_util.dart';
import 'package:smart_park/values/colors.dart';
import 'package:smart_park/values/strings.dart';
import 'package:smart_park/widget/base/base_state.dart';
import 'package:smart_park/widget/common_app_bar.dart';

class MonitorPage extends StatefulWidget {
  @override
  _MonitorPageState createState() => _MonitorPageState();
}

class _MonitorPageState extends BaseState<MonitorPage>
    with TickerProviderStateMixin {
  final _tabs = ['1号楼', '2号楼', '3号楼', '4号楼', '5号楼', '6号楼', '7号楼'];

  TabController _tabController;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _tabController = TabController(length: _tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCommonAppbar(home_action_monitor, onLeadTop: onBack),
      body: Column(
        children: <Widget>[
          TabBar(
              isScrollable: true,
              controller: _tabController,
              tabs: _tabs.map((data) {
                return Container(
                  alignment: Alignment.center,
                  child: Text(
                    data,
                    style: TextStyle(color: ColorRes.GERY_TEXT, fontSize: 12.0),
                  ),
                );
              }).toList()),
          Expanded(
            child: TabBarView(
                    controller: _tabController,
                    children: _tabs.map((data) {
                      return Container(
                        color: ColorRes.APP_BACKGROUND,
                        child: Center(
                          child: GestureDetector(
                            onTap: () {
                              NavigatorUtil.goPlayerPage(context);
                            },
                            child: Text(data),
                          ),
                        ),
                      );
                    }).toList()),
          )
        ],
      ),
    );
  }
}
