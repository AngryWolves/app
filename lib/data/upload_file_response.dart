import 'package:json_annotation/json_annotation.dart';

part 'upload_file_response.g.dart';


@JsonSerializable()
class UploadFileResponse extends Object {

    @JsonKey(name: 'data')
    List<String> data;

    @JsonKey(name: 'msg')
    String msg;

    @JsonKey(name: 'result')
    int result;

    UploadFileResponse(this.data,this.msg,this.result,);

    factory UploadFileResponse.fromJson(Map<String, dynamic> srcJson) => _$UploadFileResponseFromJson(srcJson);

    Map<String, dynamic> toJson() => _$UploadFileResponseToJson(this);

}