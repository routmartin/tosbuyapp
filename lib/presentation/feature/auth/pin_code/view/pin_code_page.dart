import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:tostinh/assets/app_locals.dart';
import 'package:tostinh/presentation/component/view/custom_app_bar.dart';
import 'package:tostinh/presentation/feature/auth/pin_code/controller/pincode_controller.dart';
import 'widget/pin_code_number_pad.dart';
import 'widget/pin_code_spere_wrapper.dart';

class PinCodePage extends StatelessWidget {
  const PinCodePage({
    Key? key,
    this.header = AppLocals.enterPinCode,
    this.onEnterPinComplete,
    this.actionTitleRight,
    this.actionLeft,
  }) : super(key: key);

  final String header;
  final Function(num pinCode)? onEnterPinComplete;
  final VoidCallback? actionTitleRight;
  final VoidCallback? actionLeft;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        elevation: 0,
        isHideLeading: true,
        onTapLeft:null,
        title: '',
      ),
      body: SafeArea(
        child: GetBuilder<PinCodeController>(
            init: PinCodeController(),
            builder: (controller) {
              return Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  PinCodeSpereWrapper(
                    title: header.tr,
                    controller: controller,
                  ),
                  PinCodeNumPadWrapper(controller: controller),
                ],
              );
            }),
      ),
    );
  }
}
