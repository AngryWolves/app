import 'package:json_annotation/json_annotation.dart';

part 'response_successful_data.g.dart';


@JsonSerializable()
class ResponseSuccessfulData extends Object{

  @JsonKey(name: 'result')
  int result;

  @JsonKey(name: 'msg')
  String msg;

  ResponseSuccessfulData(this.result,this.msg,);

  factory ResponseSuccessfulData.fromJson(Map<String, dynamic> srcJson) => _$ResponseSuccessfulDataFromJson(srcJson);

}