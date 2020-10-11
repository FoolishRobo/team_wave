import 'package:json_annotation/json_annotation.dart';


part 'all_sports_model.g.dart';

@JsonSerializable()
class AllSports {
  List<Sport> sports;

  AllSports({this.sports});

  factory AllSports.fromJson(Map<String, dynamic> json) =>_$AllSportsFromJson(json);

  Map<String, dynamic> toJson() => _$AllSportsToJson(this);

}

@JsonSerializable()
class Sport {
  String idSport;
  String strSport;
  String strFormat;
  String strSportThumb;
  String strSportThumbGreen;
  String strSportDescription;

  Sport({this.idSport, this.strSport, this.strFormat, this.strSportThumb, this.strSportThumbGreen, this.strSportDescription});

  factory Sport.fromJson(Map<String, dynamic> json) =>_$SportFromJson(json);

  Map<String, dynamic> toJson() => _$SportToJson(this);

}