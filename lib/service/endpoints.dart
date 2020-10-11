

class Api {
  static const baseUrl = "https://www.thesportsdb.com";
}

class AllSportsApi{
  static const apiView = "/api/v1/json/1";

  static const allSports = apiView + "/all_sports.php";
}

class SearchLeaguesApi{
  static const apiView = "/api/v1/json/1";

  static const searchLeagues = apiView + "/search_all_leagues.php";
}
