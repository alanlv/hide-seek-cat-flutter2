import 'package:json_annotation/json_annotation.dart';

part 'app.g.dart';

@JsonSerializable()
class App {
  @JsonKey(required: true)
  String device;

  String? channel;
  String? architecture;
  String? model;
  String? shopUrl;
  String? banner;
  String? fileUrl;
  String? latestVersion;
  String? latestDescription;
  App({required this.device, this.channel, this.architecture, this.model, this.shopUrl, this.fileUrl, this.latestVersion, this.latestDescription, this.banner});

  factory App.fromJson(Map<String, dynamic> json) => _$AppFromJson(json);
  Map<String, dynamic> toJson() => _$AppToJson(this);
}