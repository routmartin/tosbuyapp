import 'package:flutter/material.dart';

class CustomAnimatedSwitcher extends StatelessWidget {
  const CustomAnimatedSwitcher({Key? key, required this.child})
      : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 400),
      transitionBuilder: (Widget child, Animation<double> animation) {
        return ScaleTransition(scale: animation, child: child);
      },
      child: child,
    );
  }
}
