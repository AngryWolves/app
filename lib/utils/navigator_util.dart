import 'package:flutter/material.dart';
import 'package:smart_park/pages/message_page.dart';

class NavigatorUtil {

    static goMessagePage(BuildContext context) {
        Navigator.push(context, MaterialPageRoute(builder: (_) => MessagePage()));
    }
}
