import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taskati/core/constants/app_assets.dart';
import 'package:taskati/core/functions/navigations.dart';
import 'package:taskati/core/services/shared_pref.dart';
import 'package:taskati/core/style/app_colors.dart';
import 'package:taskati/core/style/text_styles.dart';
import 'package:taskati/core/widgets/custom_text_form_field.dart';
import 'package:taskati/core/widgets/dialogs.dart';
import 'package:taskati/core/widgets/main_button.dart';
import 'package:taskati/core/widgets/tab_button.dart';
import 'package:taskati/features/home/page/home_screen.dart';

class CompleteProfilePage extends StatefulWidget {
  const CompleteProfilePage({super.key});

  @override
  State<CompleteProfilePage> createState() => _CompleteProfilePageState();
}

class _CompleteProfilePageState extends State<CompleteProfilePage> {
  String? path;

  @override
  void initState() {
    super.initState();
    nameController.text = SharedPref.getString(SharedPref.nameKey);
    path = SharedPref.getString(SharedPref.imageKey);
  }

  final nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Navigator.canPop(context)
            ? IconButton(
                onPressed: () => Navigator.pop(context),
                icon: SvgPicture.asset(AppAssets.arrowLeftSvg),
              )
            : null,
        title: Text(
          SharedPref.getBool(SharedPref.isUploadedKey)
              ? 'Profile'
              : 'Complete Your Profile',
          style: TextStyles.h1,
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: Padding(
                padding: const EdgeInsets.all(22.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Profile Image',
                          style: TextStyles.body4.copyWith(
                            color: AppColors.secondary,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    Gap(20),
                    Stack(
                      children: [
                        CircleAvatar(
                          radius: 82,
                          backgroundColor: Colors.white,
                          backgroundImage: (path != null)
                              ? FileImage(File(path!))
                              : AssetImage(AppAssets.userPng),
                        ),
                        if (path != null) ...[
                          Positioned(
                            right: 10,
                            bottom: 10,
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  path = null;
                                });
                              },
                              child: CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 16,
                                child: Icon(
                                  Icons.delete_rounded,
                                  color: AppColors.error,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ],
                    ),
                    Gap(34),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TabButton(
                          text: 'From Camera',
                          onPress: () async {
                            var image = await ImagePicker().pickImage(
                              source: ImageSource.camera,
                            );
                            if (image != null) {
                              setState(() {
                                path = image.path;
                              });
                            }
                          },
                        ),
                        Gap(12),
                        TabButton(
                          text: 'From Gallery',
                          onPress: () {
                            ImagePicker()
                                .pickImage(source: ImageSource.gallery)
                                .then((image) {
                                  if (image != null) {
                                    setState(() {
                                      path = image.path;
                                    });
                                  }
                                });
                          },
                        ),
                      ],
                    ),
                    Gap(45),
                    CustomTextFormField(
                      controller: nameController,
                      label: 'Your Name',
                      hintText: 'Enter Your Name',
                      keyboardType: TextInputType.name,
                    ),
                    Gap(100),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(22.0),
        child: MainButton(
          text: SharedPref.getBool(SharedPref.isUploadedKey)
              ? 'Save'
              : 'Let’s Start !',
          onPress: () {
            if (path != null && nameController.text.isNotEmpty) {
              SharedPref.setUserInfo(nameController.text, path!);
              SharedPref.setBool(SharedPref.isUploadedKey, true);
              if (Navigator.canPop(context)) {
                Navigator.pop(context);
              } else {
                replaceWith(context, const HomeScreen());
              }
            } else if (path != null && nameController.text.isEmpty) {
              showErrorDialog(context, 'Please enter your name');
            } else if (path == null && nameController.text.isNotEmpty) {
              showErrorDialog(context, 'Please upload your image');
            } else {
              showErrorDialog(
                context,
                'Please upload your image and enter your name',
              );
            }
          },
        ),
      ),
    );
  }
}
