import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_park/components/parking/data/car_info.dart';
import 'package:smart_park/router/navigator_util.dart';
import 'package:smart_park/values/colors.dart';
import 'package:smart_park/values/strings.dart';

///
/// 我的车辆
///
class MyCar extends StatelessWidget {
  MyCar({this.carInfoData});

  final CarInfoData carInfoData;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5.0),
                    topRight: Radius.circular(5.0))),
            height: ScreenUtil().setHeight(52),
            child: ListTile(
              leading: Image.asset(
                'images/ic_my_car.png',
                width: ScreenUtil().setWidth(41),
                height: ScreenUtil().setHeight(41),
              ),
              title: Text(
                carInfoData?.carNo ?? '',
                style: TextStyle(
                    color: ColorRes.GERY_TEXT,
                    fontSize: ScreenUtil().setSp(16),
                    fontWeight: FontWeight.w600),
              ),
              trailing: Text(
                parking_my_car,
                style: TextStyle(
                    color: ColorRes.GERY_TEXT_HINT,
                    fontSize: ScreenUtil().setSp(13)),
              ),
            ),
          ),
          _buildParkingStatus(context)
        ],
      ),
    );
  }

  ///
  /// 停车状态
  ///
  Widget _buildParkingStatus(BuildContext context) {
    var status = 0;
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(5.0),
              bottomRight: Radius.circular(5.0))),
      padding: const EdgeInsets.only(
          left: 22.0, top: 13.0, bottom: 13.0, right: 10.0),
      margin: const EdgeInsets.only(top: 1.0),
      height:
          status == 0 ? ScreenUtil().setHeight(75) : ScreenUtil().setHeight(52),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: _buildStatusAndFee(status),
          ),
          _buildStopParkingBtn(status, context)
        ],
      ),
    );
  }

  ///
  /// 停车状态和费用
  ///
  List<Widget> _buildStatusAndFee(int status) {
    List<Widget> widgets = [
      Text(
        parking_status + parking_status_paring,
        style: TextStyle(
            color: ColorRes.GERY_TEXT, fontSize: ScreenUtil().setSp(14)),
      )
    ];

    if (status == 0) {
      widgets.add(Text.rich(
        TextSpan(text: parking_fee, children: [
          TextSpan(
              text: '15',
              style: TextStyle(
                  color: Colors.orange, fontSize: ScreenUtil().setSp(14))),
          TextSpan(text: parking_unit_yuan)
        ]),
        style: TextStyle(
            color: ColorRes.GERY_TEXT, fontSize: ScreenUtil().setSp(14)),
      ));
    }
    return widgets;
  }

  ///
  /// 结束停车按钮
  ///
  Widget _buildStopParkingBtn(int status, BuildContext context) {
    if (status == 0) {
      return GestureDetector(
        onTap: () {
          NavigatorUtil.goParkingEnd(context);
        },
        child: Container(
          alignment: Alignment.center,
          height: ScreenUtil().setHeight(30),
          width: ScreenUtil().setWidth(65),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3.0),
              border: Border.all(color: ColorRes.BLUE_TEXT)),
          child: Text(
            parking_stop,
            style: TextStyle(
                color: ColorRes.BLUE_TEXT, fontSize: ScreenUtil().setSp(12)),
          ),
        ),
      );
    } else {
      return Container();
    }
  }
}
