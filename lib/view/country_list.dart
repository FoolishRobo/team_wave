import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:team_wave/app_colors.dart';
import 'package:team_wave/view/leagues.dart';

class CountryList extends StatelessWidget {
  final List<String> countries = [
    "India",
    "United States",
    "Australia",
    "China",
    "Argentina",
    "Canada"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: MediaQuery.of(context).size.height / 6,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "The Sports DB",
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height / 4,
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  itemCount: countries.length,
                  itemBuilder: (context, index) {
                    return getCountryUiRepresentation(context,countries[index]);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getCountryUiRepresentation(BuildContext context,String country) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 20),
      child: InkWell(
        onTap: (){
          Navigator.push (
            context,
            MaterialPageRoute(builder: (context) => Leagues(country: country,)),
          );
        },
        child: Container(
          height: 40,
          decoration: BoxDecoration(
            color: AppColors.countryColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  country,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16
                  ),
                ),
                Container(
                  width: 20,
                  child: SvgPicture.asset(
                    "assets/svg/arrow_right.svg",
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
