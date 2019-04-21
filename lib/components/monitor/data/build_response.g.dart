// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'build_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BuildResponse _$BuildResponseFromJson(Map<String, dynamic> json) {
  return BuildResponse(
      json['result'] as int,
      json['msg'] as String,
      (json['data'] as List)
          ?.map((e) =>
              e == null ? null : BuildData.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$BuildResponseToJson(BuildResponse instance) =>
    <String, dynamic>{
      'result': instance.result,
      'msg': instance.msg,
      'data': instance.data
    };

BuildData _$BuildDataFromJson(Map<String, dynamic> json) {
  return BuildData(json['id'] as String, json['name'] as String);
}

Map<String, dynamic> _$BuildDataToJson(BuildData instance) =>
    <String, dynamic>{'id': instance.id, 'name': instance.name};
