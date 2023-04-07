import 'package:get/get.dart';
import 'package:tostinh/presentation/feature/order_status/controller/order_status_controller.dart';

class OrderStatusBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(OrderStatusController());
  }
}
