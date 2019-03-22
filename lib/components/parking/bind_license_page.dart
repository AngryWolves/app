import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:smart_park/components/parking/enter_license.dart';
import 'package:smart_park/components/parking/license_code_dialog.dart';
import 'package:smart_park/dio/parking_dao.dart';
import 'package:smart_park/redux/app_state.dart';
import 'package:smart_park/values/strings.dart';
import 'package:smart_park/widget/base/base_state.dart';
import 'package:smart_park/widget/black_top_white_bottom_bg.dart';
import 'package:smart_park/widget/common_app_bar.dart';
import 'package:smart_park/widget/common_gradient_button.dart';

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

  final GlobalKey<EnterLicenseViewState> _key = GlobalKey();

  ParkingDao _parkingDao;

  /// 已选车牌代码, 默认为 '京'
  String _selectedCode = BindLicensePage.codeList[0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCommonAppbar(bind_license_enter_title,
          onLeadTop: onBack, elevation: 0.0),
      body: Stack(
        children: <Widget>[
          BlackTopWhiteBottomLayer().layerBuilder,
          _buildCoverBindLayout()
        ],
      ),
    );
  }

  ///
  /// 绑定车牌号输入框
  ///
  Widget _buildCoverBindLayout() => ListView(
        children: <Widget>[
          EnterLicenseView(
            key: _key,
            onCodeSelectTap: _showSelectCodeDialog,
            code: _selectedCode,
          ),
          Container(
              margin: EdgeInsets.only(
                  top: ScreenUtil().setHeight(30), left: 15.0, right: 15.0),
              child: GradientButton(bind_license_ok, _handleConfirmTap))
        ],
      );

  ///
  /// 输入完成点击确定
  ///
  void _handleConfirmTap() async {
    var code = _key?.currentState?.controller?.text;
    if (code != null && code.isNotEmpty) {
      _parkingDao ??= ParkingDao(StoreProvider.of<AppState>(context));

      var response = await _parkingDao.bindLicense(plate: code);

      var msg = response?.msg;
      if (response?.result == 1 && msg != null) {
        Fluttertoast.showToast(msg: msg);
        return;
      }
    }
  }

  ///
  /// 选择车牌区号
  ///
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
