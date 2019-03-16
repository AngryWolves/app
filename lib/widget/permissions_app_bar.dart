import 'package:common_utils/common_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_park/values/colors.dart';
import 'package:smart_park/values/strings.dart';

class PermissionsAppBar extends StatefulWidget {
  PermissionsAppBar({Key key, this.onBackState, this.onAuditState})
      : super(key: key);
  final Function onBackState;
  final Function onAuditState;

  @override
  State<StatefulWidget> createState() {
    return _PermissionsAppBarState();
  }
}

class _PermissionsAppBarState extends State<PermissionsAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(64),
      color: ColorRes.COLOR_COMMON_APP_BAR_BACKGROUND,
      padding: EdgeInsets.only(top: ScreenUtil().setHeight(16)),
      child: Stack(
        children: <Widget>[
          Center(
            child: Text(
              permissions_title_text,
              style: TextStyle(
                  color: Color.fromRGBO(255, 255, 255, 1),
                  fontSize: ScreenUtil().setSp(18)),
            ),
          ),
          Row(
            children: <Widget>[
              Container(
                width: ScreenUtil().setWidth(50),
                padding: EdgeInsets.only(top: ScreenUtil().setHeight(16)),
                child: GestureDetector(
                  onTap: () {
                    if (widget.onBackState != null) {
                      widget.onBackState();
                    }
                    print("返回按钮点击");
                  },
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: ScreenUtil().setWidth(10),
                        bottom: ScreenUtil().setHeight(15)),
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                      size: 15.0,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                    alignment: Alignment.topRight,
                    child: GestureDetector(
                      onTap: () {
                        if (widget.onAuditState != null) {
                          widget.onAuditState();
                        }
                        print("人员审核按钮点击");
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Container(
                            width: ScreenUtil().setWidth(5),
                            height: ScreenUtil().setWidth(5),
                            margin: EdgeInsets.only(
                                right: ScreenUtil().setWidth(12),
                                top: ScreenUtil().setHeight(11)),
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(255, 21, 0, 1),
                                borderRadius: BorderRadius.circular(2.5)),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                right: ScreenUtil().setWidth(12)),
                            child: Text(
                              '人员审核',
                              style: TextStyle(
                                  color: Color.fromRGBO(255, 255, 255, 1),
                                  fontSize: ScreenUtil().setSp(15)),
                            ),
                          )
                        ],
                      ),
                    )),
                flex: 1,
              )
            ],
          )
        ],
      ),
    );
  }
}
