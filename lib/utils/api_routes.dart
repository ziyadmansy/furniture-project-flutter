mixin ApiRoutes {
  ////////////////////? API URL ?////////////////////
  static const String baseUrl = "https://homefurniture00.000webhostapp.com";
  static const String api = "$baseUrl/api";

  ////////////////////? Auth ?////////////////////
  static const String login = "$api/login";
  static const String register = "$api/register";
  static const String logout = "$api/logout";

  ////////////////////? App ?////////////////////
  static const String products = "$api/products";
  static String product(int id) => "$api/products/$id";

  static const String posts = "$api/posts";
  static String post(int id) => "$api/posts/$id";

  static const String categories = "$api/categories";
  static const String rating = "$api/Rating";
  static const String orders = "$api/orders";
  static const String items = "$api/items";

  static const String contacts = "$api/contacts";
  static String contact(int id) => "$api/contacts/$id";

  static const String media = "$api/media";
  static const String imgs = "$api/productimage";

  static String portfolio(int id) => "$api/portfolio/$id";
}
