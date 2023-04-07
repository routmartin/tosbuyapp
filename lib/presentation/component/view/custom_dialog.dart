import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class DialogInterface {
  void closeDialog();
  void closeSnackbar();
}

class _CustomDialogImpl extends DialogInterface {
  @override
  void closeDialog() {
    if (Get.isDialogOpen == true || Get.isBottomSheetOpen == true) {
      Get.back();
    }
  }

  @override
  void closeSnackbar() {
    if (Get.isSnackbarOpen == true) {
      Get.closeAllSnackbars();
    }
  }
}

// ignore: non_constant_identifier_names
final CustomDialog = _CustomDialogImpl();

class ButtonDialogInfo extends StatelessWidget {
  const ButtonDialogInfo(
      {super.key,
      required this.onPressed,
      required this.title,
      required this.color});

  final VoidCallback onPressed;
  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        title,
        style: TextStyle(color: color),
      ),
    );
  }
}
