import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_park/components/reserve/item/room_info_head.dart';
import 'package:smart_park/components/reserve/select_date_tab_item.dart';
import 'package:smart_park/components/reserve/tab/date_select_tab_view.dart';
import 'package:smart_park/router/navigator_util.dart';
import 'package:smart_park/values/colors.dart';
import 'package:smart_park/values/strings.dart';
import 'package:smart_park/widget/base/base_state.dart';
import 'package:smart_park/widget/common_app_bar.dart';
import 'package:smart_park/widget/common_gradient_button.dart';

class ReserveSelectDate extends StatefulWidget {
  @override
  _ReserveSelectDateState createState() => _ReserveSelectDateState();
}

class _ReserveSelectDateState extends BaseState<ReserveSelectDate>
    with TickerProviderStateMixin {
  final List<_DateChoice> _dateChoices = [
    _DateChoice('今天', '1月23日'),
    _DateChoice('明天', '1月24日'),
    _DateChoice('后天', '1月25日'),
    _DateChoice('周六', '1月26日'),
    _DateChoice('周日', '1月27日'),
  ];

  TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: _dateChoices.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCommonAppbar(reserve_select_date_title, onLeadTop: onBack),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Column(
              children: <Widget>[
                RoomInfoHead().roomInfoBuilder,
                _buildDateSelectTab(),
                _buildDateSelectBody()
              ],
            ),
          ),
          _buildHasSelected()
        ],
      ),
    );
  }

  Widget _buildHasSelected() {
    return Container(
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              alignment: Alignment.centerRight,
              height: ScreenUtil().setHeight(45),
              color: ColorRes.GERY_TEXT,
              child: Text(
                reserve_select_date_has_selected + '',
                style: TextStyle(color: Colors.white, fontSize: 13.0),
              ),
            ),
          ),
          Container(
            width: ScreenUtil().setWidth(100),
            child: GradientButton(
              reserve_select_date_confirm,
              () {
                NavigatorUtil.goReserveConfirmPage(context);
              },
              radius: 0.0,
              fontSize: 15,
              height: 45,
            ),
          )
        ],
      ),
    );
  }

  ///
  /// 日期选择 tab
  ///
  Widget _buildDateSelectTab() {
    var tabItem = SelectDateTabItem();

    return Container(
      height: ScreenUtil().setHeight(45),
      child: TabBar(
        labelColor: ColorRes.BLUE_TEXT,
        unselectedLabelColor: ColorRes.GERY_TEXT,
        indicator: UnderlineTabIndicator(
            borderSide: BorderSide(color: ColorRes.BLUE_TEXT, width: 2.0),
            insets: const EdgeInsets.symmetric(horizontal: 19.0)),
        tabs: _dateChoices.map((choice) {
          return tabItem.setInfo(choice.title, choice.date).itemBuilder;
        }).toList(),
        controller: _controller,
      ),
    );
  }

  ///
  /// 时间段选择
  ///
  Widget _buildDateSelectBody() {
    return Expanded(
      child: TabBarView(
        children: _dateChoices.map((choice) {
          return DateSelectTabView();
        }).toList(),
        controller: _controller,
      ),
    );
  }
}

class _DateChoice {
  _DateChoice(this.title, this.date);

  String title;
  String date;
}
