import 'package:json_annotation/json_annotation.dart';

part 'appoint_data.g.dart';

//我的预约Data/
@JsonSerializable()
class AppointDataBean extends Object{

  @JsonKey(name: 'data')
  List<AppointData> data;

  @JsonKey(name: 'msg')
  String msg;

  @JsonKey(name: 'result')
  int result;

  AppointDataBean(this.data,this.msg,this.result,);

  factory AppointDataBean.fromJson(Map<String, dynamic> srcJson) => _$AppointDataBeanFromJson(srcJson);

}


@JsonSerializable()
class AppointData extends Object{

  @JsonKey(name: 'beginTime')
  String beginTime;

  @JsonKey(name: 'createTime')
  String createTime;

  @JsonKey(name: 'duration')
  String duration;

  @JsonKey(name: 'endTime')
  String endTime;

  @JsonKey(name: 'fee')
  dynamic fee;

  @JsonKey(name: 'note')
  String note;

  @JsonKey(name: 'placeDate')
  String placeDate;

  @JsonKey(name: 'placeType')
  int placeType;

  @JsonKey(name: 'position')
  String position;

  @JsonKey(name: 'status')
  int status;

  @JsonKey(name: 'yardappointId')
  String yardappointId;

  AppointData(this.beginTime,this.createTime,this.duration,this.endTime,this.fee,this.note,this.placeDate,this.placeType,this.position,this.status,this.yardappointId,);

  factory AppointData.fromJson(Map<String, dynamic> srcJson) => _$AppointDataFromJson(srcJson);

}