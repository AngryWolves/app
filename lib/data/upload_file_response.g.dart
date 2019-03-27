// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upload_file_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UploadFileResponse _$UploadFileResponseFromJson(Map<String, dynamic> json) {
  return UploadFileResponse(
      (json['data'] as List)?.map((e) => e as String)?.toList(),
      json['msg'] as String,
      json['result'] as int);
}

Map<String, dynamic> _$UploadFileResponseToJson(UploadFileResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'msg': instance.msg,
      'result': instance.result
    };
