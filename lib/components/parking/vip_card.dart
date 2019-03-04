import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_park/values/colors.dart';
import 'package:smart_park/values/strings.dart';
import 'package:smart_park/widget/common_stroke_button.dart';

class VipCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _buildHasVipCar();
  }

  ///
  /// 未购买月卡
  ///
  Widget _buildNoVipLayout() => Column(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(top: 10.0),
            padding: const EdgeInsets.all(10.0),
            height: ScreenUtil().setHeight(98),
            width: ScreenUtil.screenWidth,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5.0),
                    topRight: Radius.circular(5.0))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Image.asset(
                  'images/ic_vip_card.png',
                  width: ScreenUtil().setWidth(54),
                  height: ScreenUtil().setHeight(18),
                ),
                Text(
                  parking_has_no_vip_card,
                  style: TextStyle(
                      fontSize: ScreenUtil().setSp(14),
                      color: ColorRes.GERY_TEXT),
                ),
                Text(
                  parking_has_no_vip_card_desc,
                  style: TextStyle(
                      fontSize: ScreenUtil().setSp(12),
                      color: ColorRes.GERY_TEXT),
                ),
                Text(
                  parking_has_no_vip_card_hint,
                  style: TextStyle(
                      fontSize: ScreenUtil().setSp(12),
                      color: ColorRes.TEXT_FIELD_BORDER),
                )
              ],
            ),
          ),
          Container(
            height: ScreenUtil().setHeight(52),
            alignment: Alignment.centerRight,
            margin: const EdgeInsets.only(top: 1.0),
            padding: const EdgeInsets.only(right: 10.0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(5.0),
                    bottomRight: Radius.circular(5.0))),
            child: buildCommonStrokeButton(parking_has_no_vip_card_buy),
          )
        ],
      );

  Widget _buildHasVipCar() => Container(
        margin: const EdgeInsets.only(top: 10.0),
        padding: const EdgeInsets.all(10.0),
        height: ScreenUtil().setHeight(79),
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(5.0))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Image.asset(
                  'images/ic_vip_card.png',
                  width: ScreenUtil().setWidth(54),
                  height: ScreenUtil().setHeight(18),
                ),
                Text(
                  parking_has_no_vip_card_limit,
                  style: TextStyle(
                          fontSize: ScreenUtil().setSp(14), color: ColorRes.GERY_TEXT),
                ),
                Text(
                  '2019年5月22日',
                  style: TextStyle(
                          fontSize: ScreenUtil().setSp(14), color: ColorRes.TEXT_FIELD_BORDER),
                )
              ],
            ),
            buildCommonStrokeButton(parking_has_no_vip_card_renewal_fee)
          ],
        ),
      );
}
