import 'package:get/get.dart';

import '../../../../data/repository/wishlist_repository_impl.dart';
import '../../../../domain/repository/wishlist_repository.dart';
import '../../../../domain/usecase/wishlist_usecase.dart';

class PromotionBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<WishlistRepository>(
      WishlistRepositoryImpl(apiDataSource: Get.find()),
    );
    Get.put(WishlistUsecase(wishlistRepository: Get.find()));
  }
}