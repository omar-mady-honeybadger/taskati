import 'dart:io';

import 'package:flutter/material.dart';
import 'package:taskati/core/constants/app_assets.dart';
import 'package:taskati/core/style/themes.dart';
import 'package:taskati/features/splash/splash_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppThemes.lightTheme,
      builder: (context, child) {
        return SafeArea(
          top: false,
          bottom: Platform.isAndroid,
          child: Scaffold(
            body: Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: Colors.white,
                ),
                Image.asset(
                  AppAssets.bgPng,
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
                child!,
              ],
            ),
          ),
        );
      },
      home: const SplashScreen(),
    );
  }
}
