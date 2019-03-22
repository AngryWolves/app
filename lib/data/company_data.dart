import 'package:json_annotation/json_annotation.dart';

part 'company_data.g.dart';


@JsonSerializable()
class CompanyData extends Object {

  @JsonKey(name: 'result')
  int result;

  @JsonKey(name: 'msg')
  String msg;

  @JsonKey(name: 'data')
  List<Data> data;

  CompanyData(this.result,this.msg,this.data,);

  factory CompanyData.fromJson(Map<String, dynamic> srcJson) => _$CompanyDataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$CompanyDataToJson(this);

}


@JsonSerializable()
class Data extends Object {

  @JsonKey(name: 'companyId')
  String companyId;

  @JsonKey(name: 'companyName')
  String companyName;

  Data(this.companyId,this.companyName,);

  factory Data.fromJson(Map<String, dynamic> srcJson) => _$DataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$DataToJson(this);

}
