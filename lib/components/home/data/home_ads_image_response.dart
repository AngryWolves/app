import 'package:json_annotation/json_annotation.dart';

part 'home_ads_image_response.g.dart';


@JsonSerializable()
class HomeAdsImageResponse extends Object {

    @JsonKey(name: 'result')
    int result;

    @JsonKey(name: 'msg')
    String msg;

    @JsonKey(name: 'data')
    List<AdsImagesData> data;

    HomeAdsImageResponse(this.result,this.msg,this.data,);

    factory HomeAdsImageResponse.fromJson(Map<String, dynamic> srcJson) => _$HomeAdsImageResponseFromJson(srcJson);

    Map<String, dynamic> toJson() => _$HomeAdsImageResponseToJson(this);

}


@JsonSerializable()
class AdsImagesData extends Object {

    @JsonKey(name: 'picturesId')
    String picturesId;

    @JsonKey(name: 'title')
    String title;

    @JsonKey(name: 'path')
    String path;

    @JsonKey(name: 'createTime')
    int createTime;

    @JsonKey(name: 'link')
    String link;

    AdsImagesData(this.picturesId,this.title,this.path,this.createTime,this.link);

    factory AdsImagesData.fromJson(Map<String, dynamic> srcJson) =>
            _$AdsImagesDataFromJson
        (srcJson);

    Map<String, dynamic> toJson() => _$AdsImagesDataToJson(this);

}


