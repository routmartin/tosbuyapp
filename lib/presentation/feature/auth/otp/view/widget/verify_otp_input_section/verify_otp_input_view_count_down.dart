import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tostinh/assets/app_colors.dart';
import 'package:tostinh/assets/app_locals.dart';
import 'package:tostinh/assets/app_styles.dart';
import 'package:tostinh/presentation/component/view/custom_button_linear.dart';
import 'package:tostinh/utils/extenstion/dialog_extension.dart';

import '../../../../../../../base/base_result.dart';
import '../../../controller/verify_otp_controller.dart';
import 'verify_otp_input_state_count_down.dart';

class VerifyOtpInputViewCountDown extends StatefulWidget {
  final VerifyOtpController controller;
  const VerifyOtpInputViewCountDown({Key? key, required this.controller})
      : super(key: key);

  @override
  State<VerifyOtpInputViewCountDown> createState() =>
      _VerifyOtpInputViewCountDownState();
}

class _VerifyOtpInputViewCountDownState
    extends State<VerifyOtpInputViewCountDown> {
  VerifyOtpController get controller => widget.controller;

  VerifyOtpInputStateCountDown stateCountDown =
      VerifyOtpInputStateCountDown.countDown;

  int countDownSec = 60;

  void startTimer() {
    Timer.periodic(
      Duration(seconds: 1),
      (Timer timer) {
        if (countDownSec == 0) {
          timer.cancel();
          setState(() {
            stateCountDown = VerifyOtpInputStateCountDown.resend;
          });
        } else {
          setState(() {
            countDownSec -= 1;
          });
        }
      },
    );
  }

  void showDialogResendFailed(String message) {
    CustomDialog.showDialogInfo(
      title: AppLocals.resendFailed.tr,
      content: message,
    );
  }

  Widget stateWidget() {
    print("checkStatus = $stateCountDown");
    switch (stateCountDown) {
      case VerifyOtpInputStateCountDown.countDown:
        return Text(
          "${countDownSec}s",
          style: kTextTitleNormal(context: context)?.copyWith(
            color: AppColors.pink,
          ),
        );
      case VerifyOtpInputStateCountDown.resend:
        return CustomButtonLinear(
          onPressed: () async {
            CustomDialog.showDialogLoading();
            final status = await controller.resendOTP();
            CustomDialog.closeDialog();
            switch (status) {
              case RequestStatus.success:
                stateCountDown = VerifyOtpInputStateCountDown.countDown;
                countDownSec = 60;
                startTimer();
                break;
              case RequestStatus.noInternet:
                stateCountDown = VerifyOtpInputStateCountDown.resend;
                showDialogResendFailed(AppLocals.stateNoInternetDescription.tr);
                break;
              case RequestStatus.failed:
                stateCountDown = VerifyOtpInputStateCountDown.resend;
                showDialogResendFailed(AppLocals.stateFailedDescription.tr);
                break;
              case RequestStatus.somethingWrong:
                stateCountDown = VerifyOtpInputStateCountDown.resend;
                showDialogResendFailed(
                  AppLocals.stateSomethingWrongDescription.tr,
                );
                break;
            }
            setState(() {});
          },
          child: Text(AppLocals.resend.tr),
        );
    }
  }

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return stateWidget();
  }
}
