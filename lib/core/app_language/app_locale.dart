import 'package:sweet_shop_d/main.dart';

mixin AppLocale {
  static const String appName = 'appName';
  static const String products = 'products';
  static const String categories = 'categories';
  static const String home = 'home';
  static const String profile = 'profile';
  static const String cart = 'cart';
  static const String orders = 'orders';
  static const String orderDetailes = 'orderDetailes';
  static const String checkout = 'checkout';
  static const String topRating = 'topRating';
  static const String name = 'name';
  static const String phone = 'phone';
  static const String email = 'email';
  static const String password = 'password';
  static const String signup = 'signup';
  static const String signin = 'signin';
  static const String addToCart = 'addToCart';
  static const String titleSignin = 'titleSignin';
  static const String titleSignup = 'titleSignup';
  static const String subTitleSignin = 'subTitleSignin';
  static const String subTitleSignup = 'subTitleSignup';
  static const String searchingCateg = 'searchingCateg';
  static const String searchingProd = 'searchingProd';
  static const String searchingCust = 'searchingCust';
  static const String searchingOrder = 'searchingOrder';
  static const String hi = 'hi';
  static const String description = 'description';
  static const String price = 'price';
  static const String flavor = 'flavor';
  static const String size = 'size';
  static const String rating = 'rating';
  static const String forgotPass = 'forgotPass';
  static const String haveAccount = 'haveAccount';
  static const String notHaveAccount = 'notHaveAccount';
  static const String waringEmail = 'waringEmail';
  static const String waringName = 'waringName';
  static const String notTrueEmail = 'notTrueEmail';
  static const String waringPass = 'waringPass';
  static const String or = 'or';
  static const String signinSuccess = 'signinSuccess';
  static const String signupSuccess = 'signupSuccess';
  static const String save = 'save';
  static const String addedToCart = 'addedToCart';
  static const String notAddedToCart = 'notAddedToCart';
  static const String notSelectPhoto = 'notSelectPhoto';
  static const String cartTotalPrice = 'cartTotalPrice';
  static const String cartTotalQutityn = 'cartTotalQutityn';
  static const String placeOrder = 'placeOrder';
  static const String infoCart = 'infoCart';
  static const String ok = 'ok';
  static const String withDelevieryTitle = 'withDelevieryTitle';
  static const String withDelevieryInfo = 'withDelevieryInfo';
  static const String withDeleviery = 'withDeleviery';
  static const String payMethod = 'payMethod';
  static const String mtn = 'mtn';
  static const String syriatel = 'syriatel';
  static const String bank = 'bank';
  static const String cash = 'cash';
  static const String yourLocation = 'yourLocation';
  static const String next = 'next';
  static const String duration = 'duration';
  static const String cartPrice = 'cartPrice';
  static const String deliveryPrice = 'deliveryPrice';
  static const String totalPrice = 'totalPrice';
  static const String accountPay = 'accountPay';
  static const String confirmPay = 'confirmPay';
  static const String distance = 'distance';
  static const String second = 'second';
  static const String minute = 'minute';
  static const String hour = 'hour';

  static const String meter = 'meter';
  static const String successPay = 'successPay';
  static const String checkOnFields = 'CheckOnFields';
  static const String oneStep = 'oneStep';
  static const String twoStep = 'twoStep';
  static const String threeStep = 'threeStep';
  static const String fourStep = 'fourStep';
  static const String doYouSure = 'doYouSure';
  static const String timeLeft = 'timeLeft';
  static const String orderNumber = 'Order Number';

  static const String prepearing = 'prepearing';
  static const String delivered = 'delivered';
  static const String finish = 'finish';

  static const String rateProduct = 'rateProduct';
  static const String goToOrdersPage = 'goToOrdersPage';

  static const String manage = 'manage';
  static const String dashboard = 'dashboard';
  static const String customers = 'customers';
  static const String driveres = 'driveres';
  static const String settings = 'settings';
  static const String reports = 'reports';

  static const String totalCustomers = 'totalCustomers';
  static const String totalOrders = 'totalOrders';
  static const String totalDrivers = 'totalDrivers';
  static const String totalProducts = 'totalProducts';
  static const String totalRenvues = 'totalRenvues';

  static const String viewAllProducts = 'viewAllProducts';

  static const String customerId = 'customerId';
  static const String customerName = 'customerName';
  static const String customerEmail = 'customerEmail';
  static const String customerMobile = 'customerMobile';

  static const String orderId = 'orderId';
  static const String ordercreatedAt = 'ordercreatedAt';
  static const String paid = 'paid';
  static const String quntity = 'quntity';
  static const String paidStatus = 'paidStatus';
  static const String user = 'user';
  static const String status = 'status';
  static const String priceExtesion = 'priceExtesion';
  static const String priceDelivery = 'priceDelivery';

  static const String register = 'register';
  static const String notRegister = 'notRegister';

  static const String yourcartInOrder = 'yourCartInThisOrder';
  static const String done = 'done';
  static const String syp = 'syp';
  static const String aboutThisFood = 'aboutThisFood';
  static const String needDelivery = 'needDelivery';
  

  static Map<String, dynamic> en = {
    appName: 'Sweety',
    products: 'Products',
    categories: 'Categories',
    home: 'Home',
    profile: 'Profile',
    cart: 'Cart',
    orders: 'Orders',
    orderDetailes: 'Order Detailes',
    checkout: 'Checkout',
    topRating: 'Top Rating',
    name: 'Name',
    phone: 'Phone Number',
    email: 'E-mail',
    password: 'Password',
    signup: 'Signup',
    signin: 'Signin',
    addToCart: 'Addt to cart',
    titleSignin: 'Welcome back',
    titleSignup: 'Create an account',
    subTitleSignin:
        'craving something sweet? Login to satisfy your sweet cravings.',
    subTitleSignup: 'to join our community and enjoy with sweets',
    searchingCateg: 'Searching on Categories ...',
    searchingProd: 'Searching on Products ...',
    searchingCust: 'Searching on Customers ...',
    searchingOrder: 'Searching on Orders ...',
    hi: 'Hi',
    description: 'Description',
    price: 'Price',
    flavor: 'Flavor',
    size: 'Size',
    rating: 'Rating',
    forgotPass: 'Forgot Password',
    haveAccount: 'You have an account?',
    notHaveAccount: 'Don\'t have an account?',
    waringEmail: 'Please enter E-mail',
    waringName: 'The name must be more than 3 letters',
    notTrueEmail: 'Please enter a vaild E-mail',
    waringPass: 'The password must be more than 8 letters',
    or: 'or',
    signinSuccess: 'Registered Successfully',
    signupSuccess: 'Logged Successfully',
    save: 'Save',
    addedToCart: 'Added Successfully',
    notAddedToCart: 'you did not select the size and price',
    notSelectPhoto: 'Not Selected Photo',
    cartTotalPrice: 'Cart Total Price is : ',
    cartTotalQutityn: 'Cart Total Qutityntity is : ',
    placeOrder: 'Place Order',
    ok: 'Okay',
    infoCart: 'Swap the item for right to delete it',
    withDelevieryTitle: 'The Deleviery',
    withDeleviery: 'With Deleviery',
    withDelevieryInfo:
        'Would you like the products to be delivered to a specific location ? \n choose a location from map',
    payMethod: 'Pay Method',
    mtn: 'Mtn',
    syriatel: 'Syriatel',
    bank: 'Bank',
    cash: 'Cash',
    yourLocation: 'Your Location : ',
    next: 'Next',
    duration: 'Time expected of delivery',
    cartPrice: 'Cart Price is :',
    deliveryPrice: 'Delivery cost is :',
    totalPrice: 'Total price',
    accountPay: 'Account number',
    confirmPay: 'Confirm',
    distance: 'Approximate Distance',
    second: 'Second',
    minute: 'Minute',
    hour: 'Hour',
    meter: 'Meter',
    successPay: 'Paid Successfully',
    checkOnFields: 'Check on fields!!',
    oneStep: 'One Step',
    twoStep: 'Two Step',
    threeStep: 'Three Step',
    fourStep: 'Four Step',
    doYouSure: 'Do you sure ?',
    timeLeft: 'Time Left',
    orderNumber: 'Time Left',
    prepearing: 'Preparation',
    delivered: 'Delivery',
    finish: 'Completed',
    rateProduct: 'Rate Product',
    goToOrdersPage: 'Go to orders page',
    manage: 'Manage',
    dashboard: 'Dashboard',
    customers: 'Customers',
    driveres: 'Driveres',
    settings: 'Settings',
    reports: 'Reports',
    totalCustomers: 'Total Customers',
    totalOrders: 'Total Orders',
    totalDrivers: 'Total Drivers',
    totalProducts: 'Total Products',
    totalRenvues: 'Total Renvues',
    viewAllProducts: 'View All Products In This Category',
    customerId: 'Customer ID',
    customerName: 'Customer Name',
    customerEmail: 'Customer Email',
    customerMobile: 'Customer Mobile',
    orderId: 'Order Id',
    ordercreatedAt: 'Order Created At',
    paid: 'Is Paid',
    paidStatus: 'Paid Status',
    user: 'User',
    status: 'Status',
    priceExtesion: 'Price Extesion',
    priceDelivery: 'Price Delivery',
    register: 'Registered',
    notRegister: 'Not Registered',
    yourcartInOrder: 'Your cart in this order',
    quntity: 'Quntity',
    done: 'Done',
    syp: 'SYP',
    aboutThisFood: 'About this product',
    needDelivery: 'Need Delivery',
  };

  static Map<String, dynamic> ar = {
    appName: 'Sweety',
    products: 'المنتجات',
    categories: 'الأصناف',
    home: 'الرئيسية',
    profile: 'ملفي',
    cart: 'السلة',
    orders: 'الطلبات',
    orderDetailes: 'تفاصيل الطلب',
    checkout: 'تأكيد الطلب',
    topRating: 'الأعلى تقييما',
    name: 'الاسم',
    phone: 'رقم الهاتف',
    email: 'الإيميل',
    password: 'كلمة المرور',
    signup: 'إنشاء حساب',
    signin: 'تسجيل دخول',
    addToCart: ' إضافة للسلة',
    titleSignin: 'أهلاً بعودتك',
    titleSignup: 'أنشئ حساب',
    subTitleSignin: 'لديك شغف لتذوق الحلوى ؟  ماذا تنتظر سجل دخول واستمتع.',
    subTitleSignup: 'انضم إلى مجتمعنا واستمتع بطعمم الحلويات',
    searchingCateg: ' ... ابحث عن الأصناف ',
    searchingProd: ' ... ابحث عن المنتجات ',
    searchingCust: ' ... ابحث عن الزبائن ',
    searchingOrder: ' ... ابحث عن الطلبات ',
    hi: 'مرحبا',
    description: 'الوصف',
    price: 'السعر',
    flavor: 'النكهة',
    size: 'الحجم',
    rating: 'التقييم',
    forgotPass: 'نسيت كلمة المرور',
    haveAccount: 'هل لديك حساب؟',
    notHaveAccount: 'لا تمتلك حساب؟',
    waringEmail: 'من فضلك أدخل الإيميل',
    waringName: 'الاسم يجب ألّا يقل عن 3 أحرف',
    notTrueEmail: 'من فضلك أدخل إيميل صحيح',
    or: 'أو',
    waringPass: 'كلمة المرور يجب ألّا تقل عن 8 أحرف',
    signupSuccess: 'تم إنشاء الحساب بنجاح',
    signinSuccess: 'تم تسجيل الدخول بنجاح',
    save: 'حفظ',
    addedToCart: 'تمت إضافة المنتج للسلة',
    notAddedToCart: 'لم تقم باختيار الحجم والسعر',
    notSelectPhoto: 'لم تقم باختيار الصورة',
    cartTotalPrice: 'سعر السلة الكلي : ',
    cartTotalQutityn: 'كمية السلة الكلية : ',
    placeOrder: 'وضع الطلب ',
    ok: 'حسنا',
    infoCart: 'اسحب العنصر نحو اليمين لحذفه من السلة',
    withDelevieryTitle: 'التوصيل',
    withDeleviery: 'مع توصيل',
    withDelevieryInfo:
        'هل تريد توصيل المنتجات لموقع محدد ؟ \nاختر موقعا من الخريطة',
    payMethod: 'طريقة الدفع',
    mtn: 'ام تي ان',
    syriatel: 'سيريتل',
    bank: 'بنك',
    cash: 'نقدي',
    yourLocation: 'موقعك : ',
    next: 'التالي',
    duration: 'الزمن المتوقع للتوصيل',
    cartPrice: 'سعر السلة هو :',
    deliveryPrice: 'تكلفة التوصيل هي :',
    totalPrice: 'السعر الإجمالي',
    accountPay: 'رقم الحساب',
    confirmPay: 'تأكيد',
    distance: 'المسافة التقريبية',
    second: 'ثانية',
    minute: 'دقيقة',
    hour: 'ساعة',
    meter: 'متر',
    successPay: 'تم الدفع بنجاح',
    checkOnFields: 'تحقق من جميع الحقول',
    oneStep: 'الخطوة الأولى',
    twoStep: 'الخطوة الثانية',
    threeStep: 'الخطوة الثالثة',
    fourStep: 'الخطوة الرابعة',
    doYouSure: 'هل أنت متأكد ؟',
    timeLeft: 'الوقت المتبقي',
    orderNumber: 'رقم الطلب',
    prepearing: 'تحضير',
    delivered: 'توصيل',
    finish: 'مكتمل',
    rateProduct: 'قيم المنتج',
    goToOrdersPage: 'اذهب لصفحة الطلبات',
    manage: 'الإدارة',
    dashboard: 'لوحة التحكم',
    customers: 'الزبائن',
    driveres: 'السائقين',
    settings: 'الإعدادات',
    reports: 'التقارير',
    totalCustomers: 'إجمالي عدد   الزبائن',
    totalOrders: 'إجمالي عدد الطلبات',
    totalDrivers: 'إجمالي عدد السائقين',
    totalProducts: 'إجمالي عدد المنتجات',
    totalRenvues: 'إجمالي الإيرادات',
    viewAllProducts: 'عرض جميع المنتجات في هذا الصنف',
    customerId: 'رقم الزبون',
    customerName: 'اسم الزبون',
    customerEmail: 'إيميل الزبون',
    customerMobile: 'هاتف الزبون',
    orderId: 'رقم الطلب',
    ordercreatedAt: 'تاريخ الطلب',
    paid: 'تم الدفع',
    paidStatus: 'طريقة الدفع',
    user: 'المستخدم',
    status: 'الحالة',
    priceExtesion: 'سعر إضافي',
    priceDelivery: 'سعر التوصيل',
    register: 'مُسجَّل',
    notRegister: 'ليس مُسجَّل',
    yourcartInOrder: 'سلتك في هذا الطلب',
    quntity: 'الكمية',
    done: 'تم',
    syp: "ل.س",
    aboutThisFood: 'حول هذا المنتج',
    needDelivery: 'بحاجة توصيل',
  };

  static Map<String, dynamic> all = {'en': en, 'ar': ar};

  static dynamic get(String key) {
    return all[localization.currentLocale?.languageCode]?[key] ?? key;
  }
}
