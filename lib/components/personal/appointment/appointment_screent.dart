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
import 'package:cached_network_image/cached_network_image.dart';

//我的预约/
class PersonalAppointmentScreen extends StatefulWidget {
  PersonalAppointmentScreen({@required this.userId});

  final String userId;

  @override
  State<StatefulWidget> createState() {
    return _PersonalAppointmentScreenState();
  }
}

class _PersonalAppointmentScreenState extends State<PersonalAppointmentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(236, 236, 236, 1),
      appBar: buildCommonAppbar(appointment_title_text, onLeadTop: () {
        InputManageUtil.shutdownInputKeyboard();
        Navigator.pop(context);
      }),
      body: Center(
        child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {},
                child: _buildItemWidget(),
              );
            }),
      ),
    );
  }

  Widget _buildItemWidget() {
    return Container(
      margin: EdgeInsets.only(
          left: ScreenUtil().setWidth(15),
          right: ScreenUtil().setWidth(15),
          top: ScreenUtil().setHeight(10)),
      width: ScreenUtil().setWidth(345),
      height: ScreenUtil().setHeight(126),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(5.0))),
      child: Padding(
        padding: EdgeInsets.only(
            left: ScreenUtil().setWidth(10),
            top: ScreenUtil().setWidth(10),
            right: ScreenUtil().setWidth(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: ScreenUtil().setHeight(70),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CachedNetworkImage(
                    imageUrl: "http://via.placeholder.com/350x200",
                    placeholder: (context, url) =>
                        new CircularProgressIndicator(),
                    errorWidget: (context, url, error) => new Icon(Icons.error),
                    width: ScreenUtil().setWidth(104),
                    height: ScreenUtil().setHeight(60),
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: ScreenUtil().setWidth(15),
                        right: ScreenUtil().setWidth(15)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'xxxx会议室',
                          style: TextStyle(
                              color: Color.fromRGBO(46, 49, 56, 1),
                              fontSize: ScreenUtil().setSp(15)),
                          maxLines: 1,
                        ),
                        Padding(
                            padding: EdgeInsets.only(
                                top: ScreenUtil().setHeight(8))),
                        Text(
                          '所处位置：xxxxxxxxxxxxxxxxxxxxx',
                          style: TextStyle(
                              color: Color.fromRGBO(143, 143, 143, 1),
                              fontSize: ScreenUtil().setSp(11)),
                          maxLines: 1,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: ScreenUtil().setHeight(1),
              color: Color.fromRGBO(240, 240, 240, 1),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.access_time,
                    color: Color.fromRGBO(37, 184, 247, 1),
                    size: 16.0,
                  ),
                  Padding(
                      padding: EdgeInsets.only(left: ScreenUtil().setWidth(8))),
                  Text(
                    '1月23日 13:00-16:00',
                    style: TextStyle(
                        color: Color.fromRGBO(37, 184, 247, 1),
                        fontSize: ScreenUtil().setSp(12)),
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.centerRight,
                      child: Text(
                        '已结束',
                        style: TextStyle(
                            color: Color.fromRGBO(194, 194, 194, 1),
                            fontSize: ScreenUtil().setSp(12)),
                      ),
                    ),
                    flex: 1,
                  )
                ],
              ),
              flex: 1,
            )
          ],
        ),
      ),
    );
  }
}
