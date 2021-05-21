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
    var responce = await http.post(url, body: responceBody);
    return responce;
  }

  Future<http.Response> signIn(String email, String password) async {
    var url = Uri.parse(urls.ApiConstants.login_url);
    Map<String, dynamic> responceBody = {
      "email": email,
      "password": password
    };
    var responce = await http.post(url, body: responceBody);
    return responce;
  }

  Future<http.Response> googleLogin(String email) async {
    var url = Uri.parse(urls.ApiConstants.login_url);
    Map<String, dynamic> responceBody = {
      "email": email
    };
    var responce = await http.post(url, body: responceBody);
    return responce;
  }

  Future<http.Response> getUser(String token) async {
    var url = Uri.parse(urls.ApiConstants.getUser_url);
    final responce = await http.get(url, headers: {
      'Authorization': 'Bearer $token',
    });
    return responce;
  }
}
