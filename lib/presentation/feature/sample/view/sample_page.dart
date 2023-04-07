import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:tostinh/presentation/feature/sample/controller/sample_controller.dart';
import 'package:tostinh/presentation/feature/sample/view/widget/sample_app_bar.dart';
import 'package:tostinh/presentation/feature/sample/view/widget/sample_body.dart';

class SamplePage extends StatelessWidget {
  const SamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SampleController>(
      init: SampleController(),
      builder: (controller) => Scaffold(
        appBar: SampleAppBar(controller: controller),
        body: SampleBody(
          controller: controller,
        ),
      ),
    );
  }
}
