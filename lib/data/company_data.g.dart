// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompanyData _$CompanyDataFromJson(Map<String, dynamic> json) {
  return CompanyData(
      json['result'] as int,
      json['msg'] as String,
      (json['data'] as List)
          ?.map((e) =>
              e == null ? null : Data.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$CompanyDataToJson(CompanyData instance) =>
    <String, dynamic>{
      'result': instance.result,
      'msg': instance.msg,
      'data': instance.data
    };

Data _$DataFromJson(Map<String, dynamic> json) {
  return Data(json['companyId'] as String, json['companyName'] as String);
}

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'companyId': instance.companyId,
      'companyName': instance.companyName
    };
