import '../entities/result/message_result.dart';
import '../entities/result/store_result.dart';

abstract class StoreRepository {
  Future<StoreResult> get({required int limit, required int offset});

  Future<MessageResult> follow({required int storeId});

  Future<MessageResult> unfollow({required int storeId});

  Future<StoreDetailResult> detail({required int storeId});
}
