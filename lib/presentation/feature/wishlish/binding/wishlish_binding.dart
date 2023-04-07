import 'package:get/instance_manager.dart';
import 'package:tostinh/data/repository/wishlist_repository_impl.dart';
import 'package:tostinh/domain/repository/wishlist_repository.dart';
import 'package:tostinh/domain/usecase/wishlist_usecase.dart';

class WishListBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<WishlistRepository>(
        WishlistRepositoryImpl(apiDataSource: Get.find()));
    Get.put(WishlistUsecase(wishlistRepository: Get.find()));
  }
}
