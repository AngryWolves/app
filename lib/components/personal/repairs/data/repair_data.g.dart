// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repair_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RepairData _$RepairDataFromJson(Map<String, dynamic> json) {
  return RepairData(json['repairTitle'] as String, json['repairState'] as int,
      json['repairNumber'] as String);
}

Map<String, dynamic> _$RepairDataToJson(RepairData instance) =>
    <String, dynamic>{
      'repairTitle': instance.repairTitle,
      'repairState': instance.repairState,
      'repairNumber': instance.repairNumber
    };
