import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gift_generator/api/api.dart';
import 'package:gift_generator/blocs/auth_bloc.dart';
import 'package:gift_generator/models/User.dart';
import 'package:gift_generator/pages/loginPage.dart';
import 'package:gift_generator/services/validator.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import 'package:gift_generator/models/RegistrationData.dart';
import 'package:provider/provider.dart';


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
  bool _errorPolicy = false;


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
    final authBloc = Provider.of<AuthBloc>(context);
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
                            'Ознайомтеся та підтвердіть Політику конфіденційності',
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
                                _errorPolicy = true;
                              });
                              return;
                            }
                            register();
                            setState(() {
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
                    //TODO optional add logic for registration with google button
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5.0, horizontal: 20),
                      child: ElevatedButton(
                        onPressed: () => authBloc.signUpGoogle(context),
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
                            'Зареєструватися через google',
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
    ApiManager().register(newUser).then((value) {
      if(value.statusCode == 200) {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => LoginPage()));
        _showDialog(Text("Ви успішно зареєстровані!", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),));
      }
      else if(value.statusCode == 400) {
        _showDialog(Text("Користувач з такими даними вже зареєстрован!", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),));
      }
    });
  }
}

