import 'package:task/Shared/http_helper.dart';

class WebServices{

  static Future<Map<String,dynamic>> getProducts() async {
    return await HttpHelper.repo("products","get");
  }
}