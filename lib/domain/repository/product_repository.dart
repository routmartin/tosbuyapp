import 'package:tostinh/domain/entities/query/product_query.dart';
import 'package:tostinh/domain/entities/query/product_review_query.dart';
import 'package:tostinh/domain/entities/result/product_detail_result.dart';
import 'package:tostinh/domain/entities/result/product_review_result.dart';
import 'package:tostinh/domain/entities/result/products_result.dart';

abstract class ProductRepository {
  Future<ProductsResult> getProductList({required ProductQuery productQuery});
  Future<ProductDetailResult> getProductDetail({required int id});
  Future<ProductReviewResult> getProductReview({required ProductReviewQuery productReviewQuery});
}
