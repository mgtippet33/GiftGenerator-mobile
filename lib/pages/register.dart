import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';

class Registration extends StatefulWidget {
  const Registration({Key key}) : super(key: key);

  @override
  _RegisterPageWidgetState createState() => _RegisterPageWidgetState();
}

class _RegisterPageWidgetState extends State<Registration> {
  bool _isHiddenPassword = true;
  bool _isHiddenPasswordConfirmation = true;
  bool isChecked = true;
  var _successfullyRegistered = "";

  void _togglePasswordView() {
    setState(() {
      _isHiddenPassword = !_isHiddenPassword;
    });
  }

  void _togglePasswordConfirmationView() {
    setState(() {
      _isHiddenPasswordConfirmation = !_isHiddenPasswordConfirmation;
    });
  }

  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.blue;
    }
    return Colors.black54;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NewGradientAppBar(
        centerTitle: true,
        title: Text("Registration"),
        gradient:
        LinearGradient(colors: [Color(0xff90B6EF), Color(0xff4B81C3)]),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 30, bottom: 40),
                child: Center(
                  child: Text(
                    "Welcome!",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
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
                        if (value == null ||
                            value.isEmpty ||
                            value.length < 5) {
                          return 'Please enter some text';
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
                            _isHiddenPassword
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.black54,
                            size: 21,
                          ),
                        ),
                      ),
                      obscureText: _isHiddenPassword,
                      autofocus: false,
                      validator: (String value) {
                        if (value == null ||
                            value.isEmpty ||
                            value.length < 5) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Підтвердіть пароль',
                        suffix: InkWell(
                          onTap: _togglePasswordConfirmationView,
                          child: Icon(
                            _isHiddenPasswordConfirmation
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.black54,
                            size: 21,
                          ),
                        ),
                      ),
                      obscureText: _isHiddenPasswordConfirmation,
                      autofocus: false,
                      validator: (String value) {
                        if (value == null ||
                            value.isEmpty ||
                            value.length < 5) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Checkbox(
                          checkColor: Colors.white,
                          fillColor:
                          MaterialStateProperty.resolveWith(getColor),
                          value: isChecked,
                          onChanged: (bool value) {
                            setState(() {
                              isChecked = !isChecked;
                            });
                          },
                        ),
                      ),
                      Text(
                        'Я ознайомлен(а) та погоджуюсь з',
                        style: TextStyle(color: Colors.black54),
                      ),
                    ],
                  ),
                  Text(
                    'Політикою конфіденціальності',
                    style: TextStyle(color: Colors.cyan),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _successfullyRegistered = "ви успішно зареєстровані";
                        });
                      },
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                              horizontal: 100, vertical: 15),
                          primary: Color(0xff3D99DF),
                          shape: RoundedRectangleBorder(
                              borderRadius:
                              new BorderRadius.circular(10.0))),
                      child: const Text('Зареєструватися'),
                    ),
                  ),
                  Text(
                    _successfullyRegistered,
                    style: TextStyle(color: Colors.green),
                  ),
                  //TODO optional add logic for registration with google button
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 5.0, horizontal: 20),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                              horizontal: 40, vertical: 15),
                          shadowColor: Colors.black,
                          primary: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(10.0))),
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
            ],
          ),
        ),
      ),
    );
  }
}
