import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gift_generator/api/api.dart';
import 'package:gift_generator/models/User.dart';
import 'package:gift_generator/pages/loginPage.dart';
import 'package:gift_generator/services/validator.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import 'package:gift_generator/models/RegistrationData.dart';

class Registration extends StatefulWidget {
  const Registration({Key key}) : super(key: key);

  @override
  _RegisterPageWidgetState createState() => _RegisterPageWidgetState();
}

class _RegisterPageWidgetState extends State<Registration> {
  final GlobalKey<FormState> _formKey = new GlobalKey();
  final RegistrationData _registrationData = RegistrationData();

  bool _isHiddenPassword = true;
  bool _isHiddenPasswordConfirmation = true;
  bool isChecked = true;
  var _successfullyRegistered = "";
  bool _errorPolicy = false;
  var errorText = 'Ознайомтеся і підтвердіть Політику конфіденційності';

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
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'Електрона пошта',
                        ),
                        autofocus: false,
                        validator: (String value) =>
                            FormValidator().validateEmail(value),
                        onSaved: (String value) {
                          _registrationData.email = value;
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
                        validator: (value) =>
                            FormValidator().validatePassword(value),
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
                          if (value.isEmpty || value.length == 0) {
                            return 'Потрібен повторний пароль';
                          }
                          if (value != FormValidator().password) {
                            return 'Паролі повинні бути однаковими';
                          }
                          return null;
                        },
                        onSaved: (String value) {
                          _registrationData.password = value;
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
                    _errorPolicy
                        ? Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Text(
                              errorText,
                              style: TextStyle(color: Colors.redAccent),
                            ),
                        )
                        : Text(''),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            if (!isChecked) {
                              setState(() {
                                errorText = 'Ознайомтеся і підтвердіть Політику конфіденційності';
                                _errorPolicy = true;
                              });
                              return;
                            }
                            register();
                            setState(() {
                              _successfullyRegistered =
                                  "Ви успішно зареєстровані";
                              _errorPolicy = false;
                            });
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                                horizontal: 100, vertical: 15),
                            primary: Color(0xff3D99DF),
                            shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(10.0))),
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
              ),
            ],
          ),
        ),
      ),
    );
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
            title: x,
            contentPadding: EdgeInsets.all(5.0),
            actions: <Widget>[
              new FlatButton(
                child: new Text("Ok",
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

  register(){
    _formKey.currentState.save();
    User newUser = User(
      "0",
      _registrationData.name,
      _registrationData.email,
      _registrationData.password,
      _registrationData.premium,
      _registrationData.theme
    );
    ApiManager().simpleRegister(newUser).then((value) {
      if(value.statusCode == 201) {
        Text x = Text("You successfully registered",
            style: TextStyle(
              fontFamily: 'Roboto',
              fontSize: 14,
              fontWeight: FontWeight.normal,
              color: Color(0xFF878787),
            ));
        _showDialog(x);
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => LoginPage()));
        print("Success");
      }
      // TODO error
      // else if(value.statusCode == 400) {
      //   var data = json.encode(value.body);
      //   print(data);
      //   if(data[0][0] == "user with this email already exists.") {
      //     errorText = 'Користувач з такими даними вже зареєстрован';
      //   }
      // }
    });
  }
}

