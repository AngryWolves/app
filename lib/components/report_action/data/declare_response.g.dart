// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'declare_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeclareResponse _$DeclareResponseFromJson(Map<String, dynamic> json) {
  return DeclareResponse(
      json['result'] as int,
      json['msg'] as String,
      (json['data'] as List)
          ?.map((e) => e == null
              ? null
              : DeclareData.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$DeclareResponseToJson(DeclareResponse instance) =>
    <String, dynamic>{
      'result': instance.result,
      'msg': instance.msg,
      'data': instance.data
    };

DeclareDetail _$DeclareDetailFromJson(Map<String, dynamic> json) {
  return DeclareDetail(
      json['result'] as int,
      json['msg'] as String,
      json['data'] == null
          ? null
          : DeclareData.fromJson(json['data'] as Map<String, dynamic>));
}

Map<String, dynamic> _$DeclareDetailToJson(DeclareDetail instance) =>
    <String, dynamic>{
      'result': instance.result,
      'msg': instance.msg,
      'data': instance.data
    };

DeclareData _$DeclareDataFromJson(Map<String, dynamic> json) {
  return DeclareData(
      json['newstipId'] as String,
      json['newsTitle'] as String,
      json['newsContent'] as String,
      json['attachUrl'] as String,
      json['createTime'] as String);
}

Map<String, dynamic> _$DeclareDataToJson(DeclareData instance) =>
    <String, dynamic>{
      'newstipId': instance.newstipId,
      'newsTitle': instance.newsTitle,
      'newsContent': instance.newsContent,
      'attachUrl': instance.attachUrl,
      'createTime': instance.createTime
    };
