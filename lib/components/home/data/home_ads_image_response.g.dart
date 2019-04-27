// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_ads_image_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeAdsImageResponse _$HomeAdsImageResponseFromJson(Map<String, dynamic> json) {
  return HomeAdsImageResponse(
      json['result'] as int,
      json['msg'] as String,
      (json['data'] as List)
          ?.map((e) => e == null
              ? null
              : AdsImagesData.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$HomeAdsImageResponseToJson(
        HomeAdsImageResponse instance) =>
    <String, dynamic>{
      'result': instance.result,
      'msg': instance.msg,
      'data': instance.data
    };

AdsImagesData _$AdsImagesDataFromJson(Map<String, dynamic> json) {
  return AdsImagesData(
      json['picturesId'] as String,
      json['title'] as String,
      json['path'] as String,
      json['createTime'] as int,
      json['link'] as String);
}

Map<String, dynamic> _$AdsImagesDataToJson(AdsImagesData instance) =>
    <String, dynamic>{
      'picturesId': instance.picturesId,
      'title': instance.title,
      'path': instance.path,
      'createTime': instance.createTime,
      'link': instance.link
    };
