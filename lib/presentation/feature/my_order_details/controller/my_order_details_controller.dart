import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class MyOrderDetailsController extends GetxController {
  final ImagePicker _picker = ImagePicker();
  List<String> images = [];

  Future<void> pickupImage() async {
    final result = await _picker.pickMultiImage();
    result.forEach((element) {
      images.add(element.path);
      print("checkStatus image = ${element.path}");
    });
    update();
  }

  void previewImage() {}
}
