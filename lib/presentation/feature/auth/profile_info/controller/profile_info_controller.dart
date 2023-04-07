import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tostinh/domain/entities/body/register_request_body.dart';
import 'package:tostinh/domain/usecase/auth_usecase.dart';

class ProfileInfoController extends GetxController {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  final AuthUseCase _authUseCase = Get.find();

  String? errorFirstName;
  String? errorLastName;
  String? errorPhoneNumber;
  String? errorEmail;

  @override
  void onInit() {
    firstNameController.addListener(() {
      if (firstNameController.text.isNotEmpty) {
        if (errorFirstName != null) {
          errorFirstName = null;
          update();
        }
      }
    });
    lastNameController.addListener(() {
      if (lastNameController.text.isNotEmpty) {
        if (errorLastName != null) {
          errorFirstName = null;
          update();
        }
      }
    });
    phoneNumberController.addListener(() {
      if (phoneNumberController.text.isNotEmpty) {
        if (errorPhoneNumber != null) {
          errorPhoneNumber = null;
          update();
        }
      }
    });
    emailController.addListener(() {
      if (emailController.text.isNotEmpty) {
        if (errorEmail != null) {
          errorEmail = null;
          update();
        }
      }
    });
    super.onInit();
  }

  bool _validateFirstName() {
    if (firstNameController.text.isEmpty) {
      return false;
    }
    return true;
  }

  bool _validateLastName() {
    if (lastNameController.text.isEmpty) {
      return false;
    }
    return true;
  }

  bool _validatePhoneNumber() {
    if (phoneNumberController.text.isEmpty) {
      return false;
    }
    if (phoneNumberController.text.isPhoneNumber == false) {
      errorPhoneNumber = null;
      return false;
    }
    return true;
  }

  bool _validateEmail() {
    if (emailController.text.isEmpty) {
      return false;
    }
    if (emailController.text.isEmail == false) {
      return false;
    }
    return true;
  }

  void next() {
    if (formKey.currentState!.validate()) {
      final body = RegisterRequestBody(
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        phone: phoneNumberController.text,
        pin: "",
        image: "",
        gender: "",
        dob: "",
      );
      _authUseCase.register(body: body);
    }
  }
}
