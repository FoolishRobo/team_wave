import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:team_wave/app_colors.dart';
import 'package:team_wave/model/all_sports_model.dart';
import 'package:team_wave/model/leagues_model.dart';
import 'package:team_wave/view_model/leagues_vm.dart';
import 'package:url_launcher/url_launcher.dart';

class Leagues extends StatefulWidget {
  final String country;
  Leagues({@required this.country});
  @override
  _LeaguesState createState() => _LeaguesState();
}

class _LeaguesState extends State<Leagues> {
  Timer _debounce;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
            ),
          ),
          title: Text(
            widget.country,
          ),
        ),
        body: ChangeNotifierProvider<LeaguesVm>(
          create: (_) => LeaguesVm(),
          child: Consumer<LeaguesVm>(
            builder: (_, vm, child) {
              if (vm.allSports == null) {
//                vm.fetchAllSports();
                vm.fetchLeagues(widget.country);
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              return Padding(
                padding:
                    const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
                child: Column(
                  children: [
                    searchBar(vm),
                    vm.isLoading
                        ? Container(
                      height: 200,
                            child: Center(
                              child: CircularProgressIndicator(),
                            ),
                          )
                        : vm.leagues.countrys!=null?Expanded(
                            child: Container(
                              child: ListView.builder(
                                itemCount: vm.leagues.countrys.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: EdgeInsets.only(
                                        top: index == 0 ? 12 : 0),
                                    child: leagueUI(
                                        vm.leagues.countrys[index],
                                        vm.mapAllSports[vm
                                            .leagues.countrys[index].strSport]),
                                  );
                                },
                              ),
                            ),
                          ):Container(
                      height: 200,
                      child: Center(
                        child: Text("No Result"),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ));
  }

  Widget leagueUI(League league, Sport sport) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Container(
        height: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 0,
              bottom: 0,
              left: 0,
              right: 0,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  sport.strSportThumb,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.width * 0.8,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: LinearGradient(
                  colors: [
                    const Color(0x55000000),
                    const Color(0x55000000),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 12,
              left: 12,
              child: Text(
                league.strLeague,
                style: TextStyle(
                    color: AppColors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ),
            league.strLogo != null
                ? Positioned(
                    right: 12,
                    top: 40,
                    child: Container(
                      height: 40,
                      child: Image.network(league.strLogo),
                    ),
                  )
                : SizedBox(),
            Positioned(
              right: 98,
              bottom: 12,
              child: league.strTwitter != null
                  ? InkWell(
                      onTap: () {
                        print("Twitter");
                        _launchURL(league.strTwitter);
                      },
                      child: Container(
                        height: 28,
                        child: SvgPicture.asset(
                          "assets/svg/twitter.svg",
                          color: AppColors.white,
                        ),
                      ),
                    )
                  : SizedBox(),
            ),
            Positioned(
              right: 60,
              bottom: 12,
              child: league.strFacebook != null
                  ? InkWell(
                      onTap: () {
                        print("Facebook");
                        _launchURL(league.strFacebook);
                      },
                      child: Container(
                        height: 28,
                        child: SvgPicture.asset(
                          "assets/svg/facebook.svg",
                          color: AppColors.white,
                        ),
                      ),
                    )
                  : SizedBox(),
            ),
          ],
        ),
      ),
    );
  }

  _launchURL(String URL) async {
    String url = "https://" + URL;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Widget searchBar(LeaguesVm vm) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Color.fromRGBO(0, 0, 0, 0.1)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Center(
          child: TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "Search leagues...",
            ),
            onChanged: (value) {
              if (_debounce?.isActive ?? false) _debounce.cancel();
              _debounce = Timer(const Duration(milliseconds: 500), () {
                if (value.length > 0) {
                  vm.searchLeagues(widget.country, value);
                } else {
                  vm.fetchLeagues(widget.country);
                }
              });
            },
          ),
        ),
      ),
    );
  }
}
