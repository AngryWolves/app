import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_park/components/payment/payment_bar_arc.dart';
import 'package:smart_park/values/colors.dart';
import 'package:smart_park/values/strings.dart';
import 'package:smart_park/widget/base/base_state.dart';
import 'package:smart_park/widget/common_gradient_button.dart';

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
                          () {},
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

  Widget _buildSliverBody() {
    return SliverList(
        delegate: SliverChildBuilderDelegate((context, index) {
      return Container(
        color: Colors.white,
        height: 30,
        child: Text('this is the $index item'),
      );
    }, childCount: 30));
  }
}
