import 'package:json_annotation/json_annotation.dart';

part 'repair_data_bean.g.dart';


@JsonSerializable()
class RepairDataBean extends Object {

  @JsonKey(name: 'data')
  List<RepairData> data;

  @JsonKey(name: 'msg')
  String msg;

  @JsonKey(name: 'result')
  int result;

  RepairDataBean(this.data,this.msg,this.result,);

  factory RepairDataBean.fromJson(Map<String, dynamic> srcJson) => _$RepairDataBeanFromJson(srcJson);

  Map<String, dynamic> toJson() => _$RepairDataBeanToJson(this);

}


@JsonSerializable()
class RepairData extends Object {

  @JsonKey(name: 'applyContent')
  String applyContent;

  @JsonKey(name: 'applyStatus')
  int applyStatus;

  @JsonKey(name: 'createTime')
  String createTime;

  @JsonKey(name: 'repairApplyId')
  String repairApplyId;

  RepairData(this.applyContent,this.applyStatus,this.createTime,this.repairApplyId,);

  factory RepairData.fromJson(Map<String, dynamic> srcJson) => _$RepairDataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$RepairDataToJson(this);

}