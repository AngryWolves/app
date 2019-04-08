import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_park/components/apply/apply_sheet.dart';
import 'package:smart_park/components/apply/data/my_apply_response.dart';
import 'package:smart_park/dio/apply_dao.dart';
import 'package:smart_park/redux/app_state.dart';
import 'package:smart_park/values/colors.dart';
import 'package:smart_park/values/strings.dart';
import 'package:smart_park/widget/base/base_state.dart';
import 'package:smart_park/widget/common_app_bar.dart';

class ApplyPage extends StatefulWidget {
  @override
  _ApplyPageState createState() => _ApplyPageState();
}

class _ApplyPageState extends BaseState<ApplyPage> {
  final _ApplyItem _item = _ApplyItem();

  ApplyDao _applyDao;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorRes.APP_BACKGROUND,
      appBar: buildCommonAppbar(apply_title,
          onLeadTop: onBack, actions: _buildBarAction()),
      body: Container(
        margin: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              apply_has_already,
              style: TextStyle(
                  color: ColorRes.FAST_RESERVE_ITEM_TITLE, fontSize: 15),
            ),
            FutureBuilder(
                future: _getApplyList(),
                builder: (context, snapShot) {
                  if (snapShot.connectionState == ConnectionState.done &&
                      snapShot.data != null) {
                    List<ApplyData> list = snapShot.data;
                    return Container(
                      margin: const EdgeInsets.only(top: 10.0),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5.0)),
                      child: ListView(
                        shrinkWrap: true,
                        children: list.map((data) {
                          return _item
                              .setAction(data.status, data.title)
                              .itemBuilder;
                        }).toList(),
                      ),
                    );
                  } else {
                    return Container();
                  }
                })
          ],
        ),
      ),
    );
  }

  ///
  /// appbar 去申请
  ///
  List<Widget> _buildBarAction() {
    return [
      GestureDetector(
        onTap: () {
          showModalBottomSheet(
              context: context,
              builder: (cxt) {
                return ApplySheet();
              });
        },
        child: Container(
          margin: const EdgeInsets.only(right: 15.0),
          width: ScreenUtil().setWidth(50),
          height: ScreenUtil().setHeight(20),
          alignment: Alignment.center,
          child: Text(
            apply_now,
            style: TextStyle(color: Colors.white, fontSize: 15.0),
          ),
        ),
      )
    ];
  }

  Future<List<ApplyData>> _getApplyList() async {
    _applyDao ??= ApplyDao(StoreProvider.of<AppState>(context));

    return (await _applyDao.getMyApply())?.data;
  }
}

const _ACTION_TYPE_APPLYING = 1;
const _ACTION_TYPE_PASS = 2;
const _ACTION_TYPE_CANCEL = 3;
const _ACTION_TYPE_COMPLETE = 4;

class _ApplyItem {
  final TextStyle _titleStyle =
      TextStyle(color: ColorRes.GERY_TEXT, fontSize: 15.0);

  String _title;
  String _status;
  Color _statusColor = ColorRes.APPLY_ITEM_STATUS_FINISH;

  Widget get itemBuilder {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15.0),
      height: ScreenUtil().setHeight(46),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            _title ?? '',
            style: _titleStyle,
          ),
          Text(
            _status ?? '',
            style: TextStyle(color: _statusColor, fontSize: 15.0),
          )
        ],
      ),
    );
  }

  _ApplyItem setAction(int action, String title) {
    _title = title;
    switch (action) {
      case _ACTION_TYPE_APPLYING:
        _status = apply_has_applying;
        _statusColor = ColorRes.BLUE_TEXT;
        break;
      case _ACTION_TYPE_PASS:
        _status = apply_has_pass;
        _statusColor = ColorRes.GERY_TEXT;
        break;
      case _ACTION_TYPE_CANCEL:
        _status = apply_has_cancel;
        _statusColor = ColorRes.APPLY_ITEM_STATUS_FINISH;
        break;
      case _ACTION_TYPE_COMPLETE:
        _status = apply_has_complete;
        _statusColor = ColorRes.APPLY_ITEM_STATUS_FINISH;
        break;
    }
    return this;
  }
}
