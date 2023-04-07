import 'package:get/get.dart';
import 'package:tostinh/domain/entities/body/cart_request_body.dart';
import 'package:tostinh/domain/entities/body/add_wishlist_request_body.dart';
import 'package:tostinh/domain/entities/body/forgot_password_request_body.dart';
import 'package:tostinh/domain/entities/body/login_request_body.dart';
import 'package:tostinh/domain/entities/body/register_request_body.dart';
import 'package:tostinh/domain/entities/body/update_profile_request_body.dart';
import 'package:tostinh/domain/entities/body/verify_forgot_password_request_body.dart';
import 'package:tostinh/domain/entities/query/product_query.dart';
import 'package:tostinh/domain/entities/query/product_review_query.dart';
import 'package:tostinh/domain/entities/query/verify_otp_query.dart';

import '../../assets/app_api_end_points.dart';
import '../../base/base_service.dart';
import '../../domain/entities/body/address_request_body.dart';

class ApiDataSource extends BaseService {
  Future<Response<dynamic>> createAddress(
      {required AddressRequestBody body}) async {
    return await methodPost(AppApiEndPoints.createAddress, body.toJson());
  }

  Future<Response<dynamic>> getAddress() async {
    return await methodGet(AppApiEndPoints.getAddress);
  }

  Future<Response<dynamic>> updateAddress({
    required int id,
    required AddressRequestBody body,
  }) async {
    return await methodPut(
      "${AppApiEndPoints.updateAddress}/$id",
      body.toJson(),
    );
  }

  Future<Response<dynamic>> deleteAddress({required int id}) async {
    return await methodDelete("${AppApiEndPoints.deleteAddress}/$id");
  }

  Future<Response<dynamic>> getProfileDetail() async {
    return await methodGet(AppApiEndPoints.profileDetail);
  }

  Future<Response<dynamic>> getPaymentMethod() async {
    return await methodGet(AppApiEndPoints.getPaymentMethod);
  }

  Future<Response<dynamic>> getProductList(
      {required ProductQuery productQuery}) async {
    final query = productQuery.toJson();
    return methodGet(
      AppApiEndPoints.getProducts,
      query: query,
    );
  }

  Future<Response<dynamic>> getProductDetail({required int id}) async {
    return methodGet("${AppApiEndPoints.getProductDetail}/$id");
  }

  Future<Response<dynamic>> getProductReview(
      {required ProductReviewQuery productReviewQuery}) async {
    return methodGet(AppApiEndPoints.getProductReview,
        query: productReviewQuery.toJson());
  }

  Future<Response<dynamic>> addWishlist(
      {required AddWishlistRequestBody addWishlistRequestBody}) async {
    return methodPost(
        AppApiEndPoints.addWishlist, addWishlistRequestBody.toJson());
  }

  Future<Response<dynamic>> removeWishlist({required int productId}) async {
    return methodDelete("${AppApiEndPoints.removeWishlist}/$productId");
  }

  Future<Response<dynamic>> getwishLists() async {
    return await methodGet("${AppApiEndPoints.getWissList}");
  }

  Future<Response<dynamic>> getStores({
    required int limit,
    required int offset,
  }) async {
    return await methodGet(
        "${AppApiEndPoints.getStores}?limit=$limit&&offset=$offset");
  }

  Future<Response<dynamic>> followStore({required int storeId}) async {
    return await methodPost(
      "${AppApiEndPoints.followStore}?storeId=$storeId",
      null,
    );
  }

  Future<Response<dynamic>> unfollowStore({required int storeId}) async {
    return await methodPost(
      "${AppApiEndPoints.unfollowStore}?storeId=$storeId",
      null,
    );
  }

  Future<Response<dynamic>> getStoreDetail({required int storeId}) async {
    return await methodGet("${AppApiEndPoints.getStoreDetail}/$storeId");
  }

  Future<Response<dynamic>> addCart({required AddCartRequestBody body}) async {
    return await methodPost(AppApiEndPoints.addCart, body.toJson());
  }

  Future<Response<dynamic>> getCart() async {
    return await methodGet(AppApiEndPoints.getCart);
  }

  Future<Response<dynamic>> updateCart({
    required UpdateCartRequestBody body,
  }) async {
    return await methodPut(
      "${AppApiEndPoints.updateCart}/${body.id}",
      body.toJson(),
    );
  }

  Future<Response<dynamic>> removeCart({
    required RemoveCartRequestBody body,
  }) async {
    return await methodPut(AppApiEndPoints.removeCart, body.toJson());
  }

  Future<Response<dynamic>> login({required LoginRequestBody body}) async {
    return await methodPost(AppApiEndPoints.login, body.toJson());
  }

  Future<Response<dynamic>> register(
      {required RegisterRequestBody body}) async {
    return await methodPost(AppApiEndPoints.register, body.toJson());
  }

  Future<Response<dynamic>> updateProfile(
      {required UpdateProfileRequestBody body}) async {
    return await methodPut(AppApiEndPoints.updateProfile, body.toJson());
  }

  Future<Response<dynamic>> forgotPassword(
      {required ForgotPasswordRequestBody body}) async {
    return await methodPost(AppApiEndPoints.forgotPassword, body.toJson());
  }

  Future<Response<dynamic>> verfyForgotPassword(
      {required VerifyForgotPasswordRequestBody body}) async {
    return await methodPost(
        AppApiEndPoints.verfiyForgotPassword, body.toJson());
  }

  Future<Response<dynamic>> verifyOtp({required VerifyOtpQuery query}) async {
    return await methodPost(AppApiEndPoints.verifyOTP, {},
        query: query.toJson());
  }
}
