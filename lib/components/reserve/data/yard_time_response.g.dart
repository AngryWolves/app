// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'yard_time_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

YardTimeResponse _$YardTimeResponseFromJson(Map<String, dynamic> json) {
  return YardTimeResponse(json['result'] as int, json['msg'] as String,
      (json['data'] as List)?.map((e) => e as String)?.toList());
}

Map<String, dynamic> _$YardTimeResponseToJson(YardTimeResponse instance) =>
    <String, dynamic>{
      'result': instance.result,
      'msg': instance.msg,
      'data': instance.data
    };
