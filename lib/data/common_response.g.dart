// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'common_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommonResponse _$CommonResponseFromJson(Map<String, dynamic> json) {
  return CommonResponse(
      json['data'] == null
          ? null
          : CommonData.fromJson(json['data'] as Map<String, dynamic>),
      json['msg'] as String,
      json['result'] as int);
}

Map<String, dynamic> _$CommonResponseToJson(CommonResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'msg': instance.msg,
      'result': instance.result
    };

CommonData _$CommonDataFromJson(Map<String, dynamic> json) {
  return CommonData();
}

Map<String, dynamic> _$CommonDataToJson(CommonData instance) =>
    <String, dynamic>{};
