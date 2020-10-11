import 'package:flutter/material.dart';
import 'package:team_wave/app_colors.dart';
import 'package:team_wave/view/country_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: AppColors.background,
      ),
      home: CountryList(),
    );
  }
}
