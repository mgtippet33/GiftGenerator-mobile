import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:gift_generator/models/User.dart';
import '../constants/ApiConstants/apiConstants.dart' as urls;

class ApiManager {
  Future<http.Response> register(User user) async {
    var url = Uri.parse(urls.ApiConstants.register_url);
    Map<String, dynamic> responceBody = {
      "email": user.email,
      "password": user.password
    };
    var responce = await http.post(url, body: responceBody);
    return responce;
  }

  Future<http.Response> googleRegister(User user) async {
    var url = Uri.parse(urls.ApiConstants.register_url);
    Map<String, dynamic> responceBody = {
      "email": user.email,
      "name": user.name
    };
    print(responceBody);
    var responce = await http.post(url, body: responceBody);
    return responce;
  }

  // Future<http.Response> getUser() async {
  //   var url = Uri.parse(urls.ApiConstants.getUser_url);
  //   var responce = await http.post(url, body: {"userId" : userId});
  //   return responce;
  // }
}
