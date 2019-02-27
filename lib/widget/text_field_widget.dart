import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smart_park/values/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFieldWidget extends StatefulWidget {
  TextFieldWidget(this.hint, this.textController, {this.isMobile = false});

  final hint;
  final isMobile;
  final TextEditingController textController;

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
        TextField(
          decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: ScreenUtil().setHeight(22)),
              hintText: widget.hint,
              hintStyle: TextStyle(
                  color: ColorRes.COLOR_LOGIN_HINT,
                  fontSize: ScreenUtil().setSp(15))),
          onChanged: (text) {
            widget.textController.text=text;
            //内容改变的回调
//                    print('change');
          },
          onSubmitted: (text) {
            //内容提交(按回车)的回调
//                    print('submit');
          },
          controller: TextEditingController(text: widget.textController.text),
          keyboardType: widget.isMobile
              ? TextInputType.phone
              : TextInputType.emailAddress,
          //键盘类型
          textInputAction: TextInputAction.none,
          //显示的文字内容为 下一步
          style: TextStyle(
              color: Color.fromRGBO(46, 49, 56, 1),
              fontSize: ScreenUtil().setSp(15)),
          maxLength: 11,
          //最大长度
          maxLines: 1,
          //最大行数
          autocorrect: false,
          //是否自动更正
          autofocus: false,
          //是否自动对焦
          obscureText: !widget.isMobile,
          //是否是密码
          textAlign: TextAlign.left,
        ),
        Container(
//          margin: EdgeInsets.only(
//            left: ScreenUtil().setWidth(15),
//            right: ScreenUtil().setWidth(15),
//          ),
//          width: ScreenUtil().setWidth(375),
          height: ScreenUtil().setHeight(1),
          color: ColorRes.COLOR_LOGIN_BORDER_SIDE,
        ),
      ],
    );
  }
}
