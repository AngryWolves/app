// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'master_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MasterDataBean _$MasterDataBeanFromJson(Map<String, dynamic> json) {
  return MasterDataBean(
      json['result'] as int,
      json['msg'] as String,
      (json['data'] as List)
          ?.map((e) =>
              e == null ? null : MasterData.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$MasterDataBeanToJson(MasterDataBean instance) =>
    <String, dynamic>{
      'result': instance.result,
      'msg': instance.msg,
      'data': instance.data
    };

MasterData _$MasterDataFromJson(Map<String, dynamic> json) {
  return MasterData(
      json['buildNo'] as String,
      json['buildMasterName'] as String,
      json['masterTel'] as String,
      json['floor'] as String,
      json['floorMasterName'] as String,
      json['tel'] as String,
      json['createTime'] as int);
}

Map<String, dynamic> _$MasterDataToJson(MasterData instance) =>
    <String, dynamic>{
      'buildNo': instance.buildNo,
      'buildMasterName': instance.buildMasterName,
      'masterTel': instance.masterTel,
      'floor': instance.floor,
      'floorMasterName': instance.floorMasterName,
      'tel': instance.tel,
      'createTime': instance.createTime
    };
