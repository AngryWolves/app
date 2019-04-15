import 'package:json_annotation/json_annotation.dart';

part 'common_response.g.dart';

@JsonSerializable()
class CommonResponse extends Object {
  @JsonKey(name: 'data')
  String data;

  @JsonKey(name: 'msg')
  String msg;

  @JsonKey(name: 'result')
  int result;

  CommonResponse(
    this.data,
    this.msg,
    this.result,
  );

  factory CommonResponse.fromJson(Map<String, dynamic> srcJson) =>
      _$CommonResponseFromJson(srcJson);

  Map<String, dynamic> toJson() => _$CommonResponseToJson(this);
}
