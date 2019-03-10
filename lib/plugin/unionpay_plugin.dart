import 'package:flutter/services.dart';

const MethodChannel _kChannel = MethodChannel('SmarkPark/unionpay');

class UnionPayPlugin {
  Future<String> pay(String tn) async =>
      await _kChannel.invokeMethod('pay', tn);
}
