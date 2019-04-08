// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appoint_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppointDataBean _$AppointDataBeanFromJson(Map<String, dynamic> json) {
  return AppointDataBean(
      (json['data'] as List)
          ?.map((e) => e == null
              ? null
              : AppointData.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['msg'] as String,
      json['result'] as int);
}

Map<String, dynamic> _$AppointDataBeanToJson(AppointDataBean instance) =>
    <String, dynamic>{
      'data': instance.data,
      'msg': instance.msg,
      'result': instance.result
    };

AppointData _$AppointDataFromJson(Map<String, dynamic> json) {
  return AppointData(
      json['beginTime'] as String,
      json['createTime'] as String,
      json['duration'] as String,
      json['endTime'] as String,
      (json['fee'] as num)?.toDouble(),
      json['note'] as String,
      json['placeDate'] as String,
      json['placeType'] as int,
      json['position'] as String,
      json['status'] as int,
      json['yardappointId'] as String);
}

Map<String, dynamic> _$AppointDataToJson(AppointData instance) =>
    <String, dynamic>{
      'beginTime': instance.beginTime,
      'createTime': instance.createTime,
      'duration': instance.duration,
      'endTime': instance.endTime,
      'fee': instance.fee,
      'note': instance.note,
      'placeDate': instance.placeDate,
      'placeType': instance.placeType,
      'position': instance.position,
      'status': instance.status,
      'yardappointId': instance.yardappointId
    };
