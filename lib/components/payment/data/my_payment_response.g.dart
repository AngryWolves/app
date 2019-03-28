// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_payment_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyPaymentResponse _$MyPaymentResponseFromJson(Map<String, dynamic> json) {
  return MyPaymentResponse(
      (json['data'] as List)
          ?.map((e) => e == null
              ? null
              : MyPaymentData.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['msg'] as String,
      json['result'] as int);
}

Map<String, dynamic> _$MyPaymentResponseToJson(MyPaymentResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'msg': instance.msg,
      'result': instance.result
    };

MyPaymentData _$MyPaymentDataFromJson(Map<String, dynamic> json) {
  return MyPaymentData(
      json['createTime'] as String,
      json['payAmount'] as int,
      json['payStatus'] as int,
      json['payTime'] as String,
      json['payType'] as int,
      json['payorderId'] as String,
      json['returnTime'] as String,
      json['updateTime'] as String,
      json['userId'] as String);
}

Map<String, dynamic> _$MyPaymentDataToJson(MyPaymentData instance) =>
    <String, dynamic>{
      'createTime': instance.createTime,
      'payAmount': instance.payAmount,
      'payStatus': instance.payStatus,
      'payTime': instance.payTime,
      'payType': instance.payType,
      'payorderId': instance.payorderId,
      'returnTime': instance.returnTime,
      'updateTime': instance.updateTime,
      'userId': instance.userId
    };
