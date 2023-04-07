import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tostinh/domain/entities/response/address_response.dart';

import '../../../../domain/entities/response/payment_method_response.dart';
import '../../../../routes/app_routes.dart';

class PaymentController extends GetxController {
  final TextEditingController storeCouponCodeController =
      TextEditingController();
  final TextEditingController couponCodeController = TextEditingController();

  bool validStoreCouponCode = false;
  bool validCouponCode = false;

  Address? shippingAddress;
  PaymentMethod? paymentMethod;

  void validateStoreCouponCode(bool value) {
    validStoreCouponCode = value;
    update();
  }

  void validateCouponCode(bool value) {
    validCouponCode = value;
    update();
  }

  void selectShippingAddress() {
    Get.toNamed(AppRoutes.address, arguments: true)?.then((value) {
      if (value != null) {
        shippingAddress = value;
        update();
      }
    });
  }

  void selectPaymentMethod() {
    Get.toNamed(AppRoutes.paymentMethod)?.then((value) {
      if (value != null) {
        paymentMethod = value;
        update();
      }
    });
  }
}
