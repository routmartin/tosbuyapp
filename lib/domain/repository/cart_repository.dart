import '../entities/body/cart_request_body.dart';
import '../entities/result/cart_result.dart';
import '../entities/result/message_result.dart';

abstract class CartRepository {
  Future<MessageResult> add({required AddCartRequestBody body});
  Future<CartResult> get();
  Future<MessageResult> update({required UpdateCartRequestBody body});
  Future<MessageResult> remove({required RemoveCartRequestBody body});
}
