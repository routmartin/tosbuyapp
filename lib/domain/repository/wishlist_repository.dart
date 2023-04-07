import 'package:tostinh/domain/entities/body/add_wishlist_request_body.dart';
import 'package:tostinh/domain/entities/result/wishlist_result.dart';

abstract class WishlistRepository {
  Future<WishlistResult> addWishlist({
    required AddWishlistRequestBody addWishlistRequestBody,
  });
  Future<WishlistResult> removeWishlist({required int productId});
  Future<WishlistResults> get();
}
