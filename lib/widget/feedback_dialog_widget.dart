import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_park/values/strings.dart';
import 'package:common_utils/common_utils.dart';

//反馈 dialog/
class FeedBackDialog extends StatefulWidget {
  FeedBackDialog(
      {Key key,
      this.title,
      this.subTitle,
      this.sureTitle,
      this.onSureState,
      this.width = 240,
      this.height = 149,
      this.isShowCancel = true})
      : super(key: key);
  final String title;
  final String subTitle;
  final String sureTitle;
  final Function onSureState;
  final int width;
  final int height;
  final bool isShowCancel;

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
              width: ScreenUtil().setWidth(widget.width),
              height: ScreenUtil().setHeight(widget.height),
              child: Container(
                decoration: ShapeDecoration(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)))),
                padding: EdgeInsets.only(top: ScreenUtil().setHeight(20)),
                alignment: Alignment.center,
                child: Column(
                  children: <Widget>[
                    _buildTitleWidget(widget.title),
                    _buildSubTitleWidget(widget.subTitle),
                    Expanded(
                      child: Container(
                        alignment: Alignment.bottomLeft,
                        child: Container(
                            decoration: BoxDecoration(
                                border: Border(
                                    top: Divider.createBorderSide(context,
                                        color:
                                            Color.fromRGBO(240, 240, 240, 1)))),
                            child: _buildBottomWidget()),
                      ),
                      flex: 1,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBottomWidget() {
    return widget.isShowCancel
        ? Row(
            children: <Widget>[
              _buildCancelWidget(widget.onSureState),
              _buildDetermineWidget(widget.onSureState)
            ],
          )
        : GestureDetector(
            onTap: () {
              print("确定按钮点击");
              if (widget.onSureState != null) {}
            },
            child: Container(
              height: ScreenUtil().setHeight(46),
              alignment: Alignment.center,
              child: Text(
                repairs_determine_text,
                style: TextStyle(
                    color: Color.fromRGBO(37, 184, 247, 1),
                    fontSize: ScreenUtil().setSp(15)),
                maxLines: 1,
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
              left: ScreenUtil().setWidth(31),
              right: ScreenUtil().setWidth(31),
            ),
            child: Text(
              subTitle,
              style: TextStyle(
                  color: Color.fromRGBO(46, 49, 56, 1),
                  fontSize: ScreenUtil().setSp(12)),
            ),
          );
  }

  Widget _buildCancelWidget(onSureState) {
    return GestureDetector(
      onTap: () {
        print("取消按钮点击");
        Navigator.pop(context); //关闭对话框
      },
      child: Container(
        width: ScreenUtil().setWidth(120),
        height: ScreenUtil().setHeight(46),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            border: Border(
                right: Divider.createBorderSide(context,
                    color: Color.fromRGBO(240, 240, 240, 1)))),
        child: Text(
          repairs_cancel_text,
          style: TextStyle(
              color: Color.fromRGBO(37, 184, 247, 1),
              fontSize: ScreenUtil().setSp(15)),
          maxLines: 1,
        ),
      ),
    );
  }

  Widget _buildDetermineWidget(onSureState) {
    return GestureDetector(
      onTap: () {
        print("确定按钮点击");
        if (widget.onSureState != null) {}
      },
      child: Container(
        width: ScreenUtil().setWidth(120),
        height: ScreenUtil().setHeight(46),
        color: Colors.transparent,
        alignment: Alignment.center,
        child: Text(
          repairs_determine_text,
          style: TextStyle(
              color: Color.fromRGBO(37, 184, 247, 1),
              fontSize: ScreenUtil().setSp(15)),
          maxLines: 1,
        ),
      ),
    );
  }
}
