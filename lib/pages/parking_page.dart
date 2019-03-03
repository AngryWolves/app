import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_park/values/colors.dart';
import 'package:smart_park/values/strings.dart';
import 'package:smart_park/widgets/base/base_state.dart';
import 'package:smart_park/widgets/common_app_bar.dart';
import 'package:smart_park/widgets/common_gradient_button.dart';
import 'package:smart_park/widgets/parking/select_photo_dialog.dart';

class ParkingPage extends StatefulWidget {
  @override
  _ParkingPageState createState() => _ParkingPageState();
}

class _ParkingPageState extends BaseState<ParkingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCommonAppBar(home_action_parking,
          onBack: onBack,
          brightness: Brightness.dark,
          color: ColorRes.BLACK_APP_BAR_BACKGROUND,
          titleColor: Colors.white),
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
