// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeData _$HomeDataFromJson(Map<String, dynamic> json) {
  return HomeData(
    Cases: json['Cases'] as int,
    Deaths: json['Deaths'] as int,
    Recovered: json['Recovered'] as int,
    Updated: json['Updated'] as int,
    UpdatedAt: json['UpdatedAt'] as String,
    Active: json['Active'] as int,
  );
}

Map<String, dynamic> _$HomeDataToJson(HomeData instance) => <String, dynamic>{
      'Cases': instance.Cases,
      'Deaths': instance.Deaths,
      'Recovered': instance.Recovered,
      'Updated': instance.Updated,
      'UpdatedAt': instance.UpdatedAt,
      'Active': instance.Active,
    };

HomeDataMessage _$HomeDataMessageFromJson(Map<String, dynamic> json) {
  return HomeDataMessage(
    message: json['message'] as String,
    status: json['status'] as bool,
    data: HomeData.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$HomeDataMessageToJson(HomeDataMessage instance) =>
    <String, dynamic>{
      'message': instance.message,
      'status': instance.status,
      'data': instance.data,
    };
