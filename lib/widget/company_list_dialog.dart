import 'package:flutter/material.dart';
import 'package:smart_park/values/colors.dart';
import 'package:smart_park/values/strings.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:common_utils/common_utils.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:azlistview/azlistview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smart_park/widget/contact_model.dart';
import 'package:smart_park/values/json_strings.dart';
import 'package:lpinyin/lpinyin.dart';
//公司列表Dialog/

class CompanyListDialog extends StatefulWidget {
  CompanyListDialog({Key key, this.groupValue = 1, this.onSureState})
      : super(key: key);
  final int groupValue;
  final Function onSureState;

  @override
  State<StatefulWidget> createState() {
    return _CompanyListDialogState();
  }
}

class _CompanyListDialogState extends State<CompanyListDialog> {
  List<ContactInfo> _contacts = List();
  int _suspensionHeight = 40;
  int _itemHeight = 60;
  String _hitTag = "";

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    //加载联系人列表
    List list = json.decode(JsonStrings.localPhone);
    list.forEach((value) {
      _contacts.add(ContactInfo(name: value['name']));
    });
    _handleList(_contacts);
    setState(() {});
  }

  void _handleList(List<ContactInfo> list) {
    if (list == null || list.isEmpty) return;
    for (int i = 0, length = list.length; i < length; i++) {
      String pinyin = PinyinHelper.getPinyinE(list[i].name);
      String tag = pinyin.substring(0, 1).toUpperCase();
      list[i].namePinyin = pinyin;
      if (RegExp("[A-Z]").hasMatch(tag)) {
        list[i].tagIndex = tag;
      } else {
        list[i].tagIndex = "#";
      }
    }
    //根据A-Z排序
    SuspensionUtil.sortListBySuspensionTag(_contacts);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context); //关闭对话框
      },
      child: Material(
        ////创建透明层
        type: MaterialType.transparency, //透明类型
        child: GestureDetector(
          onTap: () {},
          child: Container(
            margin: EdgeInsets.only(top: ScreenUtil().setHeight(70)),
            height: ScreenUtil().setHeight(597),
            color: Color.fromRGBO(245, 245, 245, 1),
            child: Column(
              children: <Widget>[_buildTopWidget(), _buildListWidget()],
            ),
            //
          ),
        ),
      ),
    );
  }

  Widget _buildTopWidget() {
    return Container(
      height: ScreenUtil().setHeight(52),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
                left: ScreenUtil().setWidth(16),
                top: ScreenUtil().setHeight(16)),
            child: Text(
              '选择所属公司',
              style: TextStyle(
                  color: Color.fromRGBO(50, 50, 50, 1),
                  fontSize: ScreenUtil().setSp(18)),
            ),
          ),
          Expanded(
            child: Container(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: EdgeInsets.only(
                      right: ScreenUtil().setWidth(16),
                      top: ScreenUtil().setHeight(19)),
                  child: Text(
                    '没有公司？新建一个',
                    style: TextStyle(
                        color: Color.fromRGBO(37, 184, 247, 1),
                        fontSize: ScreenUtil().setSp(12)),
                  ),
                )),
            flex: 1,
          )
        ],
      ),
    );
  }

  Widget _buildListWidget() {
    return Expanded(
      child: Stack(
        alignment: AlignmentDirectional.centerEnd,
        children: <Widget>[
          AzListView(
            data: _contacts,
            itemBuilder: (context, model) => _buildListItem(model),
            isUseRealIndex: true,
            itemHeight: _itemHeight,
            suspensionHeight: _suspensionHeight,
            indexBarBuilder: (BuildContext context, List<String> tags,
                IndexBarTouchCallback onTouch) {
              return Container(
//                margin: EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
//                decoration: BoxDecoration(
//                    color: Colors.grey[50],
//                    borderRadius: BorderRadius.circular(20.0),
//                    border: Border.all(color: Colors.grey[300], width: .5)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: IndexBar(
                    data: tags,
                    textStyle: TextStyle(
                        color: Color.fromRGBO(153, 153, 153, 1),
                        fontSize: ScreenUtil().setSp(10)),
                    itemHeight: 20,
                    onTouch: (details) {
                      onTouch(details);
                    },
                  ),
                ),
              );
            },
            indexHintBuilder: (context, hint) {
              return Container(
                alignment: Alignment.center,
                width: 60.0,
                height: 60.0,
                decoration: BoxDecoration(
                  color: Colors.blue[700].withAlpha(200),
                  shape: BoxShape.circle,
                ),
                child: Text(hint,
                    style: TextStyle(color: Colors.white, fontSize: 30.0)),
              );
            },
          )
        ],
      ),
      flex: 1,
    );
  }

  Widget _buildListItem(ContactInfo model) {
    String susTag = model.getSuspensionTag();
    return Column(
      children: <Widget>[
        Offstage(
          offstage: model.isShowSuspension != true,
          child: _buildSusWidget(susTag),
        ),
        GestureDetector(
          onTap: () {
            print("OnItemClick: $model");
            Navigator.pop(context, model);
          },
          child: Container(
            height: ScreenUtil().setHeight(45),
            margin: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(25)),
            decoration: BoxDecoration(
                border: Border(
                    bottom: Divider.createBorderSide(context,
                        color: Color.fromRGBO(230, 230, 230, 1)))),
            alignment: Alignment.centerLeft,
            child: Text(
              model.name,
              style: TextStyle(
                  color: Color.fromRGBO(50, 50, 50, 1),
                  fontSize: ScreenUtil().setSp(15)),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildSusWidget(String susTag) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(15)),
      height: ScreenUtil().setHeight(21),
      color: const Color(0xFFE8E8E8),
      alignment: Alignment.centerLeft,
      child: Text(
        '$susTag',
        style: TextStyle(
            color: Color.fromRGBO(153, 153, 153, 1),
            fontSize: ScreenUtil().setSp(12)),
      ),
    );
  }
}
