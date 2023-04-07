import 'package:get/get.dart';
import 'package:tostinh/presentation/feature/auth/pin_code/binding/pin_code_binding.dart';
import 'package:tostinh/presentation/feature/auth/pin_code/view/pin_code_page.dart';
import 'package:tostinh/presentation/feature/auth/profile_info/view/profile_info_page.dart';
import 'package:tostinh/presentation/feature/auth/sign_in/binding/sign_in_binding.dart';
import 'package:tostinh/presentation/feature/coupon/binding/coupon_binding.dart';
import 'package:tostinh/presentation/feature/coupon/view/coupon_page.dart';
import 'package:tostinh/presentation/feature/edit_profile/binding/edit_profile_binding.dart';
import 'package:tostinh/presentation/feature/edit_profile/view/edit_profile_page.dart';
import 'package:tostinh/presentation/feature/my_order/view/my_order_page.dart';
import 'package:tostinh/presentation/feature/my_order_details/view/my_order_details_page.dart';
import 'package:tostinh/presentation/feature/my_order_review_product/binding/my_order_review_product_binding.dart';
import 'package:tostinh/presentation/feature/my_order_review_product/view/my_order_review_product_page.dart';
import 'package:tostinh/presentation/feature/navigation/binding/nav_binding.dart';
import 'package:tostinh/presentation/feature/navigation/view/nav_page.dart';
import 'package:tostinh/presentation/feature/product_filter/binding/product_filter_binding.dart';
import 'package:tostinh/presentation/feature/product_filter/view/product_filter_page.dart';
import 'package:tostinh/presentation/feature/notification/binding/notification_binding.dart';
import 'package:tostinh/presentation/feature/notification/view/notification_page.dart';
import 'package:tostinh/presentation/feature/return/binding/return_binding.dart';
import 'package:tostinh/presentation/feature/return/view/return_page.dart';
import 'package:tostinh/presentation/feature/sample/binding/sample_binding.dart';
import 'package:tostinh/presentation/feature/sample/view/sample_page.dart';
import 'package:tostinh/presentation/feature/search_product/view/search_product_page.dart';
import 'package:tostinh/presentation/feature/wishlish/binding/wishlish_binding.dart';
import 'package:tostinh/presentation/feature/wishlish/view/wishlist_page.dart';

import '../presentation/feature/address/binding/address_binding.dart';
import '../presentation/feature/address/view/address_page.dart';
import '../presentation/feature/auth/otp/binding/verify_otp_binding.dart';
import '../presentation/feature/auth/otp/view/verify_otp_page.dart';
import '../presentation/feature/auth/profile_info/binding/profile_info_binding.dart';
import '../presentation/feature/auth/sign_in/view/sign_in_page.dart';
import '../presentation/feature/category/binding/category_binding.dart';
import '../presentation/feature/category/view/category_page.dart';
import '../presentation/feature/get_coupon/binding/get_coupon_binding.dart';
import '../presentation/feature/get_coupon/view/get_coupon_page.dart';
import '../presentation/feature/my_order/binding/my_order_binding.dart';
import '../presentation/feature/my_order_details/binding/my_order_details_binding.dart';
import '../presentation/feature/new_address/binding/new_address_binding.dart';
import '../presentation/feature/new_address/view/new_address_page.dart';
import '../presentation/feature/order_status/binding/order_status_binding.dart';
import '../presentation/feature/order_status/view/order_status_page.dart';
import '../presentation/feature/payment/binding/payment_binding.dart';
import '../presentation/feature/payment/view/payment_page.dart';
import '../presentation/feature/payment_method/binding/payment_method_binding.dart';
import '../presentation/feature/payment_method/view/payment_method_page.dart';
import '../presentation/feature/product_detail/binding/product_detail_binding.dart';
import '../presentation/feature/product_detail/view/product_detail_page.dart';
import '../presentation/feature/product_related/view/product_related_page.dart';
import '../presentation/feature/promotion/binding/promotion_binding.dart';
import '../presentation/feature/promotion/view/promotion_page.dart';
import '../presentation/feature/search_product/binding/search_product_binding.dart';
import '../presentation/feature/search_product_result/binding/search_product_result_binding.dart';
import '../presentation/feature/search_product_result/view/search_product_result_page.dart';
import '../presentation/feature/store_detail/binding/store_detail_binding.dart';
import '../presentation/feature/store_detail/view/store_detail_page.dart';
import '../presentation/feature/stores/binding/store_binding.dart';
import '../presentation/feature/stores/view/stores_page.dart';
import 'app_routes.dart';

class AppPages {
  AppPages._();

  static final routes = [
    GetPage(
      name: AppRoutes.signIn,
      page: () => const SignInPage(),
      binding: SignInBinding(),
    ),
    GetPage(
      name: AppRoutes.pinCode,
      page: () => const PinCodePage(),
      binding: PinCodeBinding(),
    ),
    GetPage(
      name: AppRoutes.verifyOTP,
      page: () => const VerifyOTPPage(),
      binding: VerifyOTPBinding(),
    ),
    GetPage(
      name: AppRoutes.profileInfo,
      page: () => const ProfileInfoPage(),
      binding: ProfileInfoBinding(),
    ),
    GetPage(
      name: AppRoutes.navigation,
      page: () => const NavPage(),
      binding: NavBinding(),
    ),
    GetPage(
      name: AppRoutes.payment,
      page: () => const PaymentPage(),
      binding: PaymentBinding(),
    ),
    GetPage(
      name: AppRoutes.paymentMethod,
      page: () => const PaymentMethodPage(),
      binding: PaymentMethodBinding(),
    ),
    GetPage(
      name: AppRoutes.orderStatus,
      page: () => const OrderStatusPage(),
      binding: OrderStatusBinding(),
    ),
    GetPage(
      name: AppRoutes.address,
      page: () => const AddressPage(),
      binding: AddressBinding(),
    ),
    GetPage(
      name: AppRoutes.newAddress,
      page: () => const NewAddressPage(),
      binding: NewAddressBinding(),
    ),
    GetPage(
      name: AppRoutes.searchProduct,
      page: () => const SearchProductPage(),
      binding: SearchProductBinding(),
    ),
    GetPage(
      name: AppRoutes.searchProductResult,
      page: () => const SearchProductResultPage(),
      binding: SearchProductResultBinding(),
    ),
    GetPage(
      name: AppRoutes.myOrder,
      page: () => const MyOrderPage(),
      binding: MyOrderBinding(),
    ),
    GetPage(
      name: AppRoutes.myOrderDetails,
      page: () => const MyOrderDetailsPage(),
      binding: MyOrderDetailsBinding(),
    ),
    GetPage(
      name: AppRoutes.sample,
      page: () => const SamplePage(),
      binding: SampleBinding(),
    ),
    GetPage(
      name: AppRoutes.coupon,
      page: () => const CouponPage(),
      binding: CouponBinding(),
    ),
    GetPage(
      name: AppRoutes.getCoupon,
      page: () => const GetCouponPage(),
      binding: GetCouponBinding(),
    ),
    GetPage(
        name: AppRoutes.store,
        page: () => const StoresPage(),
        binding: StoreBinding()),
    GetPage(
      name: AppRoutes.storeDetail,
      page: () => const StoreDetailPage(),
      binding: StoreDetailBinding(),
    ),
    GetPage(
      name: AppRoutes.productDetail,
      page: () => const ProductDetailPage(),
      binding: ProductDetailBinding(),
    ),
    GetPage(
      name: AppRoutes.wishlish,
      page: () => const WishlistPage(),
      binding: WishListBinding(),
    ),
    GetPage(
      name: AppRoutes.editProfile,
      page: () => const EditProfilePage(),
      binding: EditProfileBinding(),
    ),
    GetPage(
      name: AppRoutes.returns,
      page: () => const ReturnPage(),
      binding: ReturnBinding(),
    ),
    GetPage(
      name: AppRoutes.category,
      page: () => const CategoryPage(),
      binding: CategoryBinding(),
    ),
    GetPage(
      name: AppRoutes.productFilter,
      page: () => const ProductFilterPage(),
      binding: ProductFilterBinding(),
    ),
    GetPage(
      name: AppRoutes.notifications,
      page: () => const NotificationPage(),
      binding: NotificationBinding(),
    ),
    GetPage(
      name: AppRoutes.myOrderReviewProduct,
      page: () => MyOrderReviewProductPage(),
      binding: MyOrderReviewProductBinding(),
    ),
    GetPage(
      name: AppRoutes.promotion,
      page: () => PromotionPage(),
      binding: PromotionBinding(),
    ),
    GetPage(
      name: AppRoutes.relatedProduct,
      page: () => ProductRelatedPage(),
    ),
  ];
}
