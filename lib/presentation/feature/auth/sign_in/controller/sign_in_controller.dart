import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tostinh/domain/entities/body/login_request_body.dart';
import 'package:tostinh/domain/usecase/auth_usecase.dart';
import 'package:tostinh/routes/app_routes.dart';

class SignInController extends GetxController {
  final AuthUseCase _authUseCase = Get.find();
  final textInputPhoneController = TextEditingController();
  String? errorTextInput = null;

  @override
  void onInit() {
    textInputPhoneController.text = "010101010";
    textInputPhoneController.addListener(() {
      if (_validateInput()) {
        errorTextInput = null;
        update();
      }
    });
    super.onInit();
  }

  void requestOtp() async {
    if (!_validateInput()) {
      makeErrorInput();
      return;
    }
    FocusManager.instance.primaryFocus?.unfocus();
    Get.toNamed(AppRoutes.pinCode, arguments: LoginRequestBody(phone: textInputPhoneController.text, pin: ""));
  }

  bool _validateInput() {
    if (textInputPhoneController.text.isEmpty) {
      return false;
    }
    return true;
  }

  void makeErrorInput() {
    errorTextInput = "Please input phone number";
    update();
  }
}
