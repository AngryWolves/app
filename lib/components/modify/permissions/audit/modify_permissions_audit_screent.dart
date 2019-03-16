import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:smart_park/values/colors.dart';
import 'package:smart_park/values/strings.dart';
import 'package:smart_park/widget/text_field_widget.dart';
import 'package:smart_park/utils/input_manage_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:configurable_expansion_tile/configurable_expansion_tile.dart';
import 'package:common_utils/common_utils.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:smart_park/widget/common_app_bar.dart';
import 'package:smart_park/components/personal/data/local_personal_data.dart';
import 'package:smart_park/values/json_strings.dart';
import 'package:flutter/material.dart';
import 'package:smart_park/values/colors.dart';
import 'package:smart_park/values/strings.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smart_park/router/navigator_util.dart';
import 'package:smart_park/widget/common_app_bar.dart';
import 'package:smart_park/utils/input_manage_util.dart';
import 'package:smart_park/widget/personal_dialog.dart';
import 'package:smart_park/widget/permissions_app_bar.dart';

class ModifyPermissionsAuditScreen extends StatefulWidget {
  ModifyPermissionsAuditScreen({@required this.userId});

  final String userId;

  @override
  State<StatefulWidget> createState() {
    return _ModifyPermissionsAuditScreen();
  }
}

class _ModifyPermissionsAuditScreen
    extends State<ModifyPermissionsAuditScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildCommonAppbar(audit_title_text, onLeadTop: () {
        InputManageUtil.shutdownInputKeyboard();
        Navigator.pop(context);
      }),
      body: Container(),
    );
  }
}
