import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';
import 'package:taskati/core/constants/app_assets.dart';
import 'package:taskati/core/functions/navigations.dart';
import 'package:taskati/core/services/shared_pref.dart';
import 'package:taskati/core/style/app_colors.dart';
import 'package:taskati/core/style/text_styles.dart';
import 'package:taskati/features/complete_profile/pages/complete_profile_page.dart';
import 'package:taskati/features/home/page/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    bool isUploaded = SharedPref.getBool(SharedPref.isUploadedKey);
    Future.delayed(Duration(seconds: 3, milliseconds: 500), () {
      if (!mounted) return;
      if (isUploaded) {
        replaceWith(context, HomeScreen());
      } else {
        replaceWith(context, CompleteProfilePage());
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(AppAssets.logoJson),
            Gap(20),
            Text(
              'Taskati',
              style: TextStyles.h1.copyWith(color: AppColors.primary),
            ),
            Gap(18),
            Text(
              "It's time to get organized",
              style: TextStyles.body3.copyWith(
                color: AppColors.secondary,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
