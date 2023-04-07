import 'package:get/get.dart';

import 'app_locals.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': english,
        'km_KH': khmer,
      };
}

const Map<String, String> english = {
  AppLocals.globalConfirm: 'Confirm',
  AppLocals.globalCancel: 'Cancel',
  AppLocals.globalConfirmDelete: 'Confirm Delete',
  AppLocals.globalNoInternet: 'Check your internet connection',
  AppLocals.globalInternalError: 'Internal Error',
  AppLocals.globalSomethingWrong: 'Something went wrong',
  AppLocals.globalOpenSetting: 'Open Setting',
  AppLocals.globalSeeMore: 'See More',
  AppLocals.login: 'Login',
  AppLocals.employee: 'Employee',
  AppLocals.cartTitle: "Cart",
  AppLocals.cartAll: "All",
  AppLocals.cartShipping: "Shipping:",
  AppLocals.cartTotal: "Total:",
  AppLocals.cartCheckOut: "Check Out",
  AppLocals.cartAddSuccess: "Add product to cart success",
  AppLocals.cartUpdateSuccess: "Update cart success",
  AppLocals.cartDeleteMessage:
      "Are you sure you want to delete this @count item(s) from cart?",
  AppLocals.paymentTitle: "Payment",
  AppLocals.paymentSelectTitle: "Select Payment",
  AppLocals.paymentSelectAddress: "Select Shipping Address",
  AppLocals.paymentSelectPaymentMethod: "Select Payment Method",
  AppLocals.paymentSubtotal: "Subtotal:",
  AppLocals.paymentShippingFee: "Shipping Fee:",
  AppLocals.paymentStoreCoupon: "Store Coupon Code:",
  AppLocals.paymentCoupon: "Coupon Code:",
  AppLocals.paymentTotal: "Total:",
  AppLocals.paymentRemark: "Remark:",
  AppLocals.paymentPayNow: "Pay Now",
  AppLocals.orderSuccess: "Success!",
  AppLocals.orderSuccessMsg:
      "Your order will be delivered soon.\nThank you for choosing our app!",
  AppLocals.orderFail: "Unsuccess!",
  AppLocals.orderFailMsg: "Sorry! Your order something wrong",
  AppLocals.orderGoHome: "Go Home",
  AppLocals.orderGoBack: "Go Back",
  AppLocals.addressMy: "My Address",
  AppLocals.addressAdd: "Add New Address",
  AppLocals.addressUpdate: "Update Address",
  AppLocals.addressDelete: "Delete Address",
  AppLocals.addressName: "Name Address",
  AppLocals.addressPhone: "Phone Number",
  AppLocals.addressDetail: "Address Details",
  AppLocals.addressEnterName: "Please enter name address",
  AppLocals.addressEnterPhone: "Please enter phone number",
  AppLocals.addressEnterDetail: "Please enter address details",
  AppLocals.addressDefault: "Make this as the default address",
  AppLocals.addressDefaultLabel: "Default",
  AppLocals.addressLocationPermissionTitle: "Location Permission Needed",
  AppLocals.addressLocationPermissionMsg:
      "Location permission needed for accessing your current location",
  AppLocals.addressGettingDetail: "Getting address detail...",
  AppLocals.addressAddNewSuccess: "You have added new address",
  AppLocals.addressUpdateSuccess: "You have updated address",
  AppLocals.addressDeleteSuccess: "You have deleted address",
  AppLocals.addressConfirmDeleteMsg:
      "Are you sure you want to delete this address?",
  AppLocals.stateNoNotificationHeader: "No Notifications",
  AppLocals.stateNoNotificationDescription:
      "Enable push notifications to let send you personal news and updates.",
  AppLocals.stateNoResultHeader: "No Results",
  AppLocals.stateNoResultDescription:
      "Sorry, there are no results for this search. Please try another phrase.",
  AppLocals.stateNoInternetHeader: "No Internet",
  AppLocals.stateNoInternetDescription:
      "No Internet connection found. Check your connection or try again.",
  AppLocals.stateSomethingWrongHeader: "Error",
  AppLocals.stateSomethingWrongDescription: "Something went wrong.",
  AppLocals.stateFailedHeader: "Error",
  AppLocals.stateFailedDescription: "Network request failed.",
  AppLocals.stateNoChatHistoryHeader: "No Chat History",
  AppLocals.stateNoChatHistoryDescription: "No chat to other store.",
  AppLocals.stateNoPurchaseHeader: "No Purchase",
  AppLocals.stateNoPurchaseDescription: "We wants to access your location.",
  AppLocals.stateNoWishlistHeader: "No Product",
  AppLocals.stateNoWishlistDescription: "No product on your wishlist.",
  AppLocals.stateNoCartDescription: "No product on your shopping cart.",
  AppLocals.stateNoAddressHeader: "No Address",
  AppLocals.stateNoAddressDescription: "We wants to access your location.",
  AppLocals.stateNoDataHeader: "No Data Available",
  AppLocals.stateNoRelatedHeader: "No Related Product",
  AppLocals.stateNoDataDescription: "There is no data to show you right now.",
  AppLocals.stateNoRecordHeader: "No Record",
  AppLocals.stateNoRecordDescription: "No data available.",
  AppLocals.stateNoMoreDataHeader: "No more data.",
  AppLocals.clickToRetry: "Click to retry",
  AppLocals.searchProduct: "Search Product",
  AppLocals.searchCancel: "Cancel",
  AppLocals.searchHistory: "Search History",
  AppLocals.errorOccurred: "An error occurred. Click to try again.",
  AppLocals.noInternetOccurred: "No internet occurred. Click to try again.",
  AppLocals.noMoreItems: "No more items.",
  AppLocals.filter: "Filter",
  AppLocals.price: "Price",
  AppLocals.grid: "Grid",
  AppLocals.linear: "Linear",
  AppLocals.myOrder: "My Order",
  AppLocals.myOrderDetails: "Order Details",
  AppLocals.myAddress: "My Address",
  AppLocals.myWishlist: "Wishlist",
  AppLocals.myCoupon: "My Coupon",
  AppLocals.editProfile: "Edit Profile",
  AppLocals.changePin: "Change Pin",
  AppLocals.returnProduct: "Return",
  AppLocals.pushNotifications: "Push Notifications",
  AppLocals.logout: "Log out",
  AppLocals.orderShipping: "Shipping",
  AppLocals.orderTotal: "Total",
  AppLocals.orderId: "Order ID",
  AppLocals.orderDate: "Order Date",
  AppLocals.orderStatus: "Status",
  AppLocals.orderPaymentMethod: "Payment Method",
  AppLocals.orderExportPDF: "Export PDF",
  AppLocals.orderWhatIsYourRate: "What is your rate?",
  AppLocals.orderPleaseShareYourOpinion:
      "Please share your opinion about the product",
  AppLocals.orderYourReview: "Your Review",
  AppLocals.coupon: "Coupon",
  AppLocals.useNow: "Use Now",
  AppLocals.getCoupon: "Get coupon",
  AppLocals.storeTitle: "Store",
  AppLocals.storeFollow: "Follow",
  AppLocals.storeFollowSuccess: "You have followed store success",
  AppLocals.storeUnfollow: "Unfollow",
  AppLocals.storeUnfollowSuccess: "You have unfollowed store success",
  AppLocals.storeFollower: "followers",
  AppLocals.storeHome: "Home",
  AppLocals.storePromotion: "Promotion",
  AppLocals.storeBestSale: "Best Sales",
  AppLocals.storePromotionWishlist: "Wishlist",
  AppLocals.storePromotionShare: "Share",
  AppLocals.storePromotionSold: "sold",
  AppLocals.storePromotionOrderNow: "Order now!",
  AppLocals.searchProducts: "Search Products",
  AppLocals.productDetailDescription: "Detail",
  AppLocals.productDetailReview: "Reviews",
  AppLocals.productDetailRelatedProduct: "Related Products",
  AppLocals.next: "Next",
  AppLocals.enterPinCode: "Enter PIN",
  AppLocals.forgetPin: "Forget PIN",
  AppLocals.verifyOTP: "Verify OTP",
  AppLocals.otpMessage:
      "We have sent you SMS with the code to your phone number",
  AppLocals.code: "Code",
  AppLocals.enterCodeValidateMsg: "Please enter OTP Code",
  AppLocals.welcomeBank: "Welcome Back!",
  AppLocals.phoneNumber: "Phone Number",
  AppLocals.orContinueWith: "Or continue with",
  AppLocals.notRegisterYet: "Not register yet?",
  AppLocals.signUp: "Sign Up",
  AppLocals.profileInfo: "Profile Info",
  AppLocals.inputYourName: "Please input your name",
  AppLocals.firstName: "First Name",
  AppLocals.lastName: "Last Name",
  AppLocals.email: "Email",
  AppLocals.skip: "Skip",
  AppLocals.wishList: "Wishlist",
  AppLocals.wishlistAddSuccess: "Add item to wishlist successfully!",
  AppLocals.notAvailable: "Not Avaliable",
  AppLocals.wishlistRemoveSuccess: "Removed item from wishlist successfully!",
  AppLocals.wishlistConfirmMessage:
      "Are you sure to remove this item from wishlist?",
  AppLocals.save: "Save",
  AppLocals.emailOptional: "Email ( Optional )",
  AppLocals.reviews: "Reviews",
  AppLocals.ratings: "Ratings",
  AppLocals.category: "Category",
  AppLocals.view: "View",
  AppLocals.apply: "Apply",
  AppLocals.filters: "Filters",
  AppLocals.reviewAddYourPhotos: "Add Your Photos",
  AppLocals.loginFailed: "Login Failed",
  AppLocals.ok: "OK",
  AppLocals.yes: "Yes",
  AppLocals.no: "No",
  AppLocals.close: "Close",
  AppLocals.pleaseEnterOTP: "Please enter valide OTP",
  AppLocals.resend: "Resend",
  AppLocals.resendFailed: "Resend Failed",
  AppLocals.profileLogoutHeader: "Log out",
  AppLocals.profileLogoutDescription: "You will returned to the login screen.",
  AppLocals.signInWrongPinDescription:
      "Your pin is incorrect.\nPlease try again.",
  AppLocals.signInNotYetRegisterDescription:
      "This phone number is not yet register, Would you like register now.",
  AppLocals.signInNotYetVerifyDescription:
      "This phone number is not yet verify, Please click Verify Now to complete your register.",
  AppLocals.signInPleaseInputPhoneNumberDescription:
      "Please input your phone number to sign in.",
  AppLocals.signUpFieldRequired: "Field Required",
};

const Map<String, String> khmer = {
  AppLocals.login: 'ចូល',
  AppLocals.employee: 'បុគ្គលិក',
};