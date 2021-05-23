
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gift_generator/models/Notification.dart';
import 'package:gift_generator/pages/navigation.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key key}) : super(key: key);

  @override
  _StatefulNotificationState createState() => _StatefulNotificationState();
}

class _StatefulNotificationState extends State<NotificationPage> {
  List<String> holidays = [];
  List<String> datesDue = [];
  List<String> dates = [];
  List<bool> isAlreadyRead = [];

  @override
  void initState() {
   /* holidays.add(new HolidayNotification("Сьогодні", "новий рік", new DateTime(2021, 01, 01), true));
    holidays.add(new HolidayNotification("Через 5 днів", "холідейс", new DateTime(2021, 10, 11), false));*/
    holidays.add("new year");
    holidays.add("holiday");
    datesDue.add("Сьогодні");
    datesDue.add("Через 5 днів");
    dates.add("31/01/01");
    dates.add("26/12/20");
    isAlreadyRead.add(false);
    isAlreadyRead.add(true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Повідомлення"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: holidays.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
            child: Container(
              width: 230,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                color: Color(0xffE8FAC3),
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
                              color: Color(0xffFA6F38),
                            ),
                          ),
                        ),
                        Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                               'datesDue[index]',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 19),
                              ),
                              Text(
                                holidays[index],
                                style: TextStyle(
                                    fontWeight: FontWeight.w400, fontSize: 16),
                              ),
                            ]),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text(
                          'dates[index]',
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
          );
        },
      ),
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
      bottomNavigationBar: NavigationBar(),
    );
  }
}

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
