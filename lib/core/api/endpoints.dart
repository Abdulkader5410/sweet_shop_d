class EndPoints {
  //base url
  static String baseUrl = "https://sweet-shop-main.vercel.app/api/v1.0.0/";

  //user endpoint
  static String signup = "users/signup";
  static String login = "users/login";
  static String forgotPassword = "users/forgotPassword";
  static String logout = "users/logout";
  static String resetPassword = "users/resetPassword";
  static String updateMe = "users/updateMe";
  static String updateMyPassword = "users/updateMyPassword";
  static String me = "users/me";
  static String deleteMe = "users/deleteMe";
  static String users = "users";
  static String activeMe = "users/activeMe";
  static String delivery = "delivery/";

  //categories endpoint
  static String categories = "categuries/";
  static String category = "categurie";

  //products endpoint
  static String products = "products";

  static String carts = "carts/";
  static String user = "user/";
  static String order = "orders/";

  //order endpoint
  static String orders = "orders/";
  static String myAllOrder = "orders/me";
  static String workMe = "work_me";

  //review product
  static String review = "reviews/product/";

  //locations
  static String location = "locations/";

  static String addUser = "${EndPoints.users}add";
  // static String addCart = "${EndPoints.cart}add";
  static String updateCart = "${EndPoints.carts}/";
  static String deleteCart = "${EndPoints.carts}/";

  static String getUserEndPoint(int id) {
    return "${EndPoints.baseUrl}users/$id";
  }

  // static String getProByCategEndPoint(String name) {
  //   return "${EndPoints.baseUrl}${EndPoints.products}${EndPoints.category}$name";
  // }
}

class ApiKey {
  static String token = "token";
  static String refreshToken = "refreshToken";
  static String statusCode = "status";
  static String errorMessage = "ErrorMessage";
  static String id = "id";
  static String email = "email";
  static String phone = "phone";
  static String photo = "photo";
  static String password = "password";
  static String name = "name";
  static String image = "image";
  static String username = "username";
  static String firstName = "firstName";
  static String lastName = "lastName";
  static String gender = "gender";
  static String price = "price";
  static String review = "review";
  static String rating = "rating";
  static String product = "product";
}
