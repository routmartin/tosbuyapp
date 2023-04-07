import '../entities/body/cart_request_body.dart';
import '../entities/result/cart_result.dart';
import '../entities/result/message_result.dart';
import '../repository/cart_repository.dart';

class CartUseCase {
  final CartRepository _repository;

  CartUseCase({required CartRepository repository}) : _repository = repository;

  Future<MessageResult> add({required AddCartRequestBody body}) async {
    return await _repository.add(body: body);
  }

  Future<CartResult> get() async {
    return await _repository.get();
  }

  Future<MessageResult> update({required UpdateCartRequestBody body}) async {
    return await _repository.update(body: body);
  }

  Future<MessageResult> remove({required RemoveCartRequestBody body}) async {
    return await _repository.remove(body: body);
  }
}
