import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_park/components/payment/data/my_payment_response.dart';
import 'package:smart_park/components/payment/payment_bar_arc.dart';
import 'package:smart_park/dio/payment_dao.dart';
import 'package:smart_park/redux/app_state.dart';
import 'package:smart_park/utils/object_util.dart';
import 'package:smart_park/values/colors.dart';
import 'package:smart_park/values/strings.dart';
import 'package:smart_park/widget/base/base_state.dart';
import 'package:smart_park/widget/base/refresh_list_view.dart';
import 'package:smart_park/widget/common_gradient_button.dart';
import 'package:smart_park/widget/modal_bottom_sheet_pay.dart';

class PaymentPage extends StatefulWidget {
  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends BaseState<PaymentPage> {
  final double _toolBarHeight = ScreenUtil().setHeight(280);

  final TextStyle _style = TextStyle(color: Colors.white, fontSize: 13.0);

  final double _arcRingHorMargin = ScreenUtil().setWidth(45);
  final double _arcRingTopMargin = ScreenUtil().setHeight(85);

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
        child: Stack(
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
    return SliverToBoxAdapter(
      child: PaymentList(),
    );
  }

  void _handlePayNow() {
    showDialog(
        context: context,
        builder: (ctx) => ModalBottomSheetPay(
              '30',
              onPayState: (int type) {
//                print('tap sheet pay type ::: $type');
              },
            ));
  }
}

class PaymentList extends StatefulWidget {
  @override
  _PaymentListState createState() => _PaymentListState();
}

class _PaymentListState extends RefreshListView<PaymentList, MyPaymentData> {

  PaymentDao _paymentDao;



  @override
  Widget buildItem(MyPaymentData data) {
    return PaymentHistoryItem(text: data).buildItem;
  }

  @override
  Future<List<MyPaymentData>> requestData(int page) async {
    _paymentDao ??= PaymentDao(StoreProvider.of<AppState>(context));

    return (await _paymentDao.getPaymentList(page: page))?.data;
  }
}

class PaymentHistoryItem {
  PaymentHistoryItem({this.text});

  final MyPaymentData text;

  final TextStyle _titleStyle = TextStyle(color: ColorRes.GERY_TEXT);
  final TextStyle _amountStyle = TextStyle(
      color: ColorRes.REPAIR_SELECT_TYPE_TITLE,
      fontSize: ScreenUtil().setSp(18));

  Widget get buildItem {
    if (text == null) {
      return Container();
    }

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
          ObjectUtil.formatData(text.createTime),
          style: _titleStyle,
        ),
        trailing: Text(
          '- ¥ ${text.payAmount}',
          style: _amountStyle,
        ),
      ),
    );
  }
}
