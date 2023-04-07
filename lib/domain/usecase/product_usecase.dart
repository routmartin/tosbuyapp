import 'package:tostinh/domain/entities/query/product_query.dart';
import 'package:tostinh/domain/entities/query/product_review_query.dart';
import 'package:tostinh/domain/entities/result/product_detail_result.dart';
import 'package:tostinh/domain/repository/product_repository.dart';

import '../entities/result/product_review_result.dart';
import '../entities/result/products_result.dart';

class ProductUseCase {
  final ProductRepository _repository;

  ProductUseCase({required ProductRepository productRepository})
      : _repository = productRepository;

  Future<ProductsResult> getProductList(
      {required ProductQuery productQuery}) async {
    return await _repository.getProductList(productQuery: productQuery);
  }

  Future<ProductDetailResult> getProductDetail({required int id}) async {
    return await _repository.getProductDetail(id: id);
  }

  Future<ProductReviewResult> getProductReview(
      {required ProductReviewQuery productReviewQuery}) async {
    return await _repository.getProductReview(
        productReviewQuery: productReviewQuery);
  }
}
