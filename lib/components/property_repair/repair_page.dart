import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_park/values/colors.dart';
import 'package:smart_park/values/strings.dart';
import 'package:smart_park/widget/base/base_state.dart';
import 'package:smart_park/widget/common_app_bar.dart';

const REPAIR_ACTION_TYPE = 1;
const REPAIR_ACTION_RESERVE_DATE = 2;
const REPAIR_ACTION_DETAIL_DATE = 3;

class PropertyRepairPage extends StatefulWidget {
  @override
  _PropertyRepairPageState createState() => _PropertyRepairPageState();
}

class _PropertyRepairPageState extends BaseState<PropertyRepairPage> {
  int length = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCommonAppbar(home_action_report_repair, onLeadTop: onBack),
      body: Container(
        color: ColorRes.APP_BACKGROUND,
        child: Column(
          children: <Widget>[_buildRepairAction(), _buildIssueDesc()],
        ),
      ),
    );
  }

  Widget _buildIssueDesc() => Container(
        padding: const EdgeInsets.all(10.0),
        margin: const EdgeInsets.only(top: 10.0),
        height: ScreenUtil().setHeight(150),
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            CupertinoTextField(
              maxLength: 200,
              maxLines: 5,
              decoration: BoxDecoration(border: Border()),
            ),
            Container(
              alignment: Alignment.centerRight,
              child: Text(
                '($length/200',
                style: TextStyle(
                    color: ColorRes.REPAIR_ISSUE_DETAIL_LIMIT,
                    fontSize: ScreenUtil().setSp(12)),
              ),
            )
          ],
        ),
      );

  ///
  /// 报修类型, 预约日期, 详细时间
  ///
  Widget _buildRepairAction() => Container(
        margin: const EdgeInsets.only(top: 10.0),
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: <Widget>[
            _buildActionItem(repair_action_type, REPAIR_ACTION_TYPE),
            Container(height: 1.0, color: ColorRes.APP_BACKGROUND),
            _buildActionItem(
                repair_action_reserve_date, REPAIR_ACTION_RESERVE_DATE),
            Container(height: 1.0, color: ColorRes.APP_BACKGROUND),
            _buildActionItem(
                repair_action_detail_date, REPAIR_ACTION_DETAIL_DATE),
          ],
        ),
      );

  /// 报修事件 item
  Widget _buildActionItem(String title, int action) => GestureDetector(
        child: Container(
          height: ScreenUtil().setHeight(45),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                title,
                style: TextStyle(
                    fontSize: ScreenUtil().setSp(15),
                    color: ColorRes.GERY_TEXT),
              ),
              Row(
                children: <Widget>[
                  Text(
                    repair_action_select_please,
                    style: TextStyle(
                        fontSize: ScreenUtil().setSp(15),
                        color: ColorRes.GERY_TEXT),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                  ),
                  Image.asset(
                    'images/ic_next_arrow.png',
                    width: ScreenUtil().setWidth(8),
                    height: ScreenUtil().setWidth(15),
                    fit: BoxFit.fill,
                  )
                ],
              ),
            ],
          ),
        ),
      );
}
