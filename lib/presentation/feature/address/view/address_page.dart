import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tostinh/assets/app_styles.dart';
import 'package:tostinh/presentation/feature/address/controller/address_controller.dart';

import 'widget/address_app_bar.dart';
import 'widget/address_body_page.dart';

class AddressPage extends StatelessWidget {
  const AddressPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddressController>(
      init: AddressController(),
      builder: (controller) => Scaffold(
        backgroundColor: kPrimaryContainerWhiteGray(context: context),
        appBar: const AddressAppBar(),
        body: AddressBodyPage(controller: controller),
      ),
    );
  }
}
