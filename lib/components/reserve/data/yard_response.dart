import 'package:json_annotation/json_annotation.dart';

part 'yard_response.g.dart';

@JsonSerializable()
class YardResponse extends Object {
  @JsonKey(name: 'result')
  int result;

  @JsonKey(name: 'msg')
  String msg;

  @JsonKey(name: 'data')
  List<YardData> data;

  YardResponse(
    this.result,
    this.msg,
    this.data,
  );

  factory YardResponse.fromJson(Map<String, dynamic> srcJson) =>
      _$YardResponseFromJson(srcJson);

  Map<String, dynamic> toJson() => _$YardResponseToJson(this);
}

@JsonSerializable()
class YardData extends Object {
  @JsonKey(name: 'yardId')
  String yardId;

  @JsonKey(name: 'placeType')
  int placeType;

  @JsonKey(name: 'position')
  String position;

  @JsonKey(name: 'imageUrl')
  String imageUrl;

  @JsonKey(name: 'equipment')
  String equipment;

  @JsonKey(name: 'rentFee')
  double rentFee;

  @JsonKey(name: 'createTime')
  String createTime;

  YardData(
    this.yardId,
    this.placeType,
    this.position,
    this.imageUrl,
    this.equipment,
    this.rentFee,
    this.createTime,
  );

  factory YardData.fromJson(Map<String, dynamic> srcJson) =>
      _$YardDataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$YardDataToJson(this);
}
