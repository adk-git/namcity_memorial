import 'package:flutter/material.dart';
import 'package:namcity_memorial/Utils/utils.dart';
import 'package:namcity_memorial/settings/app_theme.dart';
import 'package:namcity_memorial/ui/main_screen/main_screen.dart';

class EmailWidget extends StatelessWidget {
  const EmailWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = Utils.height(context);
    double w = Utils.width(context);

    return Form(
      child: Column(
        children: [
          TextFormField(
            style: TextStyle(
              fontFamily: AppTheme.fontFamily,
              fontSize: 18 * h,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.5 * w,
              color: AppTheme.greyColor,
            ),
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16 * w),
                borderSide: BorderSide(
                  color: AppTheme.greyColor,
                  width: 1 * h,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppTheme.neutralColor,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(16 * w),
                ),
              ),
              prefixIcon: Icon(
                Icons.email,
                color: AppTheme.neutralColor,
              ),
              labelText: 'Username',
              labelStyle: TextStyle(
                color: AppTheme.blackColor,
                fontSize: 18 * h,
              ),
            ),
            keyboardType: TextInputType.emailAddress,
            cursorColor: AppTheme.blackColor,
          ),
          SizedBox(height: 16 * h),
          TextFormField(
            style: TextStyle(
              fontFamily: AppTheme.fontFamily,
              fontSize: 18 * h,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.5 * w,
              color: AppTheme.neutralColor,
            ),
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16 * w),
                borderSide: BorderSide(
                  color: AppTheme.greyColor,
                  width: 1 * h,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppTheme.neutralColor,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(16 * w),
                ),
              ),
              prefixIcon: Icon(
                Icons.lock,
                color: AppTheme.neutralColor,
              ),
              labelText: 'Password',
              labelStyle: TextStyle(
                color: AppTheme.blackColor,
                fontSize: 18 * h,
              ),
            ),
            keyboardType: TextInputType.visiblePassword,
            cursorColor: AppTheme.blackColor,
          ),
          SizedBox(height: 32 * h),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MainScreen(),
                ),
              );
            },
            child: const Center(
              child: Text("Sign In"),
            ),
          ),
        ],
      ),
    );
  }
}
