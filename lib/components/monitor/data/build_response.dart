import 'package:json_annotation/json_annotation.dart';

part 'build_response.g.dart';


@JsonSerializable()
class BuildResponse extends Object {

    @JsonKey(name: 'result')
    int result;

    @JsonKey(name: 'msg')
    String msg;

    @JsonKey(name: 'data')
    List<BuildData> data;

    BuildResponse(this.result,this.msg,this.data,);

    factory BuildResponse.fromJson(Map<String, dynamic> srcJson) => _$BuildResponseFromJson(srcJson);

    Map<String, dynamic> toJson() => _$BuildResponseToJson(this);

}


@JsonSerializable()
class BuildData extends Object {

    @JsonKey(name: 'id')
    String id;

    @JsonKey(name: 'name')
    String name;

    BuildData(this.id,this.name,);

    factory BuildData.fromJson(Map<String, dynamic> srcJson) =>
            _$BuildDataFromJson(srcJson);

    Map<String, dynamic> toJson() => _$BuildDataToJson(this);

}