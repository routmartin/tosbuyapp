import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class EditProfileController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final TextEditingController txtFirstName =
      TextEditingController(text: 'James');
  final TextEditingController txtLastName = TextEditingController(text: 'Bond');
  final TextEditingController txtPhonehoneNumber =
      TextEditingController(text: '+855 012 555 666');
  final TextEditingController txtEmail = TextEditingController();
}
