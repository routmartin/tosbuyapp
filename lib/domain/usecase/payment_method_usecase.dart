import '../entities/result/payment_method_result.dart';
import '../repository/payment_method_repository.dart';

class PaymentMethodUseCase {
  final PaymentMethodRepository _repository;

  PaymentMethodUseCase({
    required PaymentMethodRepository repository,
  }) : _repository = repository;

  Future<PaymentMethodResult> get() async {
    return await _repository.get();
  }
}
