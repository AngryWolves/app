import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_park/values/colors.dart';

class BlackTopWhiteBottomLayer {

    Widget get layerBuilder {
        return Column(
            children: <Widget>[
                Container(
                    decoration: BoxDecoration(
                        color: ColorRes.BLACK_APP_BAR_BACKGROUND,
                        border: Border(
                                top: BorderSide(color: ColorRes.BLACK_APP_BAR_BACKGROUND)),
                    ),
                    height: ScreenUtil().setHeight(110),
                ),
                Expanded(
                    child: Container(
                        color: ColorRes.APP_BACKGROUND,
                    ),
                )
            ],
        );
    }
}