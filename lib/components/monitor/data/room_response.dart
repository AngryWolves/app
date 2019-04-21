import 'package:json_annotation/json_annotation.dart';

part 'room_response.g.dart';


@JsonSerializable()
class RoomResponse extends Object {

    @JsonKey(name: 'result')
    int result;

    @JsonKey(name: 'msg')
    String msg;

    @JsonKey(name: 'data')
    List<RoomData> data;

    RoomResponse(this.result,this.msg,this.data,);

    factory RoomResponse.fromJson(Map<String, dynamic> srcJson) => _$RoomResponseFromJson(srcJson);

    Map<String, dynamic> toJson() => _$RoomResponseToJson(this);

}


@JsonSerializable()
class RoomData extends Object {

    @JsonKey(name: 'id')
    String id;

    @JsonKey(name: 'name')
    String name;

    RoomData(this.id,this.name,);

    factory RoomData.fromJson(Map<String, dynamic> srcJson) =>
            _$RoomDataFromJson(srcJson);

    Map<String, dynamic> toJson() => _$RoomDataToJson(this);

}


