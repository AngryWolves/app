import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_park/values/colors.dart';
import 'package:smart_park/values/strings.dart';
import 'package:smart_park/widget/common_gradient_button.dart';
import 'package:smart_park/widget/modal_bottom_sheet_pay.dart';

///
/// 点击购买月卡底部弹窗
///
class BuyVipSheet extends StatefulWidget {
  @override
  _BuyVipSheetState createState() => _BuyVipSheetState();
}

class _BuyVipSheetState extends State<BuyVipSheet> {
  final List<String> _monthList = ['1', '3', '6', '9', '12'];

  String _selectedMonth = '';

  bool _isSelectMonth = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(210),
      child: Column(
        children: <Widget>[
          _buildTitle(),
          _buildSelectBody(),
          _buildBuyAction()
        ],
      ),
    );
  }

  ///
  /// 合计金额 , 下一步
  ///
  Widget _buildBuyAction() {
    var textStyle = TextStyle(color: Colors.white, fontSize: 13.0);
    var monthSelected;
    if (_isSelectMonth) {
      monthSelected = Text(
        parking_pay_card_has_selected_month +
            _selectedMonth +
            parking_pay_card_select_month,
        style: textStyle,
      );
    } else {
      monthSelected = Container();
    }

    return Container(
      height: ScreenUtil().setHeight(45),
      child: Container(
        color: ColorRes.BLACK_APP_BAR_BACKGROUND,
        child: Row(
          children: <Widget>[
            Expanded(
                child: Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  monthSelected,
                  Text(
                    parking_pay_card_total_amount + unit_rmb + '30',
                    style: textStyle,
                  )
                ],
              ),
            )),
            Container(
              width: ScreenUtil().setWidth(100),
              child: GradientButton(
                parking_pay_card_next,
                _handlePayNext,
                radius: 0.0,
                height: 45,
              ),
            )
          ],
        ),
      ),
    );
  }

  ///
  /// body
  ///
  Widget _buildSelectBody() {
    var body;
    if (_isSelectMonth) {
      body = _buildMonthPicker();
    } else {
      body = _buildSelectItem();
    }

    return Expanded(
      child: Container(
        alignment: Alignment.topCenter,
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: body,
      ),
    );
  }

  /// 选择购买期限
  Widget _buildSelectItem() {
    String timeLimit;
    Color timeColor;
    if (_selectedMonth.isEmpty) {
      timeLimit = parking_pay_card_select;
      timeColor = ColorRes.GERY_TEXT_HINT;
    } else {
      timeLimit = _selectedMonth + parking_pay_card_select_month;
      timeColor = ColorRes.BLUE_TEXT;
    }
    return GestureDetector(
      onTap: () {
        setState(() {
          _isSelectMonth = true;
        });
      },
      child: Container(
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: ColorRes.DIALOG_DIVIDER))),
        height: ScreenUtil().setHeight(60),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text.rich(TextSpan(
                text: parking_pay_card_select_limit_time,
                style: TextStyle(color: ColorRes.GERY_TEXT, fontSize: 18.0),
                children: [
                  TextSpan(
                      text: parking_pay_card_desc,
                      style:
                          TextStyle(color: ColorRes.GERY_TEXT, fontSize: 13.0))
                ])),
            Row(
              children: <Widget>[
                Text(
                  timeLimit,
                  style: TextStyle(color: timeColor, fontSize: 16.0),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 15.0,
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  ///
  /// 标题
  ///
  Widget _buildTitle() => Container(
        //      height: ScreenUtil().setHeight(height),
        padding: const EdgeInsets.only(left: 15.0, top: 11.0, bottom: 11.0),
        child: Text(
          parking_pay_card_title,
          style: TextStyle(
              color: ColorRes.REPAIR_SELECT_TYPE_TITLE, fontSize: 13.0),
        ),
      );

  ///
  /// 点击下一步
  ///
  void _handlePayNext() {
    if (_isSelectMonth) {
      // 改变月卡选择期限
      setState(() {
        _isSelectMonth = false;
      });
    } else {
      // 支付
      showModalBottomSheet(context: context, builder: (ctx) {
        return ModalBottomSheetPay('30', onPayState: (value) {
          Navigator.pop(ctx);
        },);
      });
    }
  }

  Widget _buildMonthPicker() => CupertinoPicker.builder(
    onSelectedItemChanged: (index) {
      setState(() {
        _selectedMonth = _monthList[index];
      });
    },
    backgroundColor: Colors.white,
        itemExtent: 30.0,
        childCount: _monthList.length,
        itemBuilder: (context, index) {
          return Container(
            alignment: Alignment.center,
            child: Text(
              _monthList[index],
              style: TextStyle(color: Colors.black, fontSize: 24.0),
            ),
          );
        },
      );
}
