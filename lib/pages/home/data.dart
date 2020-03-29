import 'package:json_annotation/json_annotation.dart';

part 'data.g.dart';

@JsonSerializable(nullable: false)
class HomeData {
  int Cases;
  int Deaths;
  int Recovered;
  int Updated;
  String UpdatedAt;
  int Active;

  HomeData(
      {this.Cases,
        this.Deaths,
        this.Recovered,
        this.Updated,
        this.UpdatedAt,
        this.Active});

  factory HomeData.fromJson(Map<String, dynamic> json) => _$HomeDataFromJson(json);

  Map<String, dynamic> toJson() => _$HomeDataToJson(this);
}

@JsonSerializable(nullable: false)
class HomeDataMessage {
  final String message;
  final bool status;
  final HomeData data;

  HomeDataMessage({this.message, this.status, this.data});

  factory HomeDataMessage.fromJson(Map<String, dynamic> json) => _$HomeDataMessageFromJson(json);

  Map<String, dynamic> toJson() => _$HomeDataMessageToJson(this);
}
