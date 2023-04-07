import 'package:get/instance_manager.dart';

import '../../../../data/repository/store_repository_impl.dart';
import '../../../../domain/repository/store_repository.dart';
import '../../../../domain/usecase/store_usecase.dart';

class StoreBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<StoreRepository>(StoreRepositoryImpl(dataSource: Get.find()));
    Get.put(StoreUseCase(repository: Get.find()));
  }
}
