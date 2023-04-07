import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/new_address_controller.dart';
import 'widget/new_address_app_bar.dart';
import 'widget/new_address_body.dart';

class NewAddressPage extends StatelessWidget {
  const NewAddressPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewAddressController>(
      init: NewAddressController(),
      builder: (controller) => Scaffold(
        appBar: NewAddressAppBar(controller: controller),
        body: NewAddressBody(controller: controller),
      ),
    );
  }
}
