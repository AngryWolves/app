import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_park/values/colors.dart';
import 'package:smart_park/values/strings.dart';

class ReserveSucceedDialog extends StatelessWidget {
  ReserveSucceedDialog({this.goToMyRepair});

  final goToMyRepair;

  final TextStyle _style1 =
      TextStyle(color: ColorRes.BLUE_TEXT, fontSize: ScreenUtil().setSp(12));

  final TextStyle _style2 =
      TextStyle(color: ColorRes.GERY_TEXT, fontSize: ScreenUtil().setSp(12));

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: GestureDetector(
            onTap: () {},
            child: Container(
              height: ScreenUtil().setHeight(149),
              width: ScreenUtil().setWidth(240),
              margin: EdgeInsets.symmetric(vertical: ScreenUtil().setWidth(68)),
              decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0), color: Colors.white),
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                              vertical: 26.0, horizontal: 26.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(repair_action_reserve_succeed_title,
                                  style: TextStyle(
                                          color: ColorRes.GERY_TEXT,
                                          fontSize: ScreenUtil().setSp(18))),
                          Expanded(
                            child: RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                      text: repair_action_reserve_succeed_1,
                                      style: _style2,
                                      children: [
                                        TextSpan(
                                                text: ' $repair_action_reserve_succeed_2',
                                                style: _style1),
                                        TextSpan(text: ' - ', style: _style2),
                                        TextSpan(
                                                text: '$repair_action_reserve_succeed_3',
                                                style: _style1),
                                        TextSpan(
                                                text: ' $repair_action_reserve_succeed_4',
                                                style: _style2),
                                      ]),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                      goToMyRepair();
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: ScreenUtil().setHeight(45),
                      decoration: BoxDecoration(
                              border: Border(
                                      top: BorderSide(color: ColorRes.DIALOG_DIVIDER))),
                      child: Text(
                        repair_action_reserve_succeed_check,
                        style: TextStyle(
                                fontSize: ScreenUtil().setSp(15),
                                color: ColorRes.BLUE_TEXT),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
