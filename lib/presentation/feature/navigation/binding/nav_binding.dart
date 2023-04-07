import 'package:get/get.dart';
import 'package:tostinh/data/repository/cart_repository_impl.dart';
import 'package:tostinh/data/repository/product_repository_impl.dart';
import 'package:tostinh/data/repository/profile_detail_respository_impl.dart';
import 'package:tostinh/domain/repository/cart_repository.dart';
import 'package:tostinh/domain/repository/product_repository.dart';
import 'package:tostinh/domain/repository/profile_detail_repository.dart';
import 'package:tostinh/domain/usecase/cart_usecase.dart';
import 'package:tostinh/domain/usecase/product_usecase.dart';
import 'package:tostinh/domain/usecase/profile_detail_usecase.dart';
import 'package:tostinh/presentation/feature/nav_cart/controller/cart_controller.dart';
import 'package:tostinh/presentation/feature/nav_chat/controller/chat_controller.dart';
import 'package:tostinh/presentation/feature/nav_home/controller/home_controller.dart';
import 'package:tostinh/presentation/feature/nav_profile/controller/profile_controller.dart';
import 'package:tostinh/presentation/feature/nav_watch/controller/watch_controller.dart';

class NavBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ProfileDetailRepository>(
        ProfileDetailRepositoryImpl(apiDataSource: Get.find()));
    Get.put<ProfileDetailUseCase>(
        ProfileDetailUseCase(profileDetailRepository: Get.find()));
    Get.put<ProductRepository>(ProductRepositoryImpl(dataSource: Get.find()));
    Get.put(ProductUseCase(productRepository: Get.find()));
    Get.put<CartRepository>(CartRepositoryImpl(dataSource: Get.find()));
    Get.put(CartUseCase(repository: Get.find()));
    Get.put(HomeController());
    Get.put(WatchController());
    Get.put(ChatController());
    Get.put(CartController());
    Get.put(ProfileController());
  }
}
