import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:tostinh/presentation/feature/notification/controller/notification_controller.dart';
import 'package:tostinh/presentation/feature/notification/view/widget/notification_app_bar.dart';
import 'package:tostinh/presentation/feature/notification/view/widget/notification_body.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NotificationController>(
      init: NotificationController(),
      builder: (controller) {
        return Scaffold(
          appBar: NotificationAppBar(),
          body: NotificationBody(controller: controller,),
        );
      },
    );
  }
}
