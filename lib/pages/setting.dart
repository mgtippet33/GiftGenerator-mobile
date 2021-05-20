import 'package:flutter/material.dart';
import 'package:gift_generator/pages/loginPage.dart';
import 'package:page_transition/page_transition.dart';

import 'cabinet.dart';
import 'navigation.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key key}) : super(key: key);

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SettingAppBar(),
      ),
      body: ListView(
        children: <Widget>[
          Center(
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
                      Text('Email', style: TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 17),),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 25.0),
                        child: TextFormField(
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
                      Center(
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 135, vertical: 15),
                              primary: Color(0xff3D99DF),
                              shape: RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(10.0))),
                          child: Text('Змінити', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500,),),
                        ),
                      )
                    ],
                  ),
                ),
                // color: Color(0xFFFFEFE9),
                margin: EdgeInsets.only(top: 15, left: 15, right: 15),
                height: 310.0,
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
          Center(
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
                      Text('Повторіть ще раз', style: TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 17),),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 25.0),
                        child: TextFormField(
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
                      Center(
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 90, vertical: 15),
                              primary: Color(0xff3D99DF),
                              shape: RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(10.0))),
                          child: Text('Підтвердити зміну', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500,),),
                        ),
                      )
                    ],
                  ),
                ),
                // color: Color(0xFFFFEFE9),
                margin: EdgeInsets.only(top: 15, left: 15, right: 15),
                height: 310.0,
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
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 3.0),
              child: Text('Вихід', style: TextStyle(fontSize: 19, fontWeight: FontWeight.w300,),),
            ),
            IconButton(
              icon: Icon(Icons.exit_to_app,
                  color: const Color(0xff000000), size: 30),
              onPressed: () => Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.fade, child: LoginPage())),
            )
          ],
        ),
      ),
    );
  }
}

class SettingAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        SizedBox(
          width: 10,
        ),
        Text('Налаштування'),
        SizedBox(
          width: 10,
        ),
        InkWell(
          // onTap: ()=> Navigator.push(context,PageTransition(
          //     type: PageTransitionType.fade,
          //     child: NotificationPage())),
          child: Icon(Icons.nightlight_round,
              color: const Color(0xff6d6b6b), size: 30),
        ),
      ],
    );
  }
}
