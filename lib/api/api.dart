import 'dart:async';
import 'dart:convert';

import 'package:gift_generator/models/Gift.dart';
import 'package:gift_generator/models/Interest.dart';
import 'package:gift_generator/models/Notification.dart';
import 'package:gift_generator/models/NotificationHandler.dart';
import 'package:gift_generator/models/User.dart';
import 'package:gift_generator/models/UserHistoryModel.dart';
import 'package:http/http.dart' as http;

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

  Future<http.Response> setPremium(String token, String email) async {
    var url = Uri.parse(urls.ApiConstants.changeUser_url);
    final responce = await http.post(url,
        headers: {'Authorization': 'Bearer $token'},
        body: {'email': email, 'premium': "1"});
    return responce;
  }

  Future<List<Gift>> searchGifts(String email, String gender, int age,
      String link, String holiday, String interests) async {
    List<Gift> content = null;
    var url = Uri.parse(urls.ApiConstants.searchGifts_url);
    Map<String, dynamic> searchData = {
      "email": email,
      "gender": gender,
      "age": age.toString(),
      "link": link != null ? link : "null",
      "holiday": holiday,
      "interests": interests != null ? interests : "null"
    };
    final responce = await http.post(url, body: searchData);
    if (responce.statusCode == 200) {
      var data = json.decode(responce.body);
      var searchData = data["data"] as List;
      content = searchData.map<Gift>((json) => Gift.fromJson(json)).toList();
    }
    return content;
  }

  Future<UserHistoryModel> getHistory(String token, String email) async {
    UserHistoryModel content = null;
    var url = Uri.parse(urls.ApiConstants.getHistory_url);
    final responce = await http.post(url,
        headers: {'Authorization': 'Bearer $token'}, body: {"email": email});
    if (responce.statusCode == 200) {
      var data = json.decode(responce.body);
      Map<String, dynamic> historyData = {
        "holiday": data['data']['holiday'],
        "date": data['data']['date'],
        'age': data['data']['age'],
        'link': data['data']['link'],
        'gender': data['data']['gender'],
        'criteria': data['data']['criteria'],
        'presents': data['data']['presents']
      };
      content = UserHistoryModel.fromJson(historyData);
    }
    else {
      content = UserHistoryModel(null, null, null, null, null, null, null, null);
    }
    return content;
  }

  void getNotification(String email) async {
    List<HolidayNotification> content = null;
    var url = Uri.parse(urls.ApiConstants.getNotification_url);
    final responce = await http.post(url,
        body: {"email": email});
    if (responce.statusCode == 200) {
      var data = json.decode(responce.body);
      var notification = data['data']['holidays'].toList();
      if(notification.length == 0) {
        content.add(null);
      } else {
        content = notification.map<HolidayNotification>((json) =>
            HolidayNotification.fromJson(json)).toList();
      }
      NotificationHandler(content);
    }
  }
}
