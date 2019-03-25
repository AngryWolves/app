import 'package:json_annotation/json_annotation.dart';

part 'car_info.g.dart';


@JsonSerializable()
class CarInfo extends Object {

    @JsonKey(name: 'result')
    int result;

    @JsonKey(name: 'msg')
    String msg;

    @JsonKey(name: 'data')
    CarInfoData data;

    CarInfo(this.result,this.msg,this.data,);

    factory CarInfo.fromJson(Map<String, dynamic> srcJson) => _$CarInfoFromJson(srcJson);

    Map<String, dynamic> toJson() => _$CarInfoToJson(this);

}

@JsonSerializable()
class CarInfoData extends Object {

    @JsonKey(name: 'userCarBindId')
    String userCarBindId;

    @JsonKey(name: 'userId')
    String userId;

    @JsonKey(name: 'carNo')
    String carNo;

    @JsonKey(name: 'status')
    String status;

    @JsonKey(name: 'createTime')
    String createTime;

    CarInfoData(this.userCarBindId,this.userId,this.carNo,this.status,this.createTime,);

    factory CarInfoData.fromJson(Map<String, dynamic> srcJson) => _$CarInfoDataFromJson(srcJson);

    Map<String, dynamic> toJson() => _$CarInfoDataToJson(this);

}