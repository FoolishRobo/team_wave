// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_sports_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllSports _$AllSportsFromJson(Map<String, dynamic> json) {
  return AllSports(
    sports: (json['sports'] as List)
        ?.map(
            (e) => e == null ? null : Sport.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$AllSportsToJson(AllSports instance) => <String, dynamic>{
      'sports': instance.sports,
    };

Sport _$SportFromJson(Map<String, dynamic> json) {
  return Sport(
    idSport: json['idSport'] as String,
    strSport: json['strSport'] as String,
    strFormat: json['strFormat'] as String,
    strSportThumb: json['strSportThumb'] as String,
    strSportThumbGreen: json['strSportThumbGreen'] as String,
    strSportDescription: json['strSportDescription'] as String,
  );
}

Map<String, dynamic> _$SportToJson(Sport instance) => <String, dynamic>{
      'idSport': instance.idSport,
      'strSport': instance.strSport,
      'strFormat': instance.strFormat,
      'strSportThumb': instance.strSportThumb,
      'strSportThumbGreen': instance.strSportThumbGreen,
      'strSportDescription': instance.strSportDescription,
    };
