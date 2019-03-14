import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
//企业认证Dialog/

class GenderDialog extends StatefulWidget {
  GenderDialog({Key key, this.groupValue = 1, this.onSureState})
      : super(key: key);
  int groupValue;
  final Function onSureState;

  @override
  State<StatefulWidget> createState() {
    return _GenderDialogState();
  }
}

class _GenderDialogState extends State<GenderDialog> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: () {
        Navigator.pop(context); //关闭对话框
      },
      child: Material(
          ////创建透明层
          type: MaterialType.transparency, //透明类型
          child: GestureDetector(
            onTap: () {},
            child: Center(
              //保证控件居中效果
              child: SizedBox(
                width: ScreenUtil().setWidth(240),
                height: ScreenUtil().setHeight(192),
                child: Container(
                  padding: EdgeInsets.only(
                      left: ScreenUtil().setWidth(15),
                      right: ScreenUtil().setWidth(16),
                      top: ScreenUtil().setHeight(20)),
                  decoration: ShapeDecoration(
                      color: Color.fromRGBO(255, 255, 255, 1),
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(5.0)))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "性别选择",
                        style: TextStyle(
                            color: Color.fromRGBO(46, 49, 56, 1),
                            fontSize: ScreenUtil().setSp(15)),
                      ),
                      Container(
                        height: ScreenUtil().setHeight(104),
                        child: Column(
                          children: <Widget>[
                            Container(
                              height: ScreenUtil().setHeight(26),
                              alignment: Alignment.topLeft,
                              child: Row(
                                children: <Widget>[
                                  Radio(
                                      value: 1,
                                      groupValue: widget.groupValue,
                                      activeColor:
                                          Color.fromRGBO(37, 184, 247, 1),
                                      onChanged: (int val) {
                                        updateGroupValue(1);
                                      }),
                                  Text(
                                    "男",
                                    style: TextStyle(
                                        color: Color.fromRGBO(46, 49, 56, 1),
                                        fontSize: ScreenUtil().setSp(13)),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: ScreenUtil().setHeight(26),
                              alignment: Alignment.topLeft,
                              child: Row(
                                children: <Widget>[
                                  Radio(
                                      value: 2,
                                      groupValue: widget.groupValue,
                                      activeColor:
                                          Color.fromRGBO(37, 184, 247, 1),
                                      onChanged: (int val) {
                                        updateGroupValue(2);
                                      }),
                                  Text(
                                    "女",
                                    style: TextStyle(
                                        color: Color.fromRGBO(46, 49, 56, 1),
                                        fontSize: ScreenUtil().setSp(13)),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                          child: Container(
                            alignment: Alignment.centerRight,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pop(context); //关闭对话框
                                  },
                                  child: Text(
                                    " 取消 ",
                                    style: TextStyle(
                                        color: Color.fromRGBO(37, 184, 247, 1),
                                        fontSize: ScreenUtil().setSp(13)),
                                  ),
                                ),
                                Padding(
                                    padding: EdgeInsets.only(
                                        right: ScreenUtil().setWidth(30))),
                                GestureDetector(
                                  onTap: () {
                                    if (widget.onSureState != null) {
                                      switch (widget.groupValue) {
                                        case 1:
                                          widget.onSureState("认证企业");
                                          break;
                                        case 2:
                                          widget.onSureState("园区十佳优秀企业");
                                          break;
                                        case 3:
                                          widget.onSureState("优秀企业");
                                          break;
                                        case 4:
                                          widget.onSureState("高效企业");
                                          break;
                                      }
                                    }
                                    Navigator.pop(context); //关闭对话框
                                  },
                                  child: Text(
                                    " 确定 ",
                                    style: TextStyle(
                                        color: Color.fromRGBO(37, 184, 247, 1),
                                        fontSize: ScreenUtil().setSp(13)),
                                  ),
                                )
                              ],
                            ),
                          ),
                          flex: 1)
                    ],
                  ),
                ),
              ),
            ),
          )),
    );
  }

  void updateGroupValue(int v) {
    this.setState(() {
      widget.groupValue = v;
    });
  }
}
