import 'package:task/Config/config.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HttpHelper{
  static Future<Map<String,dynamic>> repo(String endPoint,String type,{formData})async{
    http.Response response = type=="post"?await http.post(Config.setApi(endPoint),body: formData):await http.get(Config.setApi(endPoint));
    print(response.body);
    Map<String,dynamic> mapResponse = jsonDecode(response.body);
    return mapResponse;
  }

}