// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'yard_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

YardResponse _$YardResponseFromJson(Map<String, dynamic> json) {
  return YardResponse(
      json['result'] as int,
      json['msg'] as String,
      (json['data'] as List)
          ?.map((e) =>
              e == null ? null : YardData.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$YardResponseToJson(YardResponse instance) =>
    <String, dynamic>{
      'result': instance.result,
      'msg': instance.msg,
      'data': instance.data
    };

YardData _$YardDataFromJson(Map<String, dynamic> json) {
  return YardData(
      json['yardId'] as String,
      json['placeType'] as int,
      json['position'] as String,
      json['imageUrl'] as String,
      json['equipment'] as String,
      (json['rentFee'] as num)?.toDouble(),
      json['createTime'] as String);
}

Map<String, dynamic> _$YardDataToJson(YardData instance) => <String, dynamic>{
      'yardId': instance.yardId,
      'placeType': instance.placeType,
      'position': instance.position,
      'imageUrl': instance.imageUrl,
      'equipment': instance.equipment,
      'rentFee': instance.rentFee,
      'createTime': instance.createTime
    };
