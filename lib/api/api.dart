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
    Map<String, dynamic> responceBody = {"email": email, "password": password};
    var responce = await http.post(url, body: responceBody);
    return responce;
  }

  Future<http.Response> googleLogin(String email) async {
    var url = Uri.parse(urls.ApiConstants.login_url);
    Map<String, dynamic> responceBody = {"email": email};
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

  Future<http.Response> changeUser(
      String token, String oldEmail, String newEmail, String name) async {
    var url = Uri.parse(urls.ApiConstants.changeUser_url);
    Map<String, String> body;
    if (oldEmail == newEmail) {
      body = {'email': newEmail, 'name': name};
    } else {
      body = {'email': oldEmail, 'new_email': newEmail, 'name': name};
    }
    final responce = await http.post(url,
        headers: {'Authorization': 'Bearer $token'}, body: body);
    return responce;
  }

  Future<http.Response> changePassword(
      String token, String email, String password) async {
    var url = Uri.parse(urls.ApiConstants.changeUser_url);
    final responce = await http.post(url,
        headers: {'Authorization': 'Bearer $token'},
        body: {'email': email, 'password': password});
    return responce;
  }
}
