// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_new_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeNewResponse _$HomeNewResponseFromJson(Map<String, dynamic> json) {
  return HomeNewResponse(
      json['result'] as int,
      json['msg'] as String,
      (json['data'] as List)
          ?.map((e) => e == null
              ? null
              : HomeNewData.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$HomeNewResponseToJson(HomeNewResponse instance) =>
    <String, dynamic>{
      'result': instance.result,
      'msg': instance.msg,
      'data': instance.data
    };

HomeNewData _$HomeNewDataFromJson(Map<String, dynamic> json) {
  return HomeNewData(
      json['newstipId'] as String,
      json['newsTitle'] as String,
      json['newsContent'] as String,
      json['attachUrl'] as String,
      json['createTime'] as String);
}

Map<String, dynamic> _$HomeNewDataToJson(HomeNewData instance) =>
    <String, dynamic>{
      'newstipId': instance.newstipId,
      'newsTitle': instance.newsTitle,
      'newsContent': instance.newsContent,
      'attachUrl': instance.attachUrl,
      'createTime': instance.createTime
    };
