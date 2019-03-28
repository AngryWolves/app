import 'package:json_annotation/json_annotation.dart';

part 'my_payment_response.g.dart';

@JsonSerializable()
class MyPaymentResponse extends Object {
  @JsonKey(name: 'data')
  List<MyPaymentData> data;

  @JsonKey(name: 'msg')
  String msg;

  @JsonKey(name: 'result')
  int result;

  MyPaymentResponse(
    this.data,
    this.msg,
    this.result,
  );

  factory MyPaymentResponse.fromJson(Map<String, dynamic> srcJson) =>
      _$MyPaymentResponseFromJson(srcJson);

  Map<String, dynamic> toJson() => _$MyPaymentResponseToJson(this);
}

@JsonSerializable()
class MyPaymentData extends Object {
  @JsonKey(name: 'createTime')
  String createTime;

  @JsonKey(name: 'payAmount')
  int payAmount;

  @JsonKey(name: 'payStatus')
  int payStatus;

  @JsonKey(name: 'payTime')
  String payTime;

  @JsonKey(name: 'payType')
  int payType;

  @JsonKey(name: 'payorderId')
  String payorderId;

  @JsonKey(name: 'returnTime')
  String returnTime;

  @JsonKey(name: 'updateTime')
  String updateTime;

  @JsonKey(name: 'userId')
  String userId;

  MyPaymentData(
    this.createTime,
    this.payAmount,
    this.payStatus,
    this.payTime,
    this.payType,
    this.payorderId,
    this.returnTime,
    this.updateTime,
    this.userId,
  );

  factory MyPaymentData.fromJson(Map<String, dynamic> srcJson) =>
      _$MyPaymentDataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$MyPaymentDataToJson(this);
}
