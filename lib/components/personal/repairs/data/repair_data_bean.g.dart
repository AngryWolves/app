// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repair_data_bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RepairDataBean _$RepairDataBeanFromJson(Map<String, dynamic> json) {
  return RepairDataBean(
      (json['data'] as List)
          ?.map((e) =>
              e == null ? null : RepairData.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['msg'] as String,
      json['result'] as int);
}

Map<String, dynamic> _$RepairDataBeanToJson(RepairDataBean instance) =>
    <String, dynamic>{
      'data': instance.data,
      'msg': instance.msg,
      'result': instance.result
    };

RepairData _$RepairDataFromJson(Map<String, dynamic> json) {
  return RepairData(json['applyContent'] as String, json['applyStatus'] as int,
      json['createTime'] as String, json['repairApplyId'] as String);
}

Map<String, dynamic> _$RepairDataToJson(RepairData instance) =>
    <String, dynamic>{
      'applyContent': instance.applyContent,
      'applyStatus': instance.applyStatus,
      'createTime': instance.createTime,
      'repairApplyId': instance.repairApplyId
    };
