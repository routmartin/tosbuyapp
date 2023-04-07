import 'package:get/get.dart';
import 'package:tostinh/data/repository/wishlist_repository_impl.dart';
import 'package:tostinh/domain/repository/wishlist_repository.dart';
import 'package:tostinh/domain/usecase/wishlist_usecase.dart';

class ProductDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WishlistRepository>(
        () => WishlistRepositoryImpl(apiDataSource: Get.find()));
    Get.lazyPut(() => WishlistUsecase(wishlistRepository: Get.find()));
  }
}
