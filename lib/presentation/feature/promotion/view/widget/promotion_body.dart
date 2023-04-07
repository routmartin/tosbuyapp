import 'package:flutter/material.dart';

import '../../controller/promotion_controller.dart';
import 'promotion_section/promotion_list_section.dart';

class PromotionBody extends StatelessWidget {
  final PromotionController controller;
  const PromotionBody({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PromotionListSection(controller: controller);
  }
}
