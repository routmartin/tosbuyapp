import 'package:get/instance_manager.dart';

import '../../../../data/repository/address_repository_impl.dart';
import '../../../../domain/repository/address_repository.dart';
import '../../../../domain/usecase/address_usecase.dart';

class ReturnBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<AddressRepository>(AddressRepositoryImpl(dataSource: Get.find()));
    Get.put(AddressUseCase(repository: Get.find()));
  }
}
