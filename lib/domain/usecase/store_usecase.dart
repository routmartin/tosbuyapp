import '../entities/result/message_result.dart';
import '../entities/result/store_result.dart';
import '../repository/store_repository.dart';

class StoreUseCase {
  final StoreRepository _repository;

  StoreUseCase({
    required StoreRepository repository,
  }) : _repository = repository;

  Future<StoreResult> get({required int limit, required int offset}) async {
    return await _repository.get(limit: limit, offset: offset);
  }

  Future<MessageResult> follow({required int storeId}) async {
    return await _repository.follow(storeId: storeId);
  }

  Future<MessageResult> unfollow({required int storeId}) async {
    return await _repository.unfollow(storeId: storeId);
  }

  Future<StoreDetailResult> detail({required int storeId}) async {
    return await _repository.detail(storeId: storeId);
  }
}
