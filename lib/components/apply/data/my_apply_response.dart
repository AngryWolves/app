import 'package:json_annotation/json_annotation.dart';

part 'my_apply_response.g.dart';

@JsonSerializable()
class MyApplyResponse extends Object {
  @JsonKey(name: 'data')
  List<ApplyData> data;

  @JsonKey(name: 'msg')
  String msg;

  @JsonKey(name: 'result')
  int result;

  MyApplyResponse(
    this.data,
    this.msg,
    this.result,
  );

  factory MyApplyResponse.fromJson(Map<String, dynamic> srcJson) =>
      _$MyApplyResponseFromJson(srcJson);

  Map<String, dynamic> toJson() => _$MyApplyResponseToJson(this);
}

@JsonSerializable()
class ApplyData extends Object {
  @JsonKey(name: 'content')
  String content;

  @JsonKey(name: 'createTime')
  String createTime;

  @JsonKey(name: 'decorateId')
  String decorateId;

  @JsonKey(name: 'decorateNo')
  String decorateNo;

  @JsonKey(name: 'status')
  int status;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'type')
  int type;

  @JsonKey(name: 'updateTime')
  String updateTime;

  @JsonKey(name: 'userId')
  String userId;

  ApplyData(
    this.content,
    this.createTime,
    this.decorateId,
    this.decorateNo,
    this.status,
    this.title,
    this.type,
    this.updateTime,
    this.userId,
  );

  factory ApplyData.fromJson(Map<String, dynamic> srcJson) =>
      _$ApplyDataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ApplyDataToJson(this);
}
