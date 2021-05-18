import 'package:flutter/material.dart';

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
            GestureDetector(
              // onTap: () => ,
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        CircleAvatar(
                          backgroundColor: Color(0xFFF38A2B),
                          radius: 5.0,
                        ),
                        SizedBox(
                          height: 55.0,
                          width: 40.0,
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          child: Text(
                            'Сьогодні',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 19),
                          ),
                          width: 250.0,
                        ),
                        Container(
                          child: Text(
                            'Новий рік',
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 17),
                          ),
                          width: 250.0,
                        ),
                      ],
                    ),
                    Column(),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                          child: Text(
                            '31/12/20',
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 17),
                          ),
                          padding: EdgeInsets.only(right: 13.4),
                        ),
                        SizedBox(
                          height: 22.0,
                        ),
                      ],
                    ),
                  ],
                ),
                margin: EdgeInsets.only(top: 15, left: 15, right: 15),
                height: 100.0,
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
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      SizedBox(
                        height: 55.0,
                        width: 40.0,
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        child: Text(
                          'Сьогодні',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 19),
                        ),
                        width: 250.0,
                      ),
                      Container(
                        child: Text(
                          'День народження брата',
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 17),
                        ),
                        width: 250.0,
                      ),
                    ],
                  ),
                  Column(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        child: Text(
                          '10/12/20',
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 17),
                        ),
                        padding: EdgeInsets.only(right: 13.4),
                      ),
                      SizedBox(
                        height: 22.0,
                      ),
                    ],
                  ),
                ],
              ),
              margin: EdgeInsets.only(top: 15, left: 15, right: 15),
              height: 100.0,
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
        ));
  }
}
