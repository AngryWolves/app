import 'package:json_annotation/json_annotation.dart';

part 'message_data_response.g.dart';


@JsonSerializable()
class MessageDataResponse extends Object {

    @JsonKey(name: 'result')
    int result;

    @JsonKey(name: 'msg')
    String msg;

    @JsonKey(name: 'data')
    List<MessageData> data;

    MessageDataResponse(this.result,this.msg,this.data,);

    factory MessageDataResponse.fromJson(Map<String, dynamic> srcJson) => _$MessageDataResponseFromJson(srcJson);

    Map<String, dynamic> toJson() => _$MessageDataResponseToJson(this);

}


@JsonSerializable()
class MessageData extends Object {

    @JsonKey(name: 'tipMsgId')
    String tipMsgId;

    @JsonKey(name: 'msgType')
    int msgType;

    @JsonKey(name: 'toUser')
    String toUser;

    @JsonKey(name: 'alertTitle')
    String alertTitle;

    @JsonKey(name: 'alertContent')
    String alertContent;

    @JsonKey(name: 'createTime')
    String createTime;

    @JsonKey(name: 'updateTime')
    String updateTime;

    MessageData(this.tipMsgId,this.msgType,this.toUser,this.alertTitle,this.alertContent,this.createTime,this.updateTime,);

    factory MessageData.fromJson(Map<String, dynamic> srcJson) => _$MessageDataFromJson(srcJson);

    Map<String, dynamic> toJson() => _$MessageDataToJson(this);

}