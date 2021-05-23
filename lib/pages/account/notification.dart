import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gift_generator/api/api.dart';
import 'package:gift_generator/models/Notification.dart';
import 'package:gift_generator/models/NotificationHandler.dart';
import 'package:gift_generator/models/User.dart';
import 'package:gift_generator/models/UserHandler.dart';
import 'package:gift_generator/pages/navigation.dart';
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
    // holidays.add(new HolidayNotification(
    //     "Сьогодні", "новий рік", new DateTime(2021, 01, 01), true));
    // holidays.add(new HolidayNotification(
    //     "Через 5 днів", "холідейс", new DateTime(2021, 10, 11), false));
    super.initState();
  }

  @override
  void setState(fn) {
    // TODO: implement setState
    super.setState(fn);
  }

  @override
  void dispose() {
    // holidays.forEach((element) => element.isRead = false);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _checkNotification(_notifications);
    return Scaffold(
      appBar: AppBar(
        title: Text("Повідомлення"),
        centerTitle: true,
      ),
      body: _resultWidget,
      bottomNavigationBar: NavigationBar(),
    );
    // return FutureBuilder(future: _notifications,
    //     builder: (context, snapshot) {
    //       if(snapshot.hasData) {
    //         if(snapshot.data.length == 1 && snapshot.data[0] == null) {
    //           _resultWidget = Center(
    //             child: Text(
    //               'Найближчих свят не передбачається!',
    //               style: TextStyle(fontSize: 17, fontWeight: FontWeight.w300),
    //             ),
    //           );
    //         } else {
    //           for(var notification in snapshot.data) {
    //             holidays.add(notification);
    //           }
    //           _resultWidget = SizedBox(
    //             height: 800,
    //             width: 400,
    //             child: ListView.builder(
    //               itemCount: holidays.length,
    //               itemBuilder: (context, index) {
    //                 return Padding(
    //                   padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
    //                   child: GestureDetector(
    //                     onTap: () => setState(() {
    //                       holidays[index].isRead = false;
    //                       holidays.clear();
    //                     }),
    //                     child: Container(
    //                       width: 230,
    //                       decoration: BoxDecoration(
    //                         borderRadius: BorderRadius.all(Radius.circular(15)),
    //                         color: holidays[index].isRead == false ? Color(0xffE8FAC3) : Color(0xffC3CCFA),
    //                       ),
    //                       child: Padding(
    //                         padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
    //                         child: Row(
    //                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                           children: [
    //                             Row(
    //                               children: [
    //                                 Padding(
    //                                   padding: const EdgeInsets.only(right: 8.0),
    //                                   child: Container(
    //                                     width: 5,
    //                                     height: 5,
    //                                     //color: Color(0xffFA6F38),
    //                                     decoration: BoxDecoration(
    //                                       borderRadius:
    //                                       BorderRadius.all(Radius.circular(50)),
    //                                       color: holidays[index].isRead == true ? Color(0xffFA6F38) : Color(0xffE8FAC3),
    //                                     ),
    //                                   ),
    //                                 ),
    //                                 Column(
    //                                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //                                     children: [
    //                                       Text(
    //                                         holidays[index].daysDue,
    //                                         style: TextStyle(
    //                                             fontWeight: FontWeight.w500,
    //                                             fontSize: 19),
    //                                       ),
    //                                       Text(
    //                                         holidays[index].holiday,
    //                                         style: TextStyle(
    //                                             fontWeight: FontWeight.w400,
    //                                             fontSize: 16),
    //                                       ),
    //                                     ]),
    //                               ],
    //                             ),
    //                             Column(
    //                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //                               children: <Widget>[
    //                                 Text(
    //                                   holidays[index].date.day.toString() +
    //                                       "/" +
    //                                       holidays[index].date.month.toString() +
    //                                       "/" +
    //                                       holidays[index].date.year.toString(),
    //                                   style: TextStyle(
    //                                       fontWeight: FontWeight.w400, fontSize: 16),
    //                                 ),
    //                               ],
    //                             ),
    //                           ],
    //                         ),
    //                       ),
    //                       //title: Text('${holidays[index]}'),
    //                     ),
    //                   ),
    //                 );
    //               },
    //             ),
    //           );
    //         }
    //       }
    //       // else {
    //       //   _resultWidget = Center(
    //       //       child: SizedBox(width: 100,
    //       //         height: 100,
    //       //         child: CircularProgressIndicator(
    //       //           strokeWidth: 10,
    //       //           backgroundColor: Colors.cyanAccent,
    //       //           valueColor: new AlwaysStoppedAnimation<Color>(Colors.blue),
    //       //         ),
    //       //       ));
    //       // }
    //       return Scaffold(
    //         appBar: AppBar(
    //           title: Text("Повідомлення"),
    //           centerTitle: true,
    //         ),
    //         body: _resultWidget,
    //         bottomNavigationBar: NavigationBar(),
    //       );
    //     });
  }

  _checkNotification(List<HolidayNotification> notifications) {
    if (notifications.length == 1 && notifications[0] == null) {
      _resultWidget = Center(
        child: Text(
          'Найближчих свят не передбачається!',
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
                        ? Color(0xffE8FAC3)
                        : Color(0xffC3CCFA),
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
                                      : Color(0xffE8FAC3),
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

/* Wrap(
          spacing: 8.0, // gap between adjacent chips
          runSpacing: 4.0, // gap between lines
          children: <Widget>[
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ListView.builder(
                        itemCount: holidays.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text('${holidays[index]}'),
                          );
                        },
                      )
                      */ /*Text(
                        'Сьогодні',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 19),
                      ),
                      Text(
                        'Новий рік',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 19),
                      ),*/ /*
                    ],
                  ),
                  Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text(
                          '31/12/20',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 19),
                        ),
                      ],
                  ),
                ],
              ),
              margin: EdgeInsets.only(top: 15, left: 20, right: 20),
              height: 150.0,
              decoration: BoxDecoration(
                color: Color(0xFF939BD5),
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 15, left: 20, right: 20),
              height: 150.0,
              decoration: BoxDecoration(
                color: Color(0xFFE9FAC4),
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
            ),
          ],
        ),*/

// children: <Widget>[
// Expanded(
// child: Align(
// alignment: FractionalOffset(0.35, 0.3),
// child: Text(
// 'Сьогодні',
// style: TextStyle(
// fontWeight: FontWeight.bold, fontSize: 19),
// ),
// ),
// ),
// Expanded(
// child: Align(
// alignment: FractionalOffset(0.7, 0.3),
// child: Text(
// '31/12/20',
// style: TextStyle(fontSize: 19),
// ),
// )),
// ],
