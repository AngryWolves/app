import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_park/utils/input_manage_util.dart';
import 'package:smart_park/values/strings.dart';
import 'package:smart_park/widget/base/base_state.dart';
import 'package:smart_park/widget/common_app_bar.dart';
import 'package:smart_park/dio/service_man_dao.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:smart_park/dio/user_dao.dart';
import 'package:smart_park/redux/app_state.dart';
import 'package:smart_park/components/personal/service/data/master_data.dart';
import 'package:smart_park/values/json_strings.dart';
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
  ServiceManDao _dao;
  List<MasterData> _listOfMaster;
  @override
  void initState() {
    super.initState();
  }
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _getMasterDataList();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(236, 236, 236, 1),
      appBar: buildCommonAppbar(service_title_text, onLeadTop: () {
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
        child: Column(
          children: <Widget>[_buildListTitle(), _buildListWidget(null)],
        ),
      ),
    );
  }

  Widget _buildListTitle() {
    return Container(
      alignment: Alignment.centerLeft,
      height: ScreenUtil().setHeight(35),
      padding: EdgeInsets.only(left: ScreenUtil().setWidth(14)),
      child: Row(
        children: <Widget>[
          Text(
            service_floor_text,
            style: TextStyle(
                color: Color.fromRGBO(143, 143, 143, 1),
                fontSize: ScreenUtil().setSp(12)),
          ),
          Padding(
              padding: EdgeInsets.only(left: ScreenUtil().setWidth(50)),
              child: Text(
                service_name_text,
                style: TextStyle(
                    color: Color.fromRGBO(143, 143, 143, 1),
                    fontSize: ScreenUtil().setSp(12)),
              )),
          Padding(
              padding: EdgeInsets.only(left: ScreenUtil().setWidth(70)),
              child: Text(
                service_phone_text,
                style: TextStyle(
                    color: Color.fromRGBO(143, 143, 143, 1),
                    fontSize: ScreenUtil().setSp(12)),
              ))
        ],
      ),
    );
  }

  Widget _buildListWidget(List<dynamic> objects) {
    return Expanded(
        child: ListView.builder(
            itemCount: _listOfMaster!=null?_listOfMaster.length:0,
            itemBuilder: (context, index) {
              return _buildItemWidget(_listOfMaster!=null?_listOfMaster[index]:null, index);
            }),
        flex: 1);
  }

  Widget _buildItemWidget(object, index) {
    return GestureDetector(
      onTap: () {
        print("item点击");
      },
      child: Container(
        height: ScreenUtil().setHeight(30),
        margin: EdgeInsets.only(
            left: ScreenUtil().setWidth(8), right: ScreenUtil().setWidth(8)),
        color: index % 2 == 0
            ? Color.fromRGBO(245, 245, 245, 1)
            : Color.fromRGBO(255, 255, 255, 1),
        alignment: Alignment.centerLeft,
        child: Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: ScreenUtil().setWidth(17)),
              child: Text(
                (index + 1).toString(),
                style: TextStyle(
                    color: Color.fromRGBO(46, 49, 56, 1),
                    fontSize: ScreenUtil().setSp(12)),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: ScreenUtil().setWidth(58)),
              child: Text(
                object?.buildMasterName.toString(),
                style: TextStyle(
                    color: Color.fromRGBO(46, 49, 56, 1),
                    fontSize: ScreenUtil().setSp(12)),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: ScreenUtil().setWidth(83)),
              child: Text(
                object?.tel.toString(),
                style: TextStyle(
                    color: Color.fromRGBO(46, 49, 56, 1),
                    fontSize: ScreenUtil().setSp(12)),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _getMasterDataList() async {
    _dao ??= ServiceManDao(StoreProvider.of<AppState>(context));
    MasterDataBean model = await _dao.getMasterDataList();
    if(model!=null){
      setState(() {
        _listOfMaster=model.data;
      });
    }
  }
}
