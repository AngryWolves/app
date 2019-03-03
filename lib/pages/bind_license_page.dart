import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_park/values/colors.dart';
import 'package:smart_park/values/strings.dart';
import 'package:smart_park/widgets/base/base_state.dart';
import 'package:smart_park/widgets/common_app_bar.dart';
import 'package:smart_park/widgets/common_gradient_button.dart';
import 'package:smart_park/widgets/parking/enter_license.dart';
import 'package:smart_park/widgets/parking/license_code_dialog.dart';

class BindLicensePage extends StatefulWidget {
  static final codeList = [
    '京',
    '津',
    '沪',
    '渝',
    '冀',
    '豫',
    '云',
    '辽',
    '黑',
    '湘',
    '皖',
    '鲁',
    '新',
    '苏',
    '浙',
    '赣',
    '鄂',
    '桂',
    '甘',
    '晋',
    '蒙',
    '陕',
    '吉',
    '闽',
    '贵',
    '粤',
    '青',
    '藏',
    '川',
    '宁',
    '琼'
  ];

  @override
  _BindLicenceState createState() => _BindLicenceState();
}

class _BindLicenceState extends BaseState<BindLicensePage> {
  /// 已选车牌代码, 默认为 '京'
  String _selectedCode = BindLicensePage.codeList[0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCommonAppBar(bind_license_enter_title,
          onBack: onBack,
          color: ColorRes.BLACK_APP_BAR_BACKGROUND,
          titleColor: Colors.white,
          brightness: Brightness.dark,
          elevation: 0.0), //    appBar: buildParkingAppBar(),
      body: Stack(
        children: <Widget>[_buildBackground(), _buildCoverBindLayout()],
      ),
    );
  }

  ///
  /// 绑定车牌号输入框
  ///
  Widget _buildCoverBindLayout() => Column(
        children: <Widget>[
          EnterLicenseView(
            onCodeSelectTap: _showSelectCodeDialog,
            code: _selectedCode,
          ),
          Container(
              margin: EdgeInsets.only(
                  top: ScreenUtil().setHeight(30), left: 15.0, right: 15.0),
              child: GradientButton(bind_license_ok, () {}))
        ],
      );

  ///
  /// 上黑下白的背景
  ///
  Widget _buildBackground() => Column(
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

  void _showSelectCodeDialog() {
    showDialog(
        context: context,
        builder: (_) => LicenseCodeDialog(
              selectedCode: _selectedCode,
              onCodeTap: (code) {
                setState(() {
                  _selectedCode = code;
                });
              },
            ));
  }
}
