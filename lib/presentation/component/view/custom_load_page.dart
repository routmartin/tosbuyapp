import 'package:flutter/material.dart';

class CustomLoadPage extends StatelessWidget {
  const CustomLoadPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
