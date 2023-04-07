import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../assets/app_colors.dart';

class CustomInputDialog extends StatefulWidget {
  final TextEditingController controller;
  final String errorText;
  final int? maxQuantity;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? textInputType;
  final Function(bool) validate;

  const CustomInputDialog({
    Key? key,
    required this.controller,
    required this.errorText,
    this.maxQuantity,
    this.maxLength,
    this.inputFormatters,
    this.textInputType,
    required this.validate,
  }) : super(key: key);

  @override
  State<CustomInputDialog> createState() => _CustomInputDialogState();
}

class _CustomInputDialogState extends State<CustomInputDialog> {
  bool _valid = true;
  String _errorText = "";

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: TextFormField(
        onChanged: (value) {
          setState(() {
            if (widget.maxQuantity != null) {
              if (value.isEmpty) {
                _valid = false;
                _errorText = widget.errorText;
                widget.validate.call(false);
              } else if (value.isNotEmpty &&
                  int.parse(value) > widget.maxQuantity!) {
                _valid = false;
                _errorText = "Maximum quantity is ${widget.maxQuantity}";
                widget.validate.call(false);
              } else {
                _valid = true;
                widget.validate.call(true);
              }
            } else {
              if (value.isEmpty) {
                _valid = false;
                _errorText = widget.errorText;
                widget.validate.call(false);
              } else {
                _valid = true;
                widget.validate.call(true);
              }
            }
          });
        },
        maxLength: widget.maxLength,
        textAlign: TextAlign.center,
        autofocus: true,
        controller: widget.controller,
        keyboardType: widget.textInputType,
        inputFormatters: widget.inputFormatters,
        decoration: InputDecoration(
          errorText: _valid == false ? _errorText : null,
          counterText: widget.maxLength != null ? "" : null,
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.pink),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.pink),
          ),
        ),
      ),
    );
  }
}
