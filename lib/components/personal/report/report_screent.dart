import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:smart_park/values/colors.dart';
import 'package:smart_park/values/strings.dart';
import 'package:smart_park/widget/text_field_widget.dart';
import 'package:smart_park/utils/input_manage_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_park/widget/common_app_bar.dart';
import 'package:smart_park/router/navigator_util.dart';
import 'package:smart_park/components/personal/data/local_personal_data.dart';
import 'package:smart_park/values/json_strings.dart';
import 'package:smart_park/widgets/base/base_state.dart';

//数据报表/
class PersonalReportScreen extends StatefulWidget {
  PersonalReportScreen({@required this.userId});

  final String userId;

  @override
  State<StatefulWidget> createState() {
    return _PersonalReportScreenState();
  }
}

class _PersonalReportScreenState extends BaseState<PersonalReportScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(236, 236, 236, 1),
      appBar: buildCommonAppbar(report_title_text, onLeadTop: () {
        InputManageUtil.shutdownInputKeyboard();
        Navigator.pop(context);
      }),
    );
  }
}
