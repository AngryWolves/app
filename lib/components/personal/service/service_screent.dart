import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_park/utils/input_manage_util.dart';
import 'package:smart_park/values/strings.dart';
import 'package:smart_park/widget/base/base_state.dart';
import 'package:smart_park/widget/common_app_bar.dart';

//联系客服/
class PersonalServiceScreen extends StatefulWidget {
  PersonalServiceScreen({@required this.userId});

  final String userId;

  @override
  State<StatefulWidget> createState() {
    return _PersonalServiceScreenState();
  }
}

class _PersonalServiceScreenState extends BaseState<PersonalServiceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(236, 236, 236, 1),
      appBar: buildCommonAppbar(report_title_text, onLeadTop: () {
        InputManageUtil.shutdownInputKeyboard();
        Navigator.pop(context);
      }),
      body: Container(
        margin: EdgeInsets.only(
            left: ScreenUtil().setWidth(15),
            right: ScreenUtil().setWidth(15),
            top: ScreenUtil().setHeight(10)),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(2.5), topRight: Radius.circular(2.5))),
      ),
    );
  }
}
