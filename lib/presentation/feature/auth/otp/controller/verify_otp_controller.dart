import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tostinh/assets/app_locals.dart';
import 'package:tostinh/domain/usecase/auth_usecase.dart';
import 'package:tostinh/routes/app_routes.dart';
import 'package:tostinh/utils/extenstion/dialog_extension.dart';

import '../../../../../assets/app_constants.dart';
import '../../../../../base/base_result.dart';
import '../../../../../domain/entities/body/login_request_body.dart';

class VerifyOtpController extends GetxController {
  final AuthUseCase _authUseCase = Get.find();
  final LoginRequestBody loginRequestBody = Get.arguments;

  int startTime = 60;
  bool isExpiredNow = false;
  Timer? _timer;
  final TextEditingController txtOtpCodeController = TextEditingController();

  void _awaitOtp() {
    Future.delayed(const Duration(seconds: 2), () {
      txtOtpCodeController.text = "1234";
      signInWithPhoneNumber();
    });
  }

  void showDialogInfo({required String title, required String message}) {
    CustomDialog.showDialogInfo(
      title: title,
      content: message,
      actions: [
        ButtonDialogInfo(
          onPressed: () {
            CustomDialog.closeDialog();
          },
          title: AppLocals.ok.tr,
          color: Colors.blue,
        ),
      ],
    );
  }

  void signInWithPhoneNumber() async {
    if (!_validateInputOTP()) {
      return;
    }
    CustomDialog.showDialogLoading();
    final box = GetStorage();
    final result = await _authUseCase.loginWithPhoneNumber(body: loginRequestBody);
    CustomDialog.closeDialog();
    switch (result.requestStatus!) {
      case RequestStatus.success:
        box.write(
          AppConstants.keyToken,
          result.successResponse?.data?.accessToken,
        );
        box.write(
          AppConstants.keyRefreshToken,
          result.successResponse?.data?.refreshToken,
        );
        box.write(AppConstants.keyRoute, AppRoutes.navigation);
        Get.offAllNamed(AppRoutes.navigation);
        break;
      case RequestStatus.noInternet:
        showDialogInfo(
          title: AppLocals.loginFailed.tr,
          message: AppLocals.stateNoInternetDescription.tr,
        );
        break;
      case RequestStatus.failed:
        showDialogInfo(
          title: AppLocals.loginFailed.tr,
          message: AppLocals.stateFailedDescription.tr,
        );
        break;
      case RequestStatus.somethingWrong:
        showDialogInfo(
          title: AppLocals.loginFailed.tr,
          message: AppLocals.stateSomethingWrongDescription.tr,
        );
        break;
    }
  }

  bool _validateInputOTP() {
    if (txtOtpCodeController.text.isNotEmpty) {
      return true;
    } else {
      CustomDialog.showSnackbar(message: AppLocals.pleaseEnterOTP.tr);
      return false;
    }
  }

  Future<RequestStatus> resendOTP() async {
    await Future.delayed(Duration(seconds: 6));
    return RequestStatus.success;
  }

  @override
  void onReady() {
    _awaitOtp();
    super.onReady();
  }

  @override
  void onClose() {
    txtOtpCodeController.clear();
    super.onClose();
  }

  void startTimer() {
    isExpiredNow = false;
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (startTime == 0) {
          timer.cancel();
        } else {
          startTime--;
          if (startTime == 0) isExpiredNow = true;
        }
        update(['counter']);
      },
    );
  }

  _resetTimer() {
    startTime = 60;
    _timer!.cancel();
    update(['counter']);
  }
}
