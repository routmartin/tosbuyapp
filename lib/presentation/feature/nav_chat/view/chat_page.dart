import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:tostinh/assets/app_styles.dart';
import 'package:tostinh/presentation/feature/nav_chat/controller/chat_controller.dart';
import 'package:visibility_detector/visibility_detector.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatController>(
      builder: (controller) {
        return VisibilityDetector(
          key: const Key("Chat"),
          onVisibilityChanged: controller.onVisibilityChanged,
          child: Scaffold(
            appBar: AppBar(
              title: const Text("Chat"),
              centerTitle: true,
              backgroundColor: kPrimaryWhite(context: context),
              systemOverlayStyle: const SystemUiOverlayStyle(
                statusBarColor: Colors.transparent,
                systemNavigationBarColor: Colors.black,
                statusBarIconBrightness: Brightness.dark,
                systemNavigationBarIconBrightness: Brightness.dark,
              ),
            ),
            body: const Center(child: Text("Body")),
          ),
        );
      },
    );
  }
}
