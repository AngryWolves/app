import 'package:json_annotation/json_annotation.dart';

part 'yard_time_response.g.dart';


@JsonSerializable()
class YardTimeResponse extends Object {

    @JsonKey(name: 'result')
    int result;

    @JsonKey(name: 'msg')
    String msg;

    @JsonKey(name: 'data')
    List<String> data;

    YardTimeResponse(this.result,this.msg,this.data,);

    factory YardTimeResponse.fromJson(Map<String, dynamic> srcJson) => _$YardTimeResponseFromJson(srcJson);

    Map<String, dynamic> toJson() => _$YardTimeResponseToJson(this);

}