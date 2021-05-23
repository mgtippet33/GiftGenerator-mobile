import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gift_generator/pages/account/cabinet.dart';
import 'package:gift_generator/pages/account/notification.dart';
import 'package:gift_generator/pages/search/find.dart';
import 'package:gift_generator/themeModel.dart';
import 'package:gift_generator/themes/lightTheme.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';

import 'account/notification.dart';

class NavigationBar extends StatefulWidget {
  const NavigationBar({Key key}) : super(key: key);

  @override
  _StatefulBarState createState() => _StatefulBarState();
}

class _StatefulBarState extends State<NavigationBar> {
  bool isRead;

  _checkNotificationsStatus() {
    SharedPreferences.getInstance().then((prefs) {
      isRead = prefs.getBool('isAllNotificationsRead');
    });
    return isRead;
  }

  @override
  void initState() {
    _checkNotificationsStatus();
  }

  Widget build(BuildContext context) {
    // TODO: implement build
    return BottomNavigationBar(
        backgroundColor: Provider.of<ThemeModel>(context).currentTheme == lightTheme ? Color(0xffffffff) : Color(0xff272C4F),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.card_giftcard,
                color: const Color(0xfffa6f38), size: 30),
            title: Text(''),
          ),
          BottomNavigationBarItem(
            icon: Icon(isRead == false ? Icons.notifications_active : Icons.notifications,
                color: const Color(0xfffa6f38), size: 30),
            title: Text(''),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: const Color(0xfffa6f38), size: 30),
            title: Text(''),
          ),
        ],
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.push(context,
                  PageTransition(type: PageTransitionType.fade, child: Find()));
              break;
            case 1:
              Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.fade,
                      child: NotificationPage()));
              break;
            case 2:
              Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.fade, child: Cabinet()));
              break;
          }
        });
  }
}
