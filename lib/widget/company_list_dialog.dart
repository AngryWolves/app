import 'package:flutter/material.dart';
import 'package:smart_park/values/colors.dart';
import 'package:smart_park/values/strings.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:common_utils/common_utils.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/services.dart';

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
//            color: Color.fromRGBO(245, 245, 245, 1),
            color: Colors.blue,
            child: Column(
              children: <Widget>[_buildTopWidget()],
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
}
