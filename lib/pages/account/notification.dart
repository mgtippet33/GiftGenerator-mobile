import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gift_generator/api/api.dart';
import 'package:gift_generator/models/Notification.dart';
import 'package:gift_generator/models/NotificationHandler.dart';
import 'package:gift_generator/models/User.dart';
import 'package:gift_generator/models/UserHandler.dart';
import 'package:gift_generator/pages/account/setting.dart';
import 'package:gift_generator/pages/navigation.dart';
import 'package:gift_generator/themeModel.dart';
import 'package:gift_generator/themes/lightTheme.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key key}) : super(key: key);

  @override
  _StatefulNotificationState createState() => _StatefulNotificationState();
}

class _StatefulNotificationState extends State<NotificationPage> {
  List<HolidayNotification> holidays = List();
  User _user = UserHandler.instance.getUser();

  List<HolidayNotification> _notifications =
      NotificationHandler.instance.getNotifications();
  Widget _resultWidget;

  @override
  void initState() {
    SharedPreferences.getInstance().then((prefs) {
      prefs.setBool('isAllNotificationsRead', true);
    });
    super.initState();
  }

  @override
  void setState(fn) {
    // TODO: implement setState
    super.setState(fn);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _checkNotification(_notifications);
    return Scaffold(
      backgroundColor : Provider.of<ThemeModel>(context).currentTheme == lightTheme ? Color(0xffffffff) : Color(0xff111323),
      appBar: NewGradientAppBar(
        gradient: Provider.of<ThemeModel>(context).currentTheme == lightTheme
            ? LinearGradient(
            colors: [Color(0xffAFCDFA), Color(0xffAEE3FA)])
            : LinearGradient(
            colors: [Color(0xff234983), Color(0xff4B81C3)]),
        title: Text("????????????????????????"),
        centerTitle: true,
      ),
      body: _resultWidget,
      bottomNavigationBar: NavigationBar(),
    );
  }

  _checkNotification(List<HolidayNotification> notifications) {
    if (notifications == null || (notifications.length == 1 && notifications[0] == null)) {
      _resultWidget = Center(
        child: Text(
          '???????????????????? ???????? ???? ????????????????????????????!',
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.w300),
        ),
      );
    } else {
      if(notifications.length != holidays.length){
        holidays.clear();
        for (var notification in notifications) {
          holidays.add(notification);
        }
      }
      _resultWidget = SizedBox(
        height: 800,
        width: 400,
        child: ListView.builder(
          itemCount: holidays.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    holidays[index].isRead = false;
                  });
                  NotificationHandler.instance.readNotification(index);
                },
                child: Container(
                  width: 230,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    color: holidays[index].isRead == false
                        ? Provider.of<ThemeModel>(context).currentTheme == lightTheme ? Color(0xffE8FAC3) : Color(0xff113331)
                        : Provider.of<ThemeModel>(context).currentTheme == lightTheme ? Color(0xffC3CCFA) : Color(0xff2E163D),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Container(
                                width: 5,
                                height: 5,
                                //color: Color(0xffFA6F38),
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(50)),
                                  color: holidays[index].isRead == true
                                      ? Color(0xffFA6F38)
                                      : Provider.of<ThemeModel>(context).currentTheme == lightTheme ? Color(0xffE8FAC3) : Color(0xff113331)
                                ),
                              ),
                            ),
                            Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    holidays[index].daysDue,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 19),
                                  ),
                                  Text(
                                    holidays[index].holiday,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16),
                                  ),
                                ]),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Text(
                              holidays[index].date.day.toString() +
                                  "/" +
                                  holidays[index].date.month.toString() +
                                  "/" +
                                  holidays[index].date.year.toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 16),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  //title: Text('${holidays[index]}'),
                ),
              ),
            );
          },
        ),
      );
    }
  }
}