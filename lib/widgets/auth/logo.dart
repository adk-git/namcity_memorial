import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:namcity_memorial/Utils/utils.dart';
import '../../settings/app_theme.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = Utils.height(context);
    double w = Utils.width(context);

    return Column(
      children: [
        SvgPicture.asset(
          "assets/icons/icon.svg",
          height: 72 * h,
          width: 72 * w,
          color: AppTheme.neutralColor,
        ),
        SizedBox(height: 16 * h),
        Text(
          "Namangan Yodgorliklari",
          style: TextStyle(
            color: AppTheme.neutralColor,
            fontSize: 22 * h,
            fontWeight: FontWeight.w900,
            letterSpacing: 0.5 * w,
            fontFamily: AppTheme.fontFamily,
          ),
        ),
        SizedBox(height: 8 * h),
        Text(
          "Davom etish uchun tizimga kiring",
          style: TextStyle(
            color: AppTheme.greyColor,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.5 * w,
            fontSize: 14 * h,
            fontFamily: AppTheme.fontFamily,
          ),
        )
      ],
    );
  }
}
