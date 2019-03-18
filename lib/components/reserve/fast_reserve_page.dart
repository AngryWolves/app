import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_park/router/navigator_util.dart';
import 'package:smart_park/values/colors.dart';
import 'package:smart_park/values/strings.dart';
import 'package:smart_park/widget/base/base_state.dart';
import 'package:smart_park/widget/common_app_bar.dart';
import 'package:smart_park/widget/common_gradient_button.dart';

class FastReservePage extends StatefulWidget {
  @override
  _FastReservePageState createState() => _FastReservePageState();
}

class _FastReservePageState extends BaseState<FastReservePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          buildCommonAppbar(reserve_fast_title, onLeadTop: onBack, actions: [
        GestureDetector(
          child: Container(
            alignment: Alignment.center,
            width: ScreenUtil().setWidth(50),
            height: ScreenUtil().setHeight(30),
            child: Text(
              reserve_fast_bar_action_clear,
              style: TextStyle(color: Colors.white, fontSize: 15.0),
            ),
          ),
        )
      ]),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    var item = _FastReserveItem();

    return Column(
      children: <Widget>[
        item
            .setInfo('images/ic_fast_reserve_type.png', reserve_fast_type,
                reserve_fast_type_desc)
            .reserveItemBuilder,
        item
            .setInfo('images/ic_fast_reserve_date.png', reserve_fast_date,
                reserve_fast_date_desc)
            .reserveItemBuilder,
        item
            .setInfo('images/ic_fast_reserve_location.png',
                reserve_fast_location, reserve_fast_location_desc)
            .reserveItemBuilder,
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 30.0),
          child: GradientButton(reserve_fast_confirm, () {
              NavigatorUtil.goReserveSuccessPage(context);
          }, ),
        )
      ],
    );
  }
}

class _FastReserveItem {
  String _icon;
  String _title;
  String _desc;

  _FastReserveItem setInfo(String icon, String title, String desc) {
    _icon = icon;
    _title = title;
    _desc = desc;
    return this;
  }

  Widget get reserveItemBuilder {
    return GestureDetector(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15.0),
        height: ScreenUtil().setHeight(45),
        decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: ColorRes.DIALOG_DIVIDER))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                Image.asset(
                  _icon,
                  width: 12.0,
                  height: 12.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                ),
                Text(
                  _title,
                  style: TextStyle(
                          color: ColorRes.FAST_RESERVE_ITEM_TITLE, fontSize: 12.0),
                )
              ],
            ),
            Row(
              children: <Widget>[
                Text(
                  _desc,
                  style: TextStyle(
                          color: ColorRes.FAST_RESERVE_ITEM_DESC, fontSize: 12.0),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                ),
                Icon(Icons.arrow_forward_ios, size: 10.0,)
              ],
            )
          ],
        ),
      ),
    );
  }
}
