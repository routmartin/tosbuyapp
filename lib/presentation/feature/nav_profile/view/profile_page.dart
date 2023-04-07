import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:tostinh/assets/app_styles.dart';

import '../controller/profile_controller.dart';
import 'widget/profile_body.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      builder: (controller) {
        return AnnotatedRegion<SystemUiOverlayStyle>(
          value: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
          ),
          child: Scaffold(
            backgroundColor: kPrimaryWhite(context: context),
            body: ProfileBody(controller: controller),
          ),
        );
      },
    );
  }
}
