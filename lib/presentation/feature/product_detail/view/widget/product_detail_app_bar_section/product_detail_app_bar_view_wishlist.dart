import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:tostinh/presentation/feature/product_detail/controller/product_detail_controller.dart';

class ProductDetailAppBarViewWishlist extends StatelessWidget {
  final ProductDetailController controller;

  const ProductDetailAppBarViewWishlist({super.key, required this.controller});
  Future<bool> onLikeButtonTapped(bool isLiked) async {
    return !isLiked;
  }

  @override
  Widget build(BuildContext context) {
    return LikeButton(
      onTap: onLikeButtonTapped,
    );
  }
}
