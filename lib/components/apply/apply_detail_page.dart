import 'package:flutter/material.dart';
import 'package:smart_park/values/colors.dart';
import 'package:smart_park/values/strings.dart';
import 'package:smart_park/widget/base/base_state.dart';
import 'package:smart_park/widget/common_app_bar.dart';

class ApplyDetail extends StatefulWidget {
  @override
  _ApplyDetailState createState() => _ApplyDetailState();
}

class _ApplyDetailState extends BaseState<ApplyDetail> {
  final TextStyle _style =
      TextStyle(color: ColorRes.GERY_TEXT_HINT, fontSize: 13.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildCommonAppbar(apply_detail_title, onLeadTop: onBack),
      body: _buildBody(),
    );
  }

  Widget _buildBody() => Container(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              '室内刷墙',
              style: TextStyle(
                  color: ColorRes.GERY_TEXT,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600),
            ),
            Padding(padding: const EdgeInsets.all(15.0)),
            Text(
              '订单编号：20190223',
              style: _style,
            ),
            Padding(padding: const EdgeInsets.all(11.0)),
            Text(
              '申请时间：2019-9-23',
              style: _style,
            ),
            Padding(padding: const EdgeInsets.all(10.0)),
            Divider(
              color: ColorRes.DIALOG_DIVIDER,
              height: 1.0,
            ),
            ListView(
              shrinkWrap: true,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(top: 15.0),
                  height: 400.0,
                  color: ColorRes.APPLY_DETAIL_EXCEL_BG,
                )
              ],
            )
          ],
        ),
      );
}
