import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_park/router/navigator_util.dart';
import 'package:smart_park/values/colors.dart';
import 'package:smart_park/values/strings.dart';
import 'package:smart_park/widget/common_gradient_button.dart';

class ApplySheet extends StatefulWidget {
  @override
  _ApplySheetState createState() => _ApplySheetState();
}

class _ApplySheetState extends State<ApplySheet> {
  final _typeList = ['申请 A', '装修申请', '申请 B'];

  int _curIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(210),
      child: Column(
        children: <Widget>[
          _buildTitle(),
          _buildTypePicker(),
          _buildSelectAction()
        ],
      ),
    );
  }

  Widget _buildSelectAction() => Container(
        color: ColorRes.COLOR_COMMON_APP_BAR_BACKGROUND,
        height: ScreenUtil().setHeight(45),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(right: 20.0),
                alignment: Alignment.centerRight,
                child: Text(apply_has_selected_type + _typeList[_curIndex],
                    style: TextStyle(color: Colors.white)),
              ),
            ),
            Container(
              width: ScreenUtil().setWidth(100),
              child: GradientButton(
                repair_action_select_ok,
                () {
                  NavigatorUtil.goApplyDetailPage(context);
                },
                radius: 0.0,
              ),
            )
          ],
        ),
      );

  /// 类型选择
  Widget _buildTypePicker() => Expanded(
          child: Container(
        color: Colors.white,
        height: ScreenUtil().setHeight(143),
        child: CupertinoPicker(
          backgroundColor: Colors.white,
          itemExtent: 40.0,
          onSelectedItemChanged: (selectIndex) {
            print('selecIndex ::::::: $selectIndex');
            setState(() {
              _curIndex = selectIndex;
            });
          },
          children: _typeList.map((type) {
            return Container(
              child: Text(
                type,
                style: TextStyle(
                    fontSize: ScreenUtil().setSp(24),
                    color: ColorRes.GERY_TEXT),
              ),
            );
          }).toList(),
        ),
      ));

  /// 标题
  Widget _buildTitle() => Container(
        padding: const EdgeInsets.only(left: 15.0),
        height: ScreenUtil().setHeight(35),
        color: ColorRes.COLOR_LOGIN_BORDER_SIDE,
        alignment: Alignment.centerLeft,
        child: Text(
          apply_select_type,
          style: TextStyle(
              fontSize: ScreenUtil().setSp(13),
              color: ColorRes.REPAIR_SELECT_TYPE_TITLE),
        ),
      );
}
