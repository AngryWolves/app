import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_park/components/parking/select_photo_dialog.dart';
import 'package:smart_park/values/colors.dart';
import 'package:smart_park/values/strings.dart';
import 'package:smart_park/widget/base/base_state.dart';
import 'package:smart_park/widget/common_app_bar.dart';
import 'package:smart_park/widget/common_gradient_button.dart';

class UploadLicensePage extends StatefulWidget {
  @override
  _UploadLicensePageState createState() => _UploadLicensePageState();
}

class _UploadLicensePageState extends BaseState<UploadLicensePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCommonAppbar(home_action_parking, onLeadTop: onBack),
      body: Container(
        padding: const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 40.0),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: Image.asset(
                      'images/ic_unbind_license_tip.png',
                      width: ScreenUtil().setWidth(100),
                      height: ScreenUtil().setWidth(100),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                  ),
                  Text(
                    parking_bind_tip_title,
                    style: TextStyle(
                        color: ColorRes.GERY_TEXT,
                        fontSize: ScreenUtil().setSp(17)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                  ),
                  Text(
                    parking_bind_tip_detail,
                    style: TextStyle(
                        height: 1.2,
                        fontSize: ScreenUtil().setSp(12),
                        color: ColorRes.GERY_TEXT_HINT),
                  )
                ],
              ),
            ),
            GradientButton(parking_upload_license, _showSelectPhotoDialog)
          ],
        ),
      ),
    );
  }

  void _showSelectPhotoDialog() {
    showDialog(context: context, builder: (_) => SelectPhotoDialog());
  }
}
