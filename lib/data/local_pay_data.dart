import 'package:json_annotation/json_annotation.dart';

part 'local_pay_data.g.dart';

//flutter packages pub run build_runner build/
List<LocalPay> getLocalPayList(List<dynamic> list){
  List<LocalPay> result = [];
  list.forEach((item){
    result.add(LocalPay.fromJson(item));
  });
  return result;
}
@JsonSerializable()
class LocalPay extends Object{

  @JsonKey(name: 'payTitle')
  String payTitle;

  @JsonKey(name: 'imagePath')
  String imagePath;

  LocalPay(this.payTitle,this.imagePath,);

  factory LocalPay.fromJson(Map<String, dynamic> srcJson) => _$LocalPayFromJson(srcJson);

}


