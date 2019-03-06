import 'package:common_utils/common_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CheckBoxWidget extends StatefulWidget {
  CheckBoxWidget(
      {this.activeColor,
      this.onChanged,
      this.value,
      this.tristate,
      this.size = 48.0});

  final Color activeColor; //激活时的颜色。
  Function onChanged; //改变时触发
  bool value; //复选框的值。
  final bool tristate; //如果为 true，那么复选框的值可以是 true，false 或 null。
  final double size; //可设置大小
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _CheckBoxWidget();
  }
}

class _CheckBoxWidget extends State<CheckBoxWidget> {
  @override
  Widget build(BuildContext context) {
    print("==点击===111="+widget.value.toString()+"======");
    return GestureDetector(
      onTap: () {
        setState(() {
          if (widget.onChanged != null) {
            widget.onChanged(widget.value);
          }
        });
      },
      child: widget.value
          ? Icon(
              Icons.check_box,
              color:
                  widget.activeColor != null ? widget.activeColor : Colors.blue,
              size: widget.size,
            )
          : Icon(
              Icons.check_box_outline_blank,
              color:
                  widget.activeColor != null ? widget.activeColor : Colors.blue,
              size: widget.size,
            ),
    );
  }
}
