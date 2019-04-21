// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoomResponse _$RoomResponseFromJson(Map<String, dynamic> json) {
  return RoomResponse(
      json['result'] as int,
      json['msg'] as String,
      (json['data'] as List)
          ?.map((e) =>
              e == null ? null : RoomData.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$RoomResponseToJson(RoomResponse instance) =>
    <String, dynamic>{
      'result': instance.result,
      'msg': instance.msg,
      'data': instance.data
    };

RoomData _$RoomDataFromJson(Map<String, dynamic> json) {
  return RoomData(json['id'] as String, json['name'] as String);
}

Map<String, dynamic> _$RoomDataToJson(RoomData instance) =>
    <String, dynamic>{'id': instance.id, 'name': instance.name};
