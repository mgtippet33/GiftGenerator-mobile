import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gift_generator/api/api.dart';
import 'package:gift_generator/models/UserHandler.dart';
import 'package:gift_generator/pages/cabinet.dart';
import 'package:gift_generator/pages/loginPage.dart';
import 'package:gift_generator/services/auth_service.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:gift_generator/models/User.dart' as myUser;
import 'package:shared_preferences/shared_preferences.dart';

class AuthBloc {
  final authService = AuthService();
  final googleSignIn = GoogleSignIn(scopes: ['email', 'profile']);

  Stream<User> get currentUser => authService.currentUser;

  loginGoogle(context) async {
    try {
      final GoogleSignInAccount googleUser = await googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
        accessToken: googleAuth.accessToken,
      );

      // Firebase Sign in
      final result = await authService.signInWithCredential(credential);
      var response = await ApiManager().googleLogin(result.user.email);
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        var token = data["token"];
        ApiManager().getUser(token).then((value) {
          if (value.statusCode == 200) {
            var data = json.decode(value.body);
            var userData = data["data"][0];
            List<int> encoded = Latin1Codec().encode(userData['name']);
            String decoded = utf8.decode(encoded);
            userData['name'] = decoded;
            userData["token"] = token;
            userData["email"] = result.user.email;
            userData["googleSignIn"] = true;
            myUser.User user = myUser.User.fromJson(userData);
            UserHandler(user);
            SharedPreferences.getInstance().then((prefs) {
              prefs.setString('userToken', user.token);
              prefs.setString('email', result.user.email);
              prefs.setBool('googleSignIn', true);
            });
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => Cabinet()));
            print("Success login");
          }
        });
      } else {
        var profile = result.user;
        myUser.User newUser =
            myUser.User("", profile.displayName, profile.email, "", false, 0, true);
        ApiManager().googleRegister(newUser).then((value) {
          if (value.statusCode == 200) {
            ApiManager().googleLogin(profile.email).then((value){
              if(value.statusCode == 200) {
                var data = json.decode(value.body);
                var token = data["token"];
                ApiManager().getUser(token).then((value) {
                  if (value.statusCode == 200) {
                    var data = json.decode(value.body);
                    var userData = data["data"][0];
                    List<int> encoded = Latin1Codec().encode(userData['name']);
                    String decoded = utf8.decode(encoded);
                    userData['name'] = decoded;
                    userData["token"] = token;
                    userData["email"] = result.user.email;
                    userData["googleSignIn"] = true;
                    myUser.User user = myUser.User.fromJson(userData);
                    UserHandler(user);
                    SharedPreferences.getInstance().then((prefs) {
                      prefs.setString('userToken', user.token);
                      prefs.setString('email', result.user.email);
                      prefs.setBool('googleSignIn', true);
                    });
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) => Cabinet()));
                    print("Success register");
                  }
                });
              }
            });

          }
        });
      }
    } catch (error) {
      print(error);
    }
  }

  logout() {
    authService.logout();
  }
}
