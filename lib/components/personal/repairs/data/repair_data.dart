import 'package:json_annotation/json_annotation.dart';

part 'repair_data.g.dart';


List<RepairData> getRepairDataList(List<dynamic> list){
  List<RepairData> result = [];
  list.forEach((item){
    result.add(RepairData.fromJson(item));
  });
  return result;
}
@JsonSerializable()
class RepairData extends Object{

  @JsonKey(name: 'repairTitle')
  String repairTitle;

  @JsonKey(name: 'repairState')
  int repairState;

  @JsonKey(name: 'repairNumber')
  String repairNumber;

  RepairData(this.repairTitle,this.repairState,this.repairNumber,);

  factory RepairData.fromJson(Map<String, dynamic> srcJson) => _$RepairDataFromJson(srcJson);

}


