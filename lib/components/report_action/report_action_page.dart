import 'package:flutter/material.dart';
import 'package:smart_park/components/report_action/report_action_item.dart';
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
    extends RefreshListView<_ReportActionList, String> {

  @override
  Widget buildItem(String data) {
    return ReportActionItem(image: data,);
  }

  @override
  Future<List<String>> requestData(int page) async {
    return ['', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1553007367640&di=87b11358c155cd1c9ec6f8bc3a06036b&imgtype=0&src=http%3A%2F%2Fs14.sinaimg.cn%2Fmw690%2F0076ogogzy7oTQE7eCp0d%26690'];
  }
}
