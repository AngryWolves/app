// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_pay_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocalPay _$LocalPayFromJson(Map<String, dynamic> json) {
  return LocalPay(json['payTitle'] as String, json['imagePath'] as String);
}

Map<String, dynamic> _$LocalPayToJson(LocalPay instance) => <String, dynamic>{
      'payTitle': instance.payTitle,
      'imagePath': instance.imagePath
    };
