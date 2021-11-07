import 'package:json_annotation/json_annotation.dart';

part 'config.g.dart';

@JsonSerializable()
class Config {
  Config(this.maintenance, this.mtMessage, this.placeholderName, this.link,
      this.customScale, this.version);

  bool maintenance;
  String mtMessage;
  String placeholderName;
  String link;
  double customScale;
  int version;

  factory Config.fromJson(Map<String, dynamic> json) => _$ConfigFromJson(json);

  Map<String, dynamic> toJson() => _$ConfigToJson(this);

  @override
  String toString() {
    return 'Config{maintenance: $maintenance, mtMessage: $mtMessage, version: $version}';
  }
}
