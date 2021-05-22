import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gift_generator/api/api.dart';
import 'package:gift_generator/blocs/auth_bloc.dart';
import 'package:gift_generator/models/User.dart' as myUser;
import 'package:gift_generator/models/UserHandler.dart';
import 'package:gift_generator/pages/authorization/loginPage.dart';
import 'package:gift_generator/services/validator.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key key}) : super(key: key);

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  final myUser.User _user = UserHandler.instance.getUser();
  final GlobalKey<FormState> _profileKey = new GlobalKey();
  final GlobalKey<FormState> _passwordKey = new GlobalKey();

  var _nameController = TextEditingController();
  var _emailController = TextEditingController();
  var _passwordController = TextEditingController();
  var _repetedPasswordController = TextEditingController();

  bool _isHidden = true;
  bool _profileValidate = false;
  bool _passwordValidate = false;

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    final authBloc = Provider.of<AuthBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: SettingAppBar(),
      ),
      body: _settingPage(_user, context),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 3.0),
              child: Text(
                'Вихід',
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
            IconButton(
              icon:
                  Icon(Icons.logout, color: const Color(0xff000000), size: 30),
              onPressed: () async {
                var user = UserHandler.instance.getUser();
                if (user.googleSignIn) {
                  authBloc.logout();
                  await FirebaseAuth.instance.signOut();
                }
                UserHandler.instance.resetUser();
                SharedPreferences.getInstance().then((prefs) {
                  prefs.remove('userToken');
                });
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => LoginPage()));
              },
            )
          ],
        ),
      ),
    );
  }

  Widget _settingPage(myUser.User user, BuildContext context) {
    _nameController = TextEditingController(text: user.name);
    _emailController = TextEditingController(text: user.email);
    return ListView(
      children: <Widget>[
        Form(
          key: _profileKey,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Wrap(
                    children: [
                      Center(
                          child: Padding(
                        padding: const EdgeInsets.only(top: 5.0, bottom: 20.0),
                        child: Text(
                          'Налаштування профілю',
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 19),
                        ),
                      )),
                      Text(
                        'Ім\'я',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 17),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 25.0),
                        child: TextFormField(
                          controller: _nameController,
                          autofocus: false,
                          validator: (value) =>
                              FormValidator().validateName(value),
                        ),
                      ),
                      Text(
                        'Email',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 17),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 25.0),
                        child: TextFormField(
                          controller: _emailController,
                          autofocus: false,
                          validator: (value) =>
                              FormValidator().validateEmail(value),
                        ),
                      ),
                      Center(
                        child: ElevatedButton(
                          onPressed: () {
                            if (_profileKey.currentState.validate()) {
                              setState(() {
                                _profileValidate = false;
                              });
                              if (_nameController.text == user.name &&
                                  _emailController.text == user.email) {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                        content: Text(
                                  "Дані успішно змінені!",
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500),
                                )));
                                return;
                              }
                              changeProfile(user, _emailController.text, _nameController.text);
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                  content: Text(
                                    "Дані успішно змінені!",
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w500),
                                  )));
                              return;
                            }
                            setState(() {
                              _profileValidate = true;
                            });
                          },
                          style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 110, vertical: 15),
                              primary: Color(0xff3D99DF),
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      new BorderRadius.circular(10.0))),
                          child: Text(
                            'Змінити',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                // color: Color(0xFFFFEFE9),
                margin: EdgeInsets.only(top: 15, left: 15, right: 15),
                height: _profileValidate ? 355 : 310,
                width: 375.0,
                decoration: BoxDecoration(
                  color: Color(0xFFFFEFE9),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFF474545).withOpacity(0.1),
                      spreadRadius: 6,
                      blurRadius: 10,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Form(
          key: _passwordKey,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Wrap(
                    children: [
                      Center(
                          child: Padding(
                        padding: const EdgeInsets.only(top: 5.0, bottom: 20.0),
                        child: Text(
                          'Налаштування паролю',
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 19),
                        ),
                      )),
                      Text(
                        'Новий пароль',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 17),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 25.0),
                        child: TextFormField(
                          controller: _passwordController,
                          autofocus: false,
                          decoration: InputDecoration(
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
                          validator: (value) =>
                              FormValidator().validatePassword(value),
                        ),
                      ),
                      Text(
                        'Повторіть ще раз',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 17),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 25.0),
                        child: TextFormField(
                          controller: _repetedPasswordController,
                          autofocus: false,
                          decoration: InputDecoration(
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
                          validator: (String value) {
                            if (value.isEmpty || value.length == 0) {
                              return 'Потрібен повторний пароль';
                            }
                            if (value != FormValidator().password) {
                              return 'Паролі повинні бути однаковими';
                            }
                            return null;
                          },
                        ),
                      ),
                      Center(
                        child: ElevatedButton(
                          onPressed: () {
                            if (_passwordKey.currentState.validate()) {
                              setState(() {
                                _passwordValidate = false;
                              });
                              changePassword(user, _passwordController.text);
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                  content: Text(
                                    "Пароль успішно змінено!",
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w500),
                                  )));
                              return;
                            }
                            setState(() {
                              _passwordValidate = true;
                            });
                          },
                          style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 60, vertical: 15),
                              primary: Color(0xff3D99DF),
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      new BorderRadius.circular(10.0))),
                          child: Text(
                            'Підтвердити зміну',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                // color: Color(0xFFFFEFE9),
                margin: EdgeInsets.only(top: 15, left: 15, right: 15),
                height: _passwordValidate ? 365 : 310,
                width: 375.0,
                decoration: BoxDecoration(
                  color: Color(0xFFFFEFE9),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFF474545).withOpacity(0.1),
                      spreadRadius: 6,
                      blurRadius: 10,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  changeProfile(myUser.User user, String newEmail, String name) {
    ApiManager()
        .changeUser(user.token, user.email, newEmail, name)
        .then((value) {
      if (value.statusCode == 200) {
        user.email = newEmail;
        user.name = name;
        UserHandler.instance.setUser(user);
        setState(() {
          _nameController.text = name;
          _emailController.text = newEmail;
        });
      }
    });
  }

  changePassword(myUser.User user, String password) {
    ApiManager()
        .changePassword(user.token, user.email, password)
        .then((value) {
      if (value.statusCode == 200) {
        setState(() {
          _passwordController.clear();
          _repetedPasswordController.clear();
        });
      }
    });
  }
}

class SettingAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Text('Налаштування'),
        ),
        InkWell(
          // onTap: ()=> Navigator.push(context,PageTransition(
          //     type: PageTrоansitionType.fade,
          //     child: NotificationPage())),
          child: Icon(Icons.nightlight_round,
              color: const Color(0xff6d6b6b), size: 30),
        ),
      ],
    );
  }
}
