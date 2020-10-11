import 'package:flutter/material.dart';
import 'package:team_wave/model/all_sports_model.dart';
import 'package:team_wave/model/leagues_model.dart';
import 'package:team_wave/service/endpoints.dart';
import 'package:team_wave/service/service.dart';


class LeaguesVm extends ChangeNotifier{
  bool isLoading = true;
  AllSports allSports;
  Leagues leagues;
  Map<String,Sport> mapAllSports={};


  Future<void> fetchAllSports()async{

    notifyListeners();
    allSports = await getHttpsServiceFuture(AllSportsApi.allSports, responseSerializer: (json)=>AllSports.fromJson(json));
    allSports.sports.forEach((sports) {
      mapAllSports["${sports.strSport}"] = sports;
    });
  }

  Future<void> fetchLeagues(String country)async{
    isLoading = true;
    notifyListeners();
    Map<String, String> querryParam = {
      "c" : country,
    };
    await fetchAllSports();
    leagues = await getHttpsServiceFuture(SearchLeaguesApi.searchLeagues ,queryParams: querryParam, responseSerializer: (json)=>Leagues.fromJson(json));
//    print("leagues = ${leagues.countrys[0].toJson()}");
    isLoading = false;
    notifyListeners();
  }

  Future<void> searchLeagues(String country, String sports)async{
    isLoading = true;
    notifyListeners();
    Map<String, String> querryParam = {
      "c" : country,
      "s" : sports
    };
    leagues = await getHttpsServiceFuture(SearchLeaguesApi.searchLeagues ,queryParams: querryParam, responseSerializer: (json)=>Leagues.fromJson(json));
//    print("leagues = ${leagues.countrys[0].toJson()}");
    isLoading = false;
    notifyListeners();

  }

}