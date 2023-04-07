import 'package:get/get.dart';

import '../../../../data/repository/payment_method_repository_impl.dart';
import '../../../../domain/repository/payment_method_repository.dart';
import '../../../../domain/usecase/payment_method_usecase.dart';

class PaymentMethodBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<PaymentMethodRepository>(PaymentMethodRepositoryImpl(dataSource: Get.find()));
    Get.put(PaymentMethodUseCase(repository: Get.find()));
  }
}