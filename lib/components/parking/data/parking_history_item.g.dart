// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'parking_history_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ParkingHistoryItem _$ParkingHistoryItemFromJson(Map<String, dynamic> json) {
  return ParkingHistoryItem(
      (json['data'] as List)
          ?.map((e) => e == null
              ? null
              : ParkingHistoryData.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['msg'] as String,
      json['result'] as int);
}

Map<String, dynamic> _$ParkingHistoryItemToJson(ParkingHistoryItem instance) =>
    <String, dynamic>{
      'data': instance.data,
      'msg': instance.msg,
      'result': instance.result
    };

ParkingHistoryData _$ParkingHistoryDataFromJson(Map<String, dynamic> json) {
  return ParkingHistoryData(
      json['beginTime'] as String,
      json['endTime'] as String,
      json['fee'] as int,
      json['totalHour'] as String);
}

Map<String, dynamic> _$ParkingHistoryDataToJson(ParkingHistoryData instance) =>
    <String, dynamic>{
      'beginTime': instance.beginTime,
      'endTime': instance.endTime,
      'fee': instance.fee,
      'totalHour': instance.totalHour
    };
