import 'package:flutter/material.dart';

class CustomNoInternet extends StatelessWidget {
  final Function() retry;
  const CustomNoInternet({Key? key, required this.retry}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const Text("No internet"),
        ElevatedButton(onPressed: retry, child: const Text("Retry"))
      ]),
    );
  }
}
