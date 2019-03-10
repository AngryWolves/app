import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_park/components/payment/payment_bar_arc.dart';
import 'package:smart_park/http/http_client.dart';
import 'package:smart_park/plugin/unionpay_plugin.dart';
import 'package:smart_park/values/colors.dart';
import 'package:smart_park/values/strings.dart';
import 'package:smart_park/widget/base/base_state.dart';
import 'package:smart_park/widget/common_gradient_button.dart';
import 'package:smart_park/widget/modal_bottom_sheet_pay.dart';

class PaymentPage extends StatefulWidget {
  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends BaseState<PaymentPage> {
  final double _toolBarHeight = ScreenUtil().setHeight(310);

  final TextStyle _style = TextStyle(color: Colors.white, fontSize: 13.0);

  final double _arcRingHorMargin = ScreenUtil().setWidth(45);
  final double _arcRingTopMargin = ScreenUtil().setHeight(75);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: <Widget>[
          _buildSliverAppBar(),
          _buildSliverBody(),
        ],
      ),
    );
  }

  /// appBar
  Widget _buildSliverAppBar() => SliverAppBar(
        title: Container(
          child: Text(home_action_pay),
        ),
        backgroundColor: ColorRes.BLACK_APP_BAR_BACKGROUND,
        pinned: true,
        expandedHeight: _toolBarHeight,
        flexibleSpace: FlexibleSpaceBar(
          background: _buildSpaceBody(),
        ),
      );

  /// appbar body
  Widget _buildSpaceBody() => Container(
        margin: EdgeInsets.only(
            left: _arcRingHorMargin,
            right: _arcRingHorMargin,
            top: _arcRingTopMargin),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Stack(
              alignment: Alignment.topCenter,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: ScreenUtil().setHeight(39)),
                  height: ScreenUtil().setHeight(128),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        payment_need_pay,
                        style: _style,
                      ),
                      Text(
                        '3,000',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: ScreenUtil().setSp(30)),
                      ),
                      Container(
                        width: ScreenUtil().setWidth(108),
                        child: GradientButton(
                          payment_pay_now,
                          _handlePayNow,
                          radius: 18.0,
                          height: 35,
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  width: ScreenUtil().setWidth(226),
                  child: CustomPaint(
                    painter: GradientArc(),
                  ),
                ),
              ],
            ),
            _buildFeeRow()
          ],
        ),
      );

  Widget _buildFeeRow() => Container(
        height: ScreenUtil().setHeight(50),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            _buildFeeItem(payment_water_fee, '1,000'),
            _buildFeeItem(payment_property_fee, '111,111,000'),
            _buildFeeItem(payment_ele_fee, '109'),
          ],
        ),
      );

  Widget _buildFeeItem(String title, String fee) => Container(
        margin: const EdgeInsets.only(bottom: 2.0),
        width: ScreenUtil().setWidth(50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              fee ?? '',
              style: TextStyle(
                  color: Colors.white, fontSize: ScreenUtil().setSp(15)),
              maxLines: 1,
            ),
            Text(
              title,
              style: _style,
            ),
            Container(
              width: ScreenUtil().setWidth(8),
              height: ScreenUtil().setHeight(4),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2.0),
                  color: ColorRes.BUTTON_START_COLOR),
            )
          ],
        ),
      );

  ///
  /// 历史记录列表
  ///
  Widget _buildSliverBody() {
    return SliverList(
        delegate: SliverChildBuilderDelegate((context, index) {
      if (index == 0) {
        return Container(
          padding: EdgeInsets.only(left: 15.0),
          alignment: Alignment.centerLeft,
          height: ScreenUtil().setHeight(35),
          color: ColorRes.APP_BACKGROUND,
          child: Text(
            payment_payment_history,
          ),
        );
      }
      return PaymentHistoryItem(text: '$index').buildItem;
    }, childCount: 30));
  }

  void _handlePayNow() {
    showDialog(
        context: context,
        builder: (ctx) => ModalBottomSheetPay(
              '30',
              onPayState: (int type) {
//                print('tap sheet pay type ::: $type');
                _payNow();
              },
            ));
  }

  void _payNow() async {
    print('get native pay result :: before');

    try {
      var response = await Dio().get('http://101.231.204.84:8091/sim/getacptn');
      print('response ::: $response');
      var result = await UnionPayPlugin().pay(response?.data?.toString());
      print('get native pay result :: $result');
    } catch (e) {
      print(e);
    }

  }
}

class PaymentHistoryItem {
  PaymentHistoryItem({this.text});

  final String text;

  final TextStyle _titleStyle = TextStyle(color: ColorRes.GERY_TEXT);
  final TextStyle _amountStyle = TextStyle(
      color: ColorRes.REPAIR_SELECT_TYPE_TITLE,
      fontSize: ScreenUtil().setSp(18));

  Widget get buildItem {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(horizontal: 15.0),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: ColorRes.DIALOG_DIVIDER))),
      height: ScreenUtil().setHeight(60),
      child: ListTile(
        leading: Image.asset(
          'images/ic_payment_item_head.png',
          width: ScreenUtil().setWidth(13),
          height: ScreenUtil().setWidth(13),
        ),
        title: Text(
          text,
          style: _titleStyle,
        ),
        trailing: Text(
          '- ¥ 4000.00',
          style: _amountStyle,
        ),
      ),
    );
  }
}
