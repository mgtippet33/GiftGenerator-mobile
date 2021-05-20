import 'package:flutter/material.dart';
import 'package:gift_generator/pages/notification.dart';
import 'package:gift_generator/pages/find.dart';
import 'package:gift_generator/pages/setting.dart';
import 'package:page_transition/page_transition.dart';

import 'navigation.dart';

class Cabinet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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