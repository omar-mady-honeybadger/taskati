import 'dart:io';

import 'package:flutter/material.dart';
import 'package:taskati/core/constants/app_assets.dart';
import 'package:taskati/core/services/shared_pref.dart';
import 'package:taskati/core/style/text_styles.dart';
import 'package:taskati/features/complete_profile/pages/complete_profile_page.dart';

class HomeHeader extends StatefulWidget {
  const HomeHeader({super.key});

  @override
  State<HomeHeader> createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {
  late String name;
  late String path;

  @override
  void initState() {
    super.initState();
    getUserData();
  }

  void getUserData() {
    name = SharedPref.getString(SharedPref.nameKey);
    path = SharedPref.getString(SharedPref.imageKey);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CompleteProfilePage()),
        );
        setState(() {
          getUserData();
        });
      },
      child: ListTile(
        leading: ClipOval(
          child: path.isEmpty
              ? Image.asset(AppAssets.userPng, height: 50, width: 50)
              : Image.file(
                  height: 50,
                  width: 50,
                  fit: BoxFit.cover,
                  File(path),
                  errorBuilder: (context, error, stackTrace) =>
                      Image.asset(AppAssets.userPng, height: 50, width: 50),
                ),
        ),
        title: Text(
          'Hello!',
          style: TextStyles.body3.copyWith(fontWeight: FontWeight.w400),
        ),
        subtitle: Text(name, style: TextStyles.body1),
      ),
    );
  }
}
