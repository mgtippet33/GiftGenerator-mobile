import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gift_generator/api/api.dart';
import 'package:gift_generator/pages/loginPage.dart';
import 'package:gift_generator/services/auth_service.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:gift_generator/models/User.dart' as myUser;

class AuthBloc {
  final authService = AuthService();
  final googleSignIn = GoogleSignIn(scopes: ['email', 'profile']);

  Stream<User> get currentUser => authService.currentUser;

  loginGoogle(context) async {
    try {
      final GoogleSignInAccount googleUser = await googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
        accessToken: googleAuth.accessToken,
      );

      // Firebase Sign in
      final result = await authService.signInWithCredential(credential);


    } catch (error) {
      print(error);
    }
  }

  signUpGoogle(context) async {
    try {
      final GoogleSignInAccount googleUser = await googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
        accessToken: googleAuth.accessToken,
      );

      // Firebase Sign in
      final result = await authService.signInWithCredential(credential);

      myUser.User newUser = new myUser.User(
          "",
          result.user.displayName,
          result.user.email,
          null,
          false,
          0);

      final responce = await ApiManager().googleRegister(newUser);
      if (responce.statusCode == 200) {
        print("success reg google");
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => LoginPage()));
        _showDialog(context, Text("Ви успішно зареєстровані!",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),));
      }

    } catch (error) {
      print(error);
    }
  }

  logout() {
    authService.logout();
  }

  Future<Null> _showDialog(context, Text x) async {
    await showDialog<String>(
        context: context,
        builder: (BuildContext context) {
          return new AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            backgroundColor: Color(0xFFF8F8F8),
            title: Center(child: x),
            contentPadding: EdgeInsets.all(5.0),
            actions: <Widget>[
              new FlatButton(
                child: new Text("ОК",
                    style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 22,
                        fontWeight: FontWeight.w600)),
                onPressed: () async {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }
}
