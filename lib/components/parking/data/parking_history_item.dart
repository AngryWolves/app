import 'package:json_annotation/json_annotation.dart';

part 'parking_history_item.g.dart';


@JsonSerializable()
class ParkingHistoryItem extends Object {

    @JsonKey(name: 'data')
    List<ParkingHistoryData> data;

    @JsonKey(name: 'msg')
    String msg;

    @JsonKey(name: 'result')
    int result;

    ParkingHistoryItem(this.data,this.msg,this.result,);

    factory ParkingHistoryItem.fromJson(Map<String, dynamic> srcJson) => _$ParkingHistoryItemFromJson(srcJson);

    Map<String, dynamic> toJson() => _$ParkingHistoryItemToJson(this);

}


@JsonSerializable()
class ParkingHistoryData extends Object {

    @JsonKey(name: 'beginTime')
    String beginTime;

    @JsonKey(name: 'endTime')
    String endTime;

    @JsonKey(name: 'fee')
    int fee;

    @JsonKey(name: 'totalHour')
    String totalHour;

    ParkingHistoryData(this.beginTime,this.endTime,this.fee,this.totalHour,);

    factory ParkingHistoryData.fromJson(Map<String, dynamic> srcJson) => _$ParkingHistoryDataFromJson(srcJson);

    Map<String, dynamic> toJson() => _$ParkingHistoryDataToJson(this);

}