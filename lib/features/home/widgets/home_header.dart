import 'dart:io';

import 'package:flutter/material.dart';
import 'package:taskati/core/services/shared_pref.dart';
import 'package:taskati/core/style/text_styles.dart';

class HomeHeader extends StatefulWidget {
  const HomeHeader({
    super.key,
  });

  @override
  State<HomeHeader> createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {
  late String name;
  late String path;

  @override
void initState(){
  super.initState();
  getUserData();
}

 void getUserData(){
  name = SharedPref.getString(SharedPref.nameKey);
  path = SharedPref.getString(SharedPref.imageKey);
}


  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 25,
        backgroundImage: FileImage(File(path)),
      ),
      title: Text('Hello!',style: TextStyles.body3.copyWith(fontWeight: FontWeight.w400),),
      subtitle: Text(name,style: TextStyles.body1,),
    );
  }
}