import 'package:flutter/material.dart';

import '../navigation.dart';

class NotificationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Повідомлення"),
          centerTitle: true,
        ),
        body: Wrap(
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
                      Text(
                        'Сьогодні',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 19),
                      ),
                      Text(
                        'Новий рік',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 19),
                      ),
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
        ),
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
