import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_park/values/colors.dart';
import 'package:smart_park/values/strings.dart';
import 'package:smart_park/widgets/base/base_state.dart';
import 'package:smart_park/widgets/common_app_bar.dart';
import 'package:smart_park/widgets/parking/enter_license.dart';

class BindLicensePage extends StatefulWidget {
  @override
  _BindLicenceState createState() => _BindLicenceState();
}

class _BindLicenceState extends BaseState<BindLicensePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCommonAppBar(bind_license_enter_title,
          onBack: onBack,
          color: ColorRes.BLACK_APP_BAR_BACKGROUND,
          titleColor: Colors.white,
          elevation: 0.0),
      body: Stack(
        children: <Widget>[_buildBackground(), _buildCoverBindLayout()],
      ),
    );
  }

  Widget _buildCoverBindLayout() => Column(
        children: <Widget>[
          EnterLicenseView(),
          GestureDetector(
            onTap: () {},
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(
                  top: ScreenUtil().setHeight(30), left: 15.0, right: 15.0),
              height: ScreenUtil().setHeight(50),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                gradient: LinearGradient(colors: [
                  ColorRes.BUTTON_START_COLOR,
                  ColorRes.BUTTON_END_COLOR
                ]),
              ),
              child: Text(
                bind_license_ok,
                style: TextStyle(
                    color: Colors.white, fontSize: ScreenUtil().setSp(17)),
              ),
            ),
          )
        ],
      );

  ///
  /// 上黑下白的背景
  ///
  Widget _buildBackground() => Column(
        children: <Widget>[
          Container(
            height: ScreenUtil().setHeight(110),
            color: ColorRes.BLACK_APP_BAR_BACKGROUND,
          ),
          Expanded(
            child: Container(
              color: ColorRes.APP_BACKGROUND,
            ),
          )
        ],
      );
}
