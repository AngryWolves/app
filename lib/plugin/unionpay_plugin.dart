import 'package:flutter/services.dart';

const MethodChannel _kChannel = MethodChannel('SmarkPark/unionpay');

class UnionPayPlugin {
  Future<bool> pay(String amount) =>
      _kChannel.invokeMethod('pay', <String, dynamic> {
        'amount' : amount
      }).then((result) => result);
}
