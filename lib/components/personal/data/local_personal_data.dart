import 'package:json_annotation/json_annotation.dart';

part 'local_personal_data.g.dart';

@JsonSerializable()
class LocalPersonalData {
  const LocalPersonalData({
    this.title,
    this.imagePath,
  });

  final String title;
  final String imagePath;

  factory LocalPersonalData.fromJson(Map<String, dynamic> json) {
    if (json == null) return null;

    return LocalPersonalData(
      title: json['title'],
      imagePath: json['imagePath'],
    );
  }
}
