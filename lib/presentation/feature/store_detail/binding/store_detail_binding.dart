import 'package:get/get.dart';
import 'package:tostinh/data/repository/wishlist_repository_impl.dart';
import 'package:tostinh/domain/repository/wishlist_repository.dart';
import 'package:tostinh/domain/usecase/wishlist_usecase.dart';

import '../../../../data/repository/store_repository_impl.dart';
import '../../../../domain/repository/store_repository.dart';
import '../../../../domain/usecase/store_usecase.dart';

class StoreDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<StoreRepository>(StoreRepositoryImpl(dataSource: Get.find()));
    Get.put<WishlistRepository>(
      WishlistRepositoryImpl(apiDataSource: Get.find()),
    );
    Get.put(StoreUseCase(repository: Get.find()));
    Get.put(WishlistUsecase(wishlistRepository: Get.find()));
  }
}
