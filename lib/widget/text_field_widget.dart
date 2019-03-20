import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smart_park/values/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFieldWidget extends StatefulWidget {
  TextFieldWidget(this.hint, this.textController,
      {this.isMobile = false,
      this.maxLength = 11,
      this.lineColor = ColorRes.COLOR_LOGIN_BORDER_SIDE,
      this.onChanged,this.obscureText=false});

  final hint;
  final isMobile;
  final maxLength;
  final TextEditingController textController;
  final Color lineColor;
  final Function onChanged;
  final bool obscureText;
  @override
  State<StatefulWidget> createState() {
    return _TextFieldState();
  }
}

class _TextFieldState extends State<TextFieldWidget> {
  @override
  void dispose() {
    super.dispose();
    widget.textController.dispose();
  }

  @override
  void initState() {
    super.initState();
//    widget.textController.addListener((){
//      print('==onTop='+widget.textController.text);
//    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomLeft,
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(bottom: ScreenUtil().setHeight(16)),
          child: TextField(
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding:
                    EdgeInsets.only(top: ScreenUtil().setHeight(22)),
                hintText: widget.hint,
                hintStyle: TextStyle(
                    color: ColorRes.COLOR_LOGIN_HINT,
                    fontSize: ScreenUtil().setSp(15))),
            onChanged: (text) {
              widget.textController.text = text;
              if (widget.onChanged != null) {
                widget.onChanged(text);
              }
              //内容改变的回调
//                    print('change');
            },
            onSubmitted: (text) {
              //内容提交(按回车)的回调
//                    print('submit');
            },
            controller: TextEditingController.fromValue(TextEditingValue(
                text: widget.textController.text,
                selection: TextSelection.fromPosition(TextPosition(
                    affinity: TextAffinity.downstream,
                    offset: widget.textController.text.length)))),
            keyboardType: widget.isMobile
                ? TextInputType.phone
                : TextInputType.emailAddress,
            //显示的文字内容为 下一步
            style: TextStyle(
                color: Color.fromRGBO(46, 49, 56, 1),
                fontSize: ScreenUtil().setSp(15)),
//          maxLength: 11,
            //最大长度，设置此项会让TextField右下角有一个输入数量的统计字符串
            //这种情况一般是不符合我们设计的要求的，但是有需要限制其输入的位数
            inputFormatters: [
              LengthLimitingTextInputFormatter(widget.maxLength)
            ],
            maxLines: 1,

            //最大行数
            autocorrect: false,
            //是否自动更正
            autofocus: false,
            //是否自动对焦
            obscureText: widget.obscureText,
            //是否是密码
            textAlign: TextAlign.left,
          ),
        ),
        Container(
//          margin: EdgeInsets.only(
//            left: ScreenUtil().setWidth(15),
//            right: ScreenUtil().setWidth(15),
//          ),
//          width: ScreenUtil().setWidth(375),
          height: ScreenUtil().setHeight(1),
          color: widget.lineColor,
        ),
      ],
    );
  }
}
