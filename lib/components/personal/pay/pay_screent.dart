import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_park/utils/input_manage_util.dart';
import 'package:smart_park/values/strings.dart';
import 'package:smart_park/widget/base/base_state.dart';
import 'package:smart_park/widget/common_app_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';

//缴纳费用/
class PersonalPayScreen extends StatefulWidget {
  PersonalPayScreen({@required this.userId});

  final String userId;

  @override
  State<StatefulWidget> createState() {
    return _PersonalPayScreenState();
  }
}

class _PersonalPayScreenState extends State<PersonalPayScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return null;
  }
}
