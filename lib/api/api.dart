import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:gift_generator/models/User.dart';
import '../constants/ApiConstants/apiConstants.dart' as urls;

class ApiManager {
  Future<http.Response> simpleRegister(User user) async {
    var url = Uri.parse(urls.ApiConstants.register_url_local);
    Map<String, dynamic> responceBody = {
      "email": user.email,
      "password": user.password
    };
    print(responceBody);
    var responce = await http.post(url, body: responceBody);
    return responce;
  }
}
