import 'package:get/get.dart';
import 'package:visibility_detector/visibility_detector.dart';

class ChatController extends GetxController {
  ///When visibleFraction equal 1 it's mean this page have full visible
  ///If equal 0 it's mean this page is close and navigate to another page.
  void onVisibilityChanged(VisibilityInfo info) {}
}
