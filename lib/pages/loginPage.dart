import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gift_generator/blocs/auth_bloc.dart';
import 'package:gift_generator/pages/register.dart';
import 'package:gift_generator/pages/cabinet.dart';
import 'package:gift_generator/themeModel.dart';

import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import 'home.dart';

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

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  @override
  void initState() {
    var authBloc = Provider.of<AuthBloc>(context, listen: false);
    loginStateSubscription = authBloc.currentUser.listen((fbuser) {
      if (fbuser != null) {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => HomeScreen()));
      }
    });
    super.initState();
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
        body: Form(
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
                            if (value == null || value.isEmpty) {
                              return 'Введіть пароль';
                            }
                            return null;
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
                                // if (_formKey.currentState.validate()) {
                                  // Process data.

                                  Navigator.push(
                                      context,
                                      PageTransition(
                                          type: PageTransitionType.fade,
                                          child: Cabinet()));
                                // }
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
                          onPressed: () => authBloc.loginGoogle(),
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
                          Provider.of<ThemeModel>(context, listen: false).toggleTheme();
                        }),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
