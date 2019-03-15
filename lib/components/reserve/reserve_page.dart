import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_park/values/strings.dart';
import 'package:smart_park/widget/base/base_state.dart';
import 'package:smart_park/widget/common_app_bar.dart';

class ReservePage extends StatefulWidget {
  @override
  _ReservePageState createState() => _ReservePageState();
}

class _ReservePageState extends BaseState<ReservePage> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCommonAppbar(home_action_reserve_site,
          onLeadTop: onBack, actions: _buildBarActions()),
    );
  }

  Widget _buildTabBar() {
    return TabBar(tabs: null);
  }

  ///
  /// 快速预定
  ///
  List<Widget> _buildBarActions() => <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              child: Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(right: 15.0),
                width: ScreenUtil().setWidth(50),
                height: 25.0,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(3.0)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Image.asset(
                      'images/ic_reserve_lightning.png',
                      width: 7.0,
                      height: 13.0,
                      fit: BoxFit.fill,
                    ),
                    Text(
                      reserve_action_ok,
                      style: TextStyle(color: Colors.white, fontSize: 12.0),
                    ),
                  ],
                ),
              ),
            )
          ],
        )
      ];
}
