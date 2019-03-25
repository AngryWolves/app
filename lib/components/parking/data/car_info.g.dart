// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CarInfo _$CarInfoFromJson(Map<String, dynamic> json) {
  return CarInfo(
      json['result'] as int,
      json['msg'] as String,
      json['data'] == null
          ? null
          : CarInfoData.fromJson(json['data'] as Map<String, dynamic>));
}

Map<String, dynamic> _$CarInfoToJson(CarInfo instance) => <String, dynamic>{
      'result': instance.result,
      'msg': instance.msg,
      'data': instance.data
    };

CarInfoData _$CarInfoDataFromJson(Map<String, dynamic> json) {
  return CarInfoData(
      json['userCarBindId'] as String,
      json['userId'] as String,
      json['carNo'] as String,
      json['status'] as String,
      json['createTime'] as String);
}

Map<String, dynamic> _$CarInfoDataToJson(CarInfoData instance) =>
    <String, dynamic>{
      'userCarBindId': instance.userCarBindId,
      'userId': instance.userId,
      'carNo': instance.carNo,
      'status': instance.status,
      'createTime': instance.createTime
    };
