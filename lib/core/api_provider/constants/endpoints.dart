class ApiConstants {
  /// Base URLs
  static const String baseUrl = "https://food.yayportal.com"; //#
  static const String baseUrlLocal = "http://192.168.1.67:3000"; // Real device (using my IP)
  static const String baseUrlLocalEmulator_Android = "http://10.0.2.2:3000";
  static const String baseUrlLocalEmulator_IOS = "http://127.0.0.1:3000";

  /// Endpoints
  // Auth
  static const String checkAuthEndpoint = "/auth";
  static const String loginEndpoint = "/auth/login";
  static const String registerEndpoint = "/auth/registerCustomer";
  static const String generateToken = "/auth/generateToken";
  static const String updatePasswordEndpoint = "/auth/updatePassword";
  // static const String validateUserEndpoint = "/auth/validateUser";
  static const String deleteAccountEndpoint = "/auth/deleteAccount";
  static const String logoutEndpoint = "/auth/logout";
  static const String isUserRegisteredEndpoint = "/auth/isUserRegistered";

  // Forget Password
  static const String forgetPasswordOtpEndpoint = "/auth/forgetPasswordOTP";
  static const String checkPasswordOtpEndpoint = "/auth/checkPasswordOTP";
  static const String updatePasswordOtpEndpoint = "/auth/updatePasswordOTP";

  // OTP
  static const String generateOtpEndpoint = "/otp/generateOtp";
  static const String validateOtpEndpoint = "/otp/validateOtp";

  // Restaurant
  static const String getRestaurantEndpoint = "/restaurant";
  static const String restaurantMenuEndpoint = "/menuItems";
  static const String previousRestaurantsEndpoint = "/order/getLastRestaurantsOrder";

  static const String getMenuItemEndpoint = "/menuItem/getMenuItem";
  static const String isInDeliveryAreaEndpoint = "/restaurant/isRestaurantInDeliveryArea";

  // Reviews
  static const String getReviewsEndpoint = "/review";

  // Order
  static const String makeCartEndpoint = "/order/makeOrder";
  static const String getCartEndpoint = "/order/getOrder";
  static const String getLastCartIdEndpoint = "/order/getCart";
  static const String orderAgainEndpoint = "/order/orderAgain";
  static const String cancelCartEndpoint = "/order/cancelOrder";
  static const String checkoutEndpoint = "/order/checkOut";
  static const String suggestedCartItemsEndpoint = "/order/suggestCategoryMenuItem";
  // My Orders (Order History)
  static const String myOrdersEndpoint = "/order/myOrders";
  static const String orderDetailsEndpoint = "/order/getOrderInfo";
  static const String canOrderAgainEndpoint = "/order/checkOrderAgain";
  //DeliveryFee
  static const String updateDeliveryFee = "/order/updateFees";

  // Order Item
  static const String makeOrderItemEndpoint = "/orderItem/makeOrderItem";
  static const String updateOrderItemEndpoint = "/orderItem/UpdateOrderItem";
  static const String deleteOrderItemEndpoint = "/orderItem/deleteOrderItem";

  //Complaint (Report an error)
  static const String submitComplaintEndpoint = "/complain";

  //Contact Us
  static const String contactUsEndpoint = "/contact";

  //Customer
  static const String getCustomerEndpoint = "/customer";
  static const String updateCustomerInfoEndpoint = "/customer/editCustomerInfo";
  static const String setDefaultPaymentMethodEndpoint = "/customer/setDefaultPaymentMethod";
  static const String removeDefaultPaymentMethodEndpoint = "/customer/removeDefaultPaymentMethod";
  static const String saveCardEndpoint = "/customer/savePaymentMethods";
  static const String removeCardEndpoint = "/customer/removePaymentMethod";
  static const String getCardsEndpoint = "/customer/getCards";
  static const String updateStripeIdEndpoint = "/customer/updateStripeId";
  static const String changePhoneNumberEndpoint = "/customer/changePhoneNumber";
  static const String changeCountryCodeEndpoint = "/customer/changeCountryCode";
  static const String updateProfileImageEndpoint = "/customer/addProfileImage";
  static const String removeProfileImageEndpoint = "/customer/removeImage";
  static const String addLastAddressEndpoint = "/customer/addLastAddress";
  static const String updateAddressEndpoint = "/customer/updateSavedPlace";
  static const String changeLastAddressEndpoint = "/customer/changeLastAddress";
  static const String removeAddressEndpoint = "/customer/removeSavedPlace";
  static const String updateFbTokenEndpoint = "/customer/updateFirebaseToken";
  static const String checkIfUserIsInLastAddress = "/customer/checkIfLocationInRadius";
  static const String updateCountryEndpoint = "/customer/updateCountry";

  //Driver
  static const String driverInfoEndpoint = "/driver/getInfo";

  //Favorite
  static const String getFavoriteRestaurantsEndpoint = "/favoriteRestaurant";
  static const String toggleFavoriteRestaurantEndpoint = "/favoriteRestaurant/toggleFavoriteRestaurant";

  //Wallet
  static const String getWalletBalanceEndpoint = "/wallet/balance";
  static const String getWalletHistoryEndpoint = "/wallet";
  static const String walletTransferEndpoint = "/wallet/transferBalance";
  static const String walletTopUpEndpoint = "/wallet/topUp";

  //Categories restaurantCategory
  static const String getCategoriesEndpoint = "/restaurantCategory";

  //Addr
  static const String getAddrEndpoint = "/customer/getLocationDescription";
  //Config Keys
  static const String getConfigEndpoint = "/config";

  //Coupon
  static const String fetchCouponEndpoint = "/coupon/validateCoupon";
  static const String getRestaurantCouponsEndpoint = "/coupon/publicCoupons";

  //Delivery Time
  static const String getDeliveryTimeEndpoint = "/order/getDistanceAndTime";

  //Update Socket Id
  static const String updateSocketIdEndpoint = "/customer/updateSocketId";

  //Review
  static const String reviewEndpoint = "/review";

}
