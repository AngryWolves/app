// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_apply_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyApplyResponse _$MyApplyResponseFromJson(Map<String, dynamic> json) {
  return MyApplyResponse(
      (json['data'] as List)
          ?.map((e) =>
              e == null ? null : ApplyData.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['msg'] as String,
      json['result'] as int);
}

Map<String, dynamic> _$MyApplyResponseToJson(MyApplyResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'msg': instance.msg,
      'result': instance.result
    };

ApplyData _$ApplyDataFromJson(Map<String, dynamic> json) {
  return ApplyData(
      json['content'] as String,
      json['createTime'] as String,
      json['decorateId'] as String,
      json['decorateNo'] as String,
      json['status'] as int,
      json['title'] as String,
      json['type'] as int,
      json['updateTime'] as String,
      json['userId'] as String);
}

Map<String, dynamic> _$ApplyDataToJson(ApplyData instance) => <String, dynamic>{
      'content': instance.content,
      'createTime': instance.createTime,
      'decorateId': instance.decorateId,
      'decorateNo': instance.decorateNo,
      'status': instance.status,
      'title': instance.title,
      'type': instance.type,
      'updateTime': instance.updateTime,
      'userId': instance.userId
    };
