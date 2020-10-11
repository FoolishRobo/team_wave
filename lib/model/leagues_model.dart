import 'package:json_annotation/json_annotation.dart';

part 'leagues_model.g.dart';

@JsonSerializable()
class Leagues {
  List<League> countrys;

  Leagues({this.countrys});

  factory Leagues.fromJson(Map<String, dynamic> json) =>
      _$LeaguesFromJson(json);

  Map<String, dynamic> toJson() => _$LeaguesToJson(this);

}

@JsonSerializable()
class League {
  String idLeague;
  String idSoccerXML;
  String idAPIfootball;
  String strSport;
  String strLeague;
  String strLeagueAlternate;
  String strDivision;
  String idCup;
  String strCurrentSeason;
  String intFormedYear;
  String dateFirstEvent;
  String strGender;
  String strCountry;
  String strWebsite;
  String strFacebook;
  String strTwitter;
  String strYoutube;
  String strRSS;
  String strDescriptionEN;

  String strDescriptionDE;
  String strDescriptionFR;
  String strDescriptionIT;
  String strDescriptionCN;
  String strDescriptionJP;
  String strDescriptionRU;
  String strDescriptionES;
  String strDescriptionPT;
  String strDescriptionSE;
  String strDescriptionNL;
  String strDescriptionHU;
  String strDescriptionNO;
  String strDescriptionPL;
  String strDescriptionIL;

  String strFanart1;
  String strFanart2;
  String strFanart3;
  String strFanart4;

  String strBanner;
  String strBadge;
  String strLogo;
  String strPoster;
  String strTrophy;
  String strNaming;
  String strComplete;
  String strLocked;

  League({
    this.strSport,
    this.dateFirstEvent,
    this.idAPIfootball,
    this.idCup,
    this.idLeague,
    this.idSoccerXML,
    this.intFormedYear,
    this.strBadge,
    this.strBanner,
    this.strComplete,
    this.strCountry,
  this.strCurrentSeason,
  this.strDescriptionCN,
  this.strDescriptionDE,
  this.strDescriptionEN,
  this.strDescriptionES,
  this.strDescriptionFR,
  this.strDescriptionHU,
  this.strDescriptionIL,
  this.strDescriptionIT,
  this.strDescriptionJP,
  this.strDescriptionNL,
  this.strDescriptionNO,
  this.strDescriptionPL,
  this.strDescriptionPT,
  this.strDescriptionRU,
  this.strDescriptionSE,
  this.strDivision,
  this.strFacebook,
  this.strFanart1,
  this.strFanart2,
  this.strFanart3,
  this.strFanart4,
  this.strGender,
  this.strLeague,
  this.strLeagueAlternate,
  this.strLocked,
  this.strLogo,
  this.strNaming,
  this.strPoster,
  this.strRSS,
  this.strTrophy,
  this.strTwitter,
  this.strWebsite,
  this.strYoutube,
  });

  factory League.fromJson(Map<String, dynamic> json) =>
      _$LeagueFromJson(json);

  Map<String, dynamic> toJson() => _$LeagueToJson(this);
}
