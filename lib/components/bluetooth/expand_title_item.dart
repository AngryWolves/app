import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_park/values/colors.dart';
import 'package:smart_park/values/strings.dart';

class ExpandTitleItem extends StatefulWidget {
  ExpandTitleItem({this.title, this.child, this.callback})
      : assert(child != null),
        assert(title != null);

  final String title;

  final Widget child;

  final callback;

  @override
  _ExpandTitleItemState createState() => _ExpandTitleItemState();
}

class _ExpandTitleItemState extends State<ExpandTitleItem> {
  ExpansionPanelItem panelItem;

  @override
  void initState() {
    super.initState();
    panelItem = ExpansionPanelItem(
        title: widget.title,
        builder: (item) {
          return widget.child;
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ExpansionPanelList(
        expansionCallback: (index, isExpand) {
          print('expansionCallback index :: $index isExpand : $isExpand');
          if (widget.callback != null) {
            widget.callback();
          }
          setState(() {
            panelItem.isExpanded = !isExpand;
          });
        },
        children: [
          ExpansionPanel(
            isExpanded: panelItem.isExpanded,
            headerBuilder: panelItem.headerBuilder,
            body: panelItem.build(),
          ),
        ],
      ),
    );
  }
}

typedef ItemBodyBuilder = Widget Function(ExpansionPanelItem item);

class ExpansionPanelItem {
  ExpansionPanelItem({this.title, this.builder});

  bool isExpanded = false;
  final String title;
  final ItemBodyBuilder builder;

  ExpansionPanelHeaderBuilder get headerBuilder {
    return (BuildContext context, bool isExpanded) {
      return Container(
        padding: const EdgeInsets.only(left: 15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                Icon(
                  Icons.account_balance,
                  size: 18.0,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 15.0),
                  child: Text(
                    title,
                    style: TextStyle(
                        color: ColorRes.GERY_TEXT,
                        fontSize: ScreenUtil().setSp(18)),
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Text(
                  isExpanded ? bluetooth_item_collapse : bluetooth_item_expand,
                  style: TextStyle(
                      color:
                          isExpanded ? ColorRes.GERY_TEXT : ColorRes.BLUE_TEXT,
                      fontSize: 12.0),
                ), //                Icon(isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down)
              ],
            )
          ],
        ),
      );
    };
  }

  Widget build() => builder(this);
}
