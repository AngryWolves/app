import 'package:json_annotation/json_annotation.dart';

part 'home_new_response.g.dart';


@JsonSerializable()
class HomeNewResponse extends Object {

    @JsonKey(name: 'result')
    int result;

    @JsonKey(name: 'msg')
    String msg;

    @JsonKey(name: 'data')
    List<HomeNewData> data;

    HomeNewResponse(this.result,this.msg,this.data,);

    factory HomeNewResponse.fromJson(Map<String, dynamic> srcJson) => _$HomeNewResponseFromJson(srcJson);

    Map<String, dynamic> toJson() => _$HomeNewResponseToJson(this);

}


@JsonSerializable()
class HomeNewData extends Object {

    @JsonKey(name: 'newstipId')
    String newstipId;

    @JsonKey(name: 'newsTitle')
    String newsTitle;

    @JsonKey(name: 'newsContent')
    String newsContent;

    @JsonKey(name: 'attachUrl')
    String attachUrl;

    @JsonKey(name: 'createTime')
    String createTime;

    HomeNewData(this.newstipId,this.newsTitle,this.newsContent,this.attachUrl,this.createTime,);

    factory HomeNewData.fromJson(Map<String, dynamic> srcJson) => _$HomeNewDataFromJson(srcJson);

    Map<String, dynamic> toJson() => _$HomeNewDataToJson(this);

}