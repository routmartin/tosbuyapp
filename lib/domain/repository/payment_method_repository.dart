import '../entities/result/payment_method_result.dart';

abstract class PaymentMethodRepository {
  Future<PaymentMethodResult> get();
}
