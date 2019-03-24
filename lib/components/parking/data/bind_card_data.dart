import 'package:json_annotation/json_annotation.dart';

part 'bind_card_data.g.dart';


@JsonSerializable()
  class BindCardData extends Object {

  @JsonKey(name: 'result')
  int result;

  @JsonKey(name: 'msg')
  String msg;

  BindCardData(this.result,this.msg,);

  factory BindCardData.fromJson(Map<String, dynamic> srcJson) => _$BindCardDataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$BindCardDataToJson(this);

}

  
