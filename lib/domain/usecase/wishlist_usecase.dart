import 'package:tostinh/domain/entities/body/add_wishlist_request_body.dart';
import 'package:tostinh/domain/entities/result/wishlist_result.dart';
import 'package:tostinh/domain/repository/wishlist_repository.dart';

class WishlistUsecase {
  final WishlistRepository _wishlistRepository;

  WishlistUsecase({required WishlistRepository wishlistRepository})
      : _wishlistRepository = wishlistRepository;

  Future<WishlistResult> addWishlist(
      {required AddWishlistRequestBody addWishlistRequestBody}) async {
    return _wishlistRepository.addWishlist(
        addWishlistRequestBody: addWishlistRequestBody);
  }

  Future<WishlistResult> removeWishlist({required int productId}) async {
    return _wishlistRepository.removeWishlist(productId: productId);
  }

  Future<WishlistResults> get() async {
    return await _wishlistRepository.get();
  }
}
