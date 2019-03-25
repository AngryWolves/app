// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessageDataResponse _$MessageDataResponseFromJson(Map<String, dynamic> json) {
  return MessageDataResponse(
      json['result'] as int,
      json['msg'] as String,
      (json['data'] as List)
          ?.map((e) => e == null
              ? null
              : MessageData.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$MessageDataResponseToJson(
        MessageDataResponse instance) =>
    <String, dynamic>{
      'result': instance.result,
      'msg': instance.msg,
      'data': instance.data
    };

MessageData _$MessageDataFromJson(Map<String, dynamic> json) {
  return MessageData(
      json['tipMsgId'] as String,
      json['msgType'] as int,
      json['toUser'] as String,
      json['alertTitle'] as String,
      json['alertContent'] as String,
      json['createTime'] as String,
      json['updateTime'] as String);
}

Map<String, dynamic> _$MessageDataToJson(MessageData instance) =>
    <String, dynamic>{
      'tipMsgId': instance.tipMsgId,
      'msgType': instance.msgType,
      'toUser': instance.toUser,
      'alertTitle': instance.alertTitle,
      'alertContent': instance.alertContent,
      'createTime': instance.createTime,
      'updateTime': instance.updateTime
    };
