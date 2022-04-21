import 'package:flutter/material.dart';
import 'package:namcity_memorial/Utils/utils.dart';
import 'package:namcity_memorial/settings/app_theme.dart';
import 'package:namcity_memorial/widgets/auth/email_widget.dart';
import 'package:namcity_memorial/widgets/auth/logo.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = Utils.height(context);
    double w = Utils.width(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppTheme.whiteColor,
        body: ListView(
          children: [
            SizedBox(height: 64 * h),
            const LogoWidget(),
            SizedBox(height: 32 * h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32 * w),
              child: const EmailWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
