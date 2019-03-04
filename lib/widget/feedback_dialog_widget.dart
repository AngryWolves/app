import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:common_utils/common_utils.dart';

//反馈 dialog/
class FeedBackDialog extends StatefulWidget {
  FeedBackDialog(
      {Key key, this.title, this.subTitle, this.sureTitle, this.onSureState})
      : super(key: key);
  final String title;
  final String subTitle;
  final String sureTitle;
  final Function onSureState;

  @override
  State<StatefulWidget> createState() {
    return _FeedBackDialogState();
  }
}

class _FeedBackDialogState extends State<FeedBackDialog> {
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
                padding: EdgeInsets.only(top: ScreenUtil().setHeight(20)),
                alignment: Alignment.center,
                child: Column(
                  children: <Widget>[
                    _buildTitleWidget(widget.title),
                    _buildSubTitleWidget(widget.subTitle),
                    _buildLineWidget(),
                    _buildSureTitleWidget(widget.sureTitle, widget.onSureState)
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTitleWidget(title) {
    return ObjectUtil.isEmptyString(title)
        ? null
        : Text(
            title,
            style: TextStyle(
                color: Color.fromRGBO(46, 49, 56, 1),
                fontSize: ScreenUtil().setSp(18)),
            maxLines: 1,
          );
  }

  Widget _buildSubTitleWidget(subTitle) {
    return ObjectUtil.isEmptyString(subTitle)
        ? null
        : Padding(
            padding: EdgeInsets.only(
              top: ScreenUtil().setHeight(14),
              left: ScreenUtil().setWidth(15),
              right: ScreenUtil().setWidth(16),
            ),
            child: Padding(
              padding: EdgeInsets.only(
                  left: ScreenUtil().setWidth(15),
                  right: ScreenUtil().setWidth(16)),
              child: Text(
                subTitle,
                style: TextStyle(
                    color: Color.fromRGBO(46, 49, 56, 1),
                    fontSize: ScreenUtil().setSp(12)),
                maxLines: 2,
              ),
            ));
  }

  Widget _buildLineWidget() {
    return Container(
      height: ScreenUtil().setHeight(1),
      margin: EdgeInsets.only(top: ScreenUtil().setHeight(21)),
    );
  }

  Widget _buildSureTitleWidget(sureTitle, onSureState) {
    return ObjectUtil.isEmptyString(sureTitle)
        ? null
        : GestureDetector(
            onTap: () {
              if (onSureState != null) {
                onSureState();
              }
            },
            child: Expanded(
              child: Padding(
                padding: EdgeInsets.only(
                    left: ScreenUtil().setWidth(15),
                    right: ScreenUtil().setWidth(16)),
                child: Text(
                  sureTitle,
                  style: TextStyle(
                      color: Color.fromRGBO(37, 184, 247, 1),
                      fontSize: ScreenUtil().setSp(15)),
                  maxLines: 1,
                ),
              ),
              flex: 1,
            ),
          );
  }
}
