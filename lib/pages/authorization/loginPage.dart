import 'dart:async';
import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gift_generator/blocs/auth_bloc.dart';
import 'package:gift_generator/models/UserHandler.dart';
import 'package:gift_generator/pages/authorization/register.dart';
import 'package:gift_generator/pages/account/cabinet.dart';
import 'package:gift_generator/themeModel.dart';
import 'package:gift_generator/api/api.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:gift_generator/models/User.dart' as myUser;
import 'package:shared_preferences/shared_preferences.dart';


import '../home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  _MyStatefulLoginPageWidgetState createState() =>
      _MyStatefulLoginPageWidgetState();
}

class _MyStatefulLoginPageWidgetState extends State<LoginPage> {
  StreamSubscription<User> loginStateSubscription;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isHidden = true;
  Future<User> _currentUser = null;
  String _email = "";
  String _pass = "";

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  @override
  void dispose() {
    loginStateSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authBloc = Provider.of<AuthBloc>(context);
    return Scaffold(
        appBar: NewGradientAppBar(
            title: Text('Gift Generator'),
            gradient:
                LinearGradient(colors: [Color(0xff90B6EF), Color(0xff4B81C3)]),
            automaticallyImplyLeading: false),
        body: FutureBuilder(
          future: _currentUser,
          builder: (context, snapshot) {
            return Form(
              key: _formKey,
              child: Container(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 30, bottom: 40),
                        child: Center(
                          child: Text(
                            "Welcome!",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 24),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 50),
                        child: Center(
                          child: Image.asset("assets/logo.png"),
                        ),
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 20, right: 20),
                            child: TextFormField(
                              decoration: const InputDecoration(
                                hintText: 'Електрона пошта',
                              ),
                              autofocus: false,
                              validator: (String value) {
                                if (value == null || value.isEmpty) {
                                  return 'Введіть електрону пошту';
                                }
                                return null;
                              },
                              onSaved: (String value) {
                                _email = value;
                              },
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 20, right: 20),
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: 'Пароль',
                                suffix: InkWell(
                                  onTap: _togglePasswordView,
                                  child: Icon(
                                    _isHidden
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: Colors.black54,
                                    size: 21,
                                  ),
                                ),
                              ),
                              obscureText: _isHidden,
                              autofocus: false,
                              validator: (String value) {
                                if (value == null || value.isEmpty || value.length < 4) {
                                  return 'Введіть пароль';
                                }
                                return null;
                              },
                              onSaved: (String value) {
                                _pass = value;
                              },
                            ),
                          ),
                          /*Padding(
                        padding: EdgeInsets.only(right: 20),
                        child: Align(
                          alignment: Alignment.topRight,
                          child: Text("Відновити пароль"),
                        ),
                      ),*/
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 16.0, horizontal: 20),
                                child: OutlineButton(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 55, vertical: 15),
                                  color: Color(0xff3D99DF),
                                  focusColor: Color(0xff3D99DF),
                                  textColor: Color(0xff3D99DF),
                                  shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                          color: Color(0xff3D99DF),
                                          width: 1,
                                          style: BorderStyle.solid),
                                      borderRadius:
                                          new BorderRadius.circular(10.0)),
                                  onPressed: () {
                                    if (_formKey.currentState.validate()) {
                                      _formKey.currentState.save();
                                      setState(() {
                                        ApiManager().signIn(_email, _pass).then((value){
                                          if (value.statusCode == 200) {
                                            var data = json.decode(value.body);
                                            var token = data["token"];
                                            ApiManager().getUser(token).then((value){
                                              if(value.statusCode == 200) {
                                                var data = json.decode(value.body);
                                                var userData = data["data"][0];
                                                List<int> encoded = Latin1Codec().encode(userData['name']);
                                                String decoded = utf8.decode(encoded);
                                                userData['name'] = decoded;
                                                userData["token"] = token;
                                                userData["email"] = _email;
                                                userData["googleSignIn"] = false;
                                                myUser.User user = myUser.User.fromJson(userData);
                                                UserHandler(user);
                                                SharedPreferences.getInstance().then((prefs) {
                                                  prefs.setString('userToken', user.token);
                                                  prefs.setString('email', _email);
                                                  prefs.setBool('googleSignIn', false);
                                                });
                                                Navigator.push(
                                                    context,
                                                    PageTransition(
                                                        type: PageTransitionType.fade,
                                                        child: Cabinet()));
                                              }
                                            });
                                            print("Success");
                                          }
                                          else {
                                            var text = Text(
                                                "Невірний email або пароль.\nПеревірте введені дані!",
                                                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),);
                                            _showDialog(text);
                                            print("Error"); //пользователь не найден
                                          }

                                        });
                                      });
                                    }
                                  },
                                  child: const Text('ВХІД'),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 16.0),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 40, vertical: 15),
                                      primary: Color(0xff3D99DF),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              new BorderRadius.circular(10.0))),
                                  onPressed: () {
                                    /*Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => SecondRoute()),
                                );*/
                                    Navigator.push(
                                        context,
                                        PageTransition(
                                            type: PageTransitionType.fade,
                                            child: Registration()));
                                  },
                                  child: const Text('РЕЄСТАРЦІЯ'),
                                ),
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 16.0, horizontal: 20),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 40, vertical: 15),
                                  shadowColor: Colors.black,
                                  primary: Colors.white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          new BorderRadius.circular(10.0))),
                              onPressed: () => authBloc.loginGoogle(context),
                              child: Row(children: [
                                Image.asset(
                                  "assets/google.png",
                                  height: 40,
                                ),
                                Text(
                                  'Авторизуватися через google',
                                  style: TextStyle(color: Colors.black54),
                                ),
                              ]),
                            ),
                          ),
                        ],
                      ),
                      Center(
                        child: RaisedButton(
                            child: Text("Change Theme"),
                            onPressed: () {
                              Provider.of<ThemeModel>(context).toggleTheme();
                            }),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
        ));
  }

  Future<Null> _showDialog(Text x) async {
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
                    style: TextStyle(fontFamily: 'Roboto',
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
