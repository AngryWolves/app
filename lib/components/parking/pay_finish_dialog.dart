import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_park/values/colors.dart';
import 'package:smart_park/values/strings.dart';

class PayFinishDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Center(
          child: GestureDetector(
            onTap: () {},
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: Colors.white),
              height: ScreenUtil().setHeight(129),
              margin:
                  EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(68)),
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text(
                            parking_pay_finish_title,
                            style: TextStyle(
                                color: ColorRes.GERY_TEXT,
                                fontSize: 18.0,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            parking_pay_finish_desc,
                            style: TextStyle(
                              color: ColorRes.GERY_TEXT,
                              fontSize: 12.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: ScreenUtil().setHeight(45),
                      decoration: BoxDecoration(
                          border: Border(
                              top: BorderSide(color: ColorRes.DIALOG_DIVIDER))),
                      child: Text(
                        parking_pay_finish_know,
                        style: TextStyle(
                            color: ColorRes.BLUE_TEXT, fontSize: 15.0),
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
