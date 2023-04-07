import 'package:flutter/material.dart';

class CustomLoadMore extends StatelessWidget {
  const CustomLoadMore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: CircularProgressIndicator()),
    );
  }
}
