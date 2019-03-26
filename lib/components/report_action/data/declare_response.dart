import 'package:json_annotation/json_annotation.dart';

part 'declare_response.g.dart';


@JsonSerializable()
class DeclareResponse extends Object {

    @JsonKey(name: 'result')
    int result;

    @JsonKey(name: 'msg')
    String msg;

    @JsonKey(name: 'data')
    List<DeclareData> data;

    DeclareResponse(this.result,this.msg,this.data,);

    factory DeclareResponse.fromJson(Map<String, dynamic> srcJson) => _$DeclareResponseFromJson(srcJson);

    Map<String, dynamic> toJson() => _$DeclareResponseToJson(this);

}

@JsonSerializable()
class DeclareDetail extends Object {

    @JsonKey(name: 'result')
    int result;

    @JsonKey(name: 'msg')
    String msg;

    @JsonKey(name: 'data')
    DeclareData data;

    DeclareDetail(this.result,this.msg,this.data,);

    factory DeclareDetail.fromJson(Map<String, dynamic> srcJson) => _$DeclareDetailFromJson(srcJson);

    Map<String, dynamic> toJson() => _$DeclareDetailToJson(this);

}


@JsonSerializable()
class DeclareData extends Object {

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

    DeclareData(this.newstipId,this.newsTitle,this.newsContent,this.attachUrl,
            this
            .createTime,);

    factory DeclareData.fromJson(Map<String, dynamic> srcJson) =>
            _$DeclareDataFromJson
        (srcJson);

    Map<String, dynamic> toJson() => _$DeclareDataToJson(this);

}