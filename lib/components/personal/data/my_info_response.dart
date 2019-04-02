import 'package:json_annotation/json_annotation.dart';

part 'my_info_response.g.dart';


@JsonSerializable()
class MyInfoResponse extends Object {

  @JsonKey(name: 'result')
  int result;

  @JsonKey(name: 'msg')
  String msg;

  @JsonKey(name: 'data')
  MyInfoData data;

  MyInfoResponse(this.result,this.msg,this.data,);

  factory MyInfoResponse.fromJson(Map<String, dynamic> srcJson) => _$MyInfoResponseFromJson(srcJson);

  Map<String, dynamic> toJson() => _$MyInfoResponseToJson(this);

}


@JsonSerializable()
class MyInfoData extends Object {

  @JsonKey(name: 'userId')
  String userId;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'headImage')
  String headImage;

  @JsonKey(name: 'sex')
  String sex;

  @JsonKey(name: 'email')
  String email;

  @JsonKey(name: 'phone')
  String phone;

  @JsonKey(name: 'companyId')
  String companyId;

  @JsonKey(name: 'companyName')
  String companyName;

  @JsonKey(name: 'logo')
  String logo;

  @JsonKey(name: 'companyCertify')
  String companyCertify;

  MyInfoData(this.userId,this.name,this.headImage,this.sex,this.email,this
          .phone,
          this.companyId,this.companyName,this.logo,this.companyCertify,);

  factory MyInfoData.fromJson(Map<String, dynamic> srcJson) =>
          _$MyInfoDataFromJson
    (srcJson);

  Map<String, dynamic> toJson() => _$MyInfoDataToJson(this);

}