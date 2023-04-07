import 'package:flutter/material.dart';

import '../../controller/new_address_controller.dart';
import 'new_address_detail_section/new_address_detail_section.dart';
import 'new_address_map_section/new_address_map_section.dart';

class NewAddressBody extends StatelessWidget {
  final NewAddressController controller;

  const NewAddressBody({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewAddressMapSection(controller: controller),
        NewAddressDetailSection(controller: controller),
      ],
    );
  }
}
