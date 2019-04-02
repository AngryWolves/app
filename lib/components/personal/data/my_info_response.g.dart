// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_info_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyInfoResponse _$MyInfoResponseFromJson(Map<String, dynamic> json) {
  return MyInfoResponse(
      json['result'] as int,
      json['msg'] as String,
      json['data'] == null
          ? null
          : MyInfoData.fromJson(json['data'] as Map<String, dynamic>));
}

Map<String, dynamic> _$MyInfoResponseToJson(MyInfoResponse instance) =>
    <String, dynamic>{
      'result': instance.result,
      'msg': instance.msg,
      'data': instance.data
    };

MyInfoData _$MyInfoDataFromJson(Map<String, dynamic> json) {
  return MyInfoData(
      json['userId'] as String,
      json['name'] as String,
      json['headImage'] as String,
      json['sex'] as String,
      json['email'] as String,
      json['phone'] as String,
      json['companyId'] as String,
      json['companyName'] as String,
      json['logo'] as String,
      json['companyCertify'] as String);
}

Map<String, dynamic> _$MyInfoDataToJson(MyInfoData instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'name': instance.name,
      'headImage': instance.headImage,
      'sex': instance.sex,
      'email': instance.email,
      'phone': instance.phone,
      'companyId': instance.companyId,
      'companyName': instance.companyName,
      'logo': instance.logo,
      'companyCertify': instance.companyCertify
    };
