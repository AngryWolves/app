import 'package:json_annotation/json_annotation.dart';

part 'master_data.g.dart';


@JsonSerializable()
class MasterDataBean extends Object {

  @JsonKey(name: 'result')
  int result;

  @JsonKey(name: 'msg')
  String msg;

  @JsonKey(name: 'data')
  List<MasterData> data;

  MasterDataBean(this.result,this.msg,this.data,);

  factory MasterDataBean.fromJson(Map<String, dynamic> srcJson) => _$MasterDataBeanFromJson(srcJson);

  Map<String, dynamic> toJson() => _$MasterDataBeanToJson(this);

}


@JsonSerializable()
class MasterData extends Object {

  @JsonKey(name: 'buildNo')
  String buildNo;

  @JsonKey(name: 'buildMasterName')
  String buildMasterName;

  @JsonKey(name: 'masterTel')
  String masterTel;

  @JsonKey(name: 'floor')
  String floor;

  @JsonKey(name: 'floorMasterName')
  String floorMasterName;

  @JsonKey(name: 'tel')
  String tel;

  @JsonKey(name: 'createTime')
  String createTime;

  MasterData(this.buildNo,this.buildMasterName,this.masterTel,this.floor,this.floorMasterName,this.tel,this.createTime,);

  factory MasterData.fromJson(Map<String, dynamic> srcJson) => _$MasterDataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$MasterDataToJson(this);

}


