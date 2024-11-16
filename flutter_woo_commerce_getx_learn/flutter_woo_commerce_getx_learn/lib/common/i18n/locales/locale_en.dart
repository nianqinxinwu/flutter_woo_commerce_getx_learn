import '../locale_keys.dart';

/// 多语言 - 英文
Map<String, String> localeEn = {
  // 通用
  LocaleKeys.commonSearchInput: 'Enter keyword',
  LocaleKeys.commonBottomSave: 'Save',
  LocaleKeys.commonBottomCancel: 'Cancel',
  LocaleKeys.commonBottomRemove: 'Remove',
  LocaleKeys.commonBottomConfirm: 'Confirm',
  LocaleKeys.commonBottomApply: 'Apply',
  LocaleKeys.commonBottomBack: 'Back',
  LocaleKeys.commonSelectTips: 'Please select',
  LocaleKeys.commonMessageSuccess: '@method successfully',
  LocaleKeys.commonMessageIncorrect: '@method incorrect',

  // 样式
  LocaleKeys.stylesTitle: 'Styles && Function',

  // welcome 欢迎
  LocaleKeys.welcomeOneTitle: 'Choose Your Desire Product',
  LocaleKeys.welcomeOneDesc:
      'Contrary to popular belief, Lorem Ipsum is not simply random text',
  LocaleKeys.welcomeTwoTitle: 'Complete your shopping',
  LocaleKeys.welcomeTwoDesc:
      'Contrary to popular belief, Lorem Ipsum is not simply random text',
  LocaleKeys.welcomeThreeTitle: 'Get product at your door',
  LocaleKeys.welcomeThreeDesc:
      'Contrary to popular belief, Lorem Ipsum is not simply random text',
  LocaleKeys.welcomeSkip: 'Skip',
  LocaleKeys.welcomeNext: 'Next',
  LocaleKeys.welcomeStart: 'Get Started',

  // 登录、注册 - 通用
  LocaleKeys.loginForgotPassword: 'Forgot Password?',
  LocaleKeys.loginSignIn: 'Sign In',
  LocaleKeys.loginSignUp: 'Sign Up',
  LocaleKeys.loginOrText: '- OR -',

  // 注册 - new user
  LocaleKeys.registerTitle: 'Register',
  LocaleKeys.registerDesc: 'Sign up to continue',
  LocaleKeys.registerFormName: 'User Name',
  LocaleKeys.registerFormEmail: 'Email',
  LocaleKeys.registerFormPhoneNumber: 'Phone number',
  LocaleKeys.registerFormPassword: 'Password',
  LocaleKeys.registerFormFirstName: 'First name',
  LocaleKeys.registerFormLastName: 'Last name',
  LocaleKeys.registerHaveAccount: 'Already have an account?',

  // 验证提示
  LocaleKeys.validatorRequired: 'The field is obligatory',
  LocaleKeys.validatorEmail: 'The field must be an email',
  LocaleKeys.validatorMin: 'Length cannot be less than @size',
  LocaleKeys.validatorMax: 'Length cannot be greater than @size',
  LocaleKeys.validatorPassword:
      'password must have between @min and @max digits',

  // 注册PIN - register pin
  LocaleKeys.registerPinTitle: 'Verification',
  LocaleKeys.registerPinDesc: 'we will send you a Pin to continue your account',
  LocaleKeys.registerPinFormTip: 'Pin',
  LocaleKeys.registerPinButton: 'Submit',

  // 登录 - back login
  LocaleKeys.loginBackTitle: 'Welcome login!',
  LocaleKeys.loginBackDesc: 'Sign in to continue',
  LocaleKeys.loginBackFieldEmail: 'Name',
  LocaleKeys.loginBackFieldPassword: 'Password',

  // APP 导航
  LocaleKeys.tabBarHome: 'Home',
  LocaleKeys.tabBarCart: 'Cart',
  LocaleKeys.tabBarMessage: 'Message',
  LocaleKeys.tabBarProfile: 'Profile',

  // 商品 - 首页
  LocaleKeys.gHomeSearch: 'Search Product',
  LocaleKeys.gHomeFlashSell: 'Flash Sell',
  LocaleKeys.gHomeNewProduct: 'New Product',
  LocaleKeys.gHomeMore: 'ALL',

  // 商品 - 列表
  LocaleKeys.gFlashSellTitle: 'Flash Sell',
  LocaleKeys.gNewsTitle: 'New Product',

  // 商品 - 分类
  LocaleKeys.gCategoryTitle: 'All Category',

  // 商品 - 详情
  LocaleKeys.gDetailTitle: 'Product Info',
  LocaleKeys.gDetailTabProduct: 'Product',
  LocaleKeys.gDetailTabDetails: 'Details',
  LocaleKeys.gDetailTabReviews: 'Reviews',
  LocaleKeys.gDetailBtnAddCart: 'Add To Cart',
  LocaleKeys.gDetailBtnBuy: 'Buy Now',
  LocaleKeys.gDetailTitleColor: 'Color',
  LocaleKeys.gDetailTitleSize: 'Size',
  LocaleKeys.gDetailTitleShoppingCharge: 'Shopping Charge',

  // 商品 - 详情 - 产品详情模块
  LocaleKeys.gDetailProductDesc: 'Description',
  LocaleKeys.gDetailProductSKU: 'SKU',
  LocaleKeys.gDetailMarketPrice: 'Regular Price',
  LocaleKeys.gDetailWeight: 'Weight',
  LocaleKeys.gDetailDimensions: 'Dimensions',
  LocaleKeys.gDetailProductPrice: 'Price',

  // 搜索
  LocaleKeys.searchPlaceholder: 'Search Product',
  LocaleKeys.searchOrder: 'Best Match',
  LocaleKeys.searchFilter: 'Filter',
  LocaleKeys.searchFilterPrice: 'Price',
  LocaleKeys.searchFilterSize: 'Size',
  LocaleKeys.searchFilterColor: 'Color',
  LocaleKeys.searchFilterReview: 'Review',
  LocaleKeys.searchFilterBrand: 'Brand',
  LocaleKeys.searchFilterGender: 'Gender',
  LocaleKeys.searchFilterCondition: 'Condition',

  // 我的页面
  LocaleKeys.myTabWishlist: 'Wishlist',
  LocaleKeys.myTabFollowing: 'Following',
  LocaleKeys.myTabVoucher: 'Voucher',
  LocaleKeys.myBtnMyOrder: 'My Order',
  LocaleKeys.myBtnMyWallet: 'My Wallet',
  LocaleKeys.myBtnEditProfile: 'Edit Profile',
  LocaleKeys.myBtnAddress: 'Address',
  LocaleKeys.myBtnNotification: 'Notification',
  LocaleKeys.myBtnLanguage: 'Language',
  LocaleKeys.myBtnTheme: 'Theme',
  LocaleKeys.myBtnWinGift: 'Win Gift',
  LocaleKeys.myBtnLogout: 'Logout',
  LocaleKeys.myBtnStyles: 'Styles',
  LocaleKeys.myBtnBillingAddress: 'Billing address',
  LocaleKeys.myBtnShippingAddress: 'Shipping address',

  // 订单配送地址
  LocaleKeys.addressViewTitle: '@type address',
  LocaleKeys.addressFirstName: 'First name',
  LocaleKeys.addressLastName: 'Last name',
  LocaleKeys.addressCountry: 'Country',
  LocaleKeys.addressState: 'State',
  LocaleKeys.addressPostCode: 'Post code',
  LocaleKeys.addressCity: 'City',
  LocaleKeys.addressAddress1: 'Address 1',
  LocaleKeys.addressAddress2: 'Address 2',
  LocaleKeys.addressCompany: 'Company',
  LocaleKeys.addressPhoneNumber: 'Phone number',
  LocaleKeys.addressEmail: 'Email',

  // 购物车
  LocaleKeys.gCartTitle: 'My Cart',
  LocaleKeys.gCartBtnSelectAll: 'Select All',
  LocaleKeys.gCartBtnApplyCode: 'Apply Code',
  LocaleKeys.gCartBtnCheckout: 'Checkout',
  LocaleKeys.gCartTextShippingCost: 'Shipping cost',
  LocaleKeys.gCartTextVocher: 'Voucher',
  LocaleKeys.gCartTextTotal: 'Total',

  //
};
