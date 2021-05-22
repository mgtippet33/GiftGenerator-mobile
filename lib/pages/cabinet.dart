import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gift_generator/api/api.dart';
import 'package:gift_generator/models/UserHandler.dart';
import 'package:gift_generator/pages/loginPage.dart';
import 'package:gift_generator/pages/notification.dart';
import 'package:gift_generator/pages/find.dart';
import 'package:gift_generator/pages/setting.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:gift_generator/models/User.dart';
import 'navigation.dart';

class Cabinet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    _checkUser(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: IconTitleWidget(),
      ),
      body:
      Column(),
      bottomNavigationBar: NavigationBar(),
    );
  }

  _checkUser(BuildContext context) {
    if (UserHandler.instance.getUser() == null) {
      SharedPreferences.getInstance().then((prefs) {
        var userToken = prefs.getString('userToken');
        if (userToken == null)
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => LoginPage()));
        else {
          ApiManager().getUser(userToken).then((value) {
            if (value.statusCode == 200) {
              var data = json.decode(value.body);
              var userData = data["data"][0];
              userData["token"] = userToken;
              userData["email"] = prefs.getString('email');
              userData["googleSignIn"] = prefs.getBool('googleSignIn');
              User user = User.fromJson(userData);
              print(user.name);
              UserHandler(user);
            } else{
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => LoginPage()));
            }
          });
        }
      });
    }
  }
}
class IconTitleWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    imageCache.clear();
    return Row (
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        InkWell(
          onTap: ()=> Navigator.push(context,PageTransition(
              type: PageTransitionType.fade,
              child: SettingPage())),
          child: Icon(Icons.settings, color: const Color(0xff6d6b6b), size: 30),
        ),
        SizedBox (
          width: 10,
        ),
        Text('Кабінет'),
        SizedBox (
          width: 10,
        ),
        InkWell(
          // onTap: ()=> Navigator.push(context,PageTransition(
          //     type: PageTransitionType.fade,
          //     child: NotificationPage())),
          child: Icon(Icons.nightlight_round, color: const Color(0xff6d6b6b), size: 30),
        ),
      ],
    );
  }
}