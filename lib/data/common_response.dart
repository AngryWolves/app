import 'package:json_annotation/json_annotation.dart';

part 'common_response.g.dart';

@JsonSerializable()
class CommonResponse extends Object {
  @JsonKey(name: 'data')
  CommonData data;

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

@JsonSerializable()
class CommonData extends Object {
  CommonData();

  factory CommonData.fromJson(Map<String, dynamic> srcJson) =>
      _$CommonDataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$CommonDataToJson(this);
}
