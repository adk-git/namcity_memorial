import 'package:flutter/material.dart';
import 'package:namcity_memorial/Utils/utils.dart';
import 'package:namcity_memorial/settings/app_theme.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    double h = Utils.height(context);
    double w = Utils.width(context);

    return Scaffold(
      backgroundColor: AppTheme.whiteColor,
      body: ListView(
        children: [

        ],
      ),
    );
  }
}
