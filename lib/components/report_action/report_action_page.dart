import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:smart_park/components/report_action/data/declare_response.dart';
import 'package:smart_park/components/report_action/report_action_item.dart';
import 'package:smart_park/dio/delcare_dao.dart';
import 'package:smart_park/redux/app_state.dart';
import 'package:smart_park/values/strings.dart';
import 'package:smart_park/widget/base/base_state.dart';
import 'package:smart_park/widget/base/refresh_list_view.dart';
import 'package:smart_park/widget/common_app_bar.dart';

class ReportActionPage extends StatefulWidget {
  @override
  _ReportActionPageState createState() => _ReportActionPageState();
}

class _ReportActionPageState extends BaseState<ReportActionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCommonAppbar(home_action_report_active, onLeadTop: onBack),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15.0),
        child: _ReportActionList(),
      ),
    );
  }
}

class _ReportActionList extends StatefulWidget {
  @override
  _ReportActionListState createState() => _ReportActionListState();
}

class _ReportActionListState
    extends RefreshListView<_ReportActionList, DeclareData> {

  DeclareDao _declareDao;

  @override
  Widget buildItem(DeclareData data) {
    return ReportActionItem(data: data,);
  }

  @override
  Future<List<DeclareData>> requestData(int page) async {
    _declareDao ??= DeclareDao(StoreProvider.of<AppState>(context));

    return (await _declareDao.getDeclareResponse(page: page))?.data;
  }
}
