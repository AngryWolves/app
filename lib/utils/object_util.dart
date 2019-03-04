/**
 * @Author: thl
 * @GitHub: https://github.com/Sky24n
 * @Description: Object Util.
 * @Date: 2018/9/8
 */

import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/services.dart';

///
class ObjectUtil {
  /// Returns true if the string is null or 0-length.
  static bool isEmptyString(String str) {
    return str == null || str.isEmpty;
  }

  /// Returns true if the list is null or 0-length.
  static bool isEmptyList(List list) {
    return list == null || list.isEmpty;
  }

  /// Returns true if there is no key/value pair in the map.
  static bool isEmptyMap(Map map) {
    return map == null || map.isEmpty;
  }

  /// Returns true  String or List or Map is empty.
  static bool isEmpty(Object object) {
    if (object == null) return true;
    if (object is String && object.isEmpty) {
      return true;
    } else if (object is List && object.isEmpty) {
      return true;
    } else if (object is Map && object.isEmpty) {
      return true;
    }
    return false;
  }

  /// Returns true String or List or Map is not empty.
  static bool isNotEmpty(Object object) {
    return !isEmpty(object);
  }

  /// Returns true Two List Is Equal.
  static bool twoListIsEqual(List listA, List listB) {
    if (listA == listB) return true;
    if (listA == null || listB == null) return false;
    int length = listA.length;
    if (length != listB.length) return false;
    for (int i = 0; i < length; i++) {
      if (!listA.contains(listB[i])) {
        return false;
      }
    }
    return true;
  }

  static String encodePwdWithMD5(String password) {
    if (password == null && password.isEmpty) {
      return '';
    }
    return md5.convert(utf8.encode('xhb_$password')).toString().toUpperCase();
  }

  static copyToClipboard(String text) {
    if (text != null) {
      Clipboard.setData(ClipboardData(text: text));
    }
  }

  ///
  /// format utc time like : 2018-12-12T19;53:00.000Z
  /// 
  static String formatData(String time, {bool showDot = true}) {
    if (time == null) {
      return '';
    }
    var localTime = DateTime.parse(time).toLocal();
    var divide = showDot ? '.' : '-';
    return '${localTime.year}$divide${localTime.month}$divide${localTime.day}';
  }
}
