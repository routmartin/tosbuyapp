import 'package:flutter/material.dart';
import 'package:tostinh/presentation/feature/stores/controller/store_controller.dart';

import 'store_section/store_list_section.dart';

class StoreBody extends StatelessWidget {
  final StoreController controller;
  const StoreBody({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreListSection(
      controller: controller,
    );
  }
}
