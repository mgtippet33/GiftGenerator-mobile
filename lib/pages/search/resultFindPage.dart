import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gift_generator/api/api.dart';
import 'package:gift_generator/models/Gift.dart';
import 'package:gift_generator/models/User.dart';
import 'package:gift_generator/models/UserHandler.dart';
import 'package:url_launcher/url_launcher.dart';

import '../navigation.dart';
import 'package:gift_generator/pages/search/firstFindPage.dart';

class resultPage extends StatefulWidget {
  var list;

  var chose;

  String line;
  final age;
  final sex;
  final link;
  final holiday;

  resultPage(
      {Key key,
      this.sex,
      this.age,
      this.link,
      this.holiday,
      this.list,
      this.chose,
      this.line})
      : super(key: key);

  @override
  _resultPageState createState() => _resultPageState(
      this.age, this.sex, this.link, this.holiday, this.list, this.chose);
}

class _resultPageState extends State<resultPage> {
  var color = [
    Color(0xffc3ccfa),
    Color(0xffd1fac3),
    Color(0xfffad7c3),
    Color(0xfffac3d7)
  ];

  var presentLink = [];
  var presentRate = [];
  var presentName = [];
  var presentDesc = [];
  Widget _resultWidget;
  Future<List<Gift>> _gifts;
  List<String> list;
  List<bool> chose;
  var age, sex, link, holiday;

  _resultPageState(
      this.age, this.sex, this.link, this.holiday, this.list, this.chose);

  @override
  void initState() {
    var gender;
    switch (sex) {
      case 0:
        gender = "Чоловік";
        break;
      case 1:
        gender = "Інше";
        break;
      case 2:
        gender = "Жінка";
        break;
    }
    if (link == "None" || link.length == 0) {
      link = null;
    }
    List<String> interests = [];
    final choose = chose.asMap();
    for (var el in choose.entries) {
      if (el.value) {
        var name = list[el.key];
        interests.add(name);
      }
    }
    final User _user = UserHandler.instance.getUser();
    _gifts = ApiManager().searchGifts(
        _user.email, gender, age, link, holiday, interests.join(','));
  }

  Future<Null> _showDialog(int k) async {
    await showDialog<String>(
        context: context,
        builder: (BuildContext context) {
          return new AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            backgroundColor: Color(0xFFF8F8F8),
            title: Center(
              child: k == 0
                  ? Column(
                      children: [
                        Text("Ви впевнені, що хочете ",
                            style:
                                TextStyle(color: Colors.black, fontSize: 20)),
                        Text("повернутися назад?",
                            style:
                                TextStyle(color: Colors.black, fontSize: 20)),
                        Padding(
                          padding: EdgeInsets.only(top: 15),
                          child: Text("Введені данні на цьому",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 16)),
                        ),
                        Text("кроці будуть втрачені",
                            style:
                                TextStyle(color: Colors.black, fontSize: 16)),
                      ],
                    )
                  : k == 1
                      ? Column(
                          children: [
                            Text("Ви впевнені, що хочете ",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 20)),
                            Text("почати спочатку?",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 20)),
                            Padding(
                              padding: EdgeInsets.only(top: 15),
                              child: Text("Ви не зможете переглянути ",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 16)),
                            ),
                            Text(" цю вибірку без преміум акаунту ",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16)),
                          ],
                        )
                      : Column(
                          children: [
                            Text("Ви впевнені, що хочете ",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 20)),
                            Text("оновити вибірку?",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 20)),
                            Padding(
                              padding: EdgeInsets.only(top: 15),
                              child: Text("Ви не зможете переглянути ",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 16)),
                            ),
                            Text(" цю вибірку без преміум акаунту ",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16)),
                          ],
                        ),
            ),
            contentPadding: EdgeInsets.all(5.0),
            actions: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 30, right: 60),
                child: FlatButton(
                  child: Center(
                    child: Text("Так",
                        style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                            color: Colors.black)),
                  ),
                  onPressed: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => k != 2
                            ? firstPage(
                                age: widget.age.toString(),
                                sex: widget.sex,
                                link: widget.link)
                            :  resultPage(
                            age: widget.age,
                            sex: widget.sex,
                            link: widget.link,
                            holiday: widget.holiday,
                            list: widget.list,
                            chose: widget.chose,
                            line: widget.line),
                            // : resultPage(
                            // age: widget.age,
                            // sex: widget.sex,
                            // link: widget.link,
                            // holiday: widget.holiday,
                            // list: widget.list,
                            // chose: minusChose(widget.chose),
                            // line: widget.line),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 30),
                child: FlatButton(
                  child: Center(
                    child: Text("Ні",
                        style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                            color: Colors.black)),
                  ),
                  onPressed: () async {
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          );
        });
  }

  minusChose(dynamic chose){
      var count = chose.where((item) => item == true).length;
      if(chose != null && count > 1) {
        var index = chose.indexOf(true);
        chose[index] = false;
      }
      return chose;
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _gifts,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            for (var gift in snapshot.data) {
              presentLink.add(gift.link);
              presentName.add(gift.name);
              presentRate.add(gift.rate.toString());
              presentDesc.add(gift.desc);
            }
            _resultWidget = SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding:
                    EdgeInsets.symmetric(horizontal: 100, vertical: 20),
                    child: Text(
                      "Знайдені варіанти",
                      style: TextStyle(
                        fontSize: 22,
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      for (int i = 0; i < 10; i++)
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: Container(
                            width: 340,
                            height: 130,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              color: color[i % 4],
                              borderRadius:
                              BorderRadius.all(Radius.circular(10)),
                            ),
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: 10, right: 150, top: 15),
                                  child: Text(presentName[i],
                                      style: TextStyle(fontSize: 18)),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: 25, right: 125, top: 15),
                                  child: InkWell(
                                    child: new Text('Посилання на подарунок',
                                        style: TextStyle(
                                            color: Colors.lightBlue,
                                            decoration:
                                            TextDecoration.underline,
                                            fontSize: 16)),
                                    onTap: () => launch(presentLink[i]),
                                  ),
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: 27, right: 10, top: 15),
                                      child: Text("Рейтинг подарунку",
                                          style: TextStyle(fontSize: 14)),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: 15),
                                      child: Text(presentRate[i],
                                          style: TextStyle(fontSize: 14)),
                                    ),
                                    Padding(
                                      padding:
                                      EdgeInsets.only(right: 10, top: 15),
                                      child: Text("%",
                                          style: TextStyle(fontSize: 14)),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 20),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                            horizontal: 104, vertical: 15),
                        shadowColor: Colors.black,
                        primary: Color(0xff3d99df),
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(10.0)),
                      ),
                      onPressed: () {
                        _showDialog(2);
                      },
                      child: Text(
                        'ОНОВИТИ ВИБІРКУ',
                        style: TextStyle(color: Color(0xffffffff)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 20),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                            horizontal: 100, vertical: 15),
                        shadowColor: Colors.black,
                        primary: Color(0xff3d99df),
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(10.0)),
                      ),
                      onPressed: () {
                        _showDialog(1);
                      },
                      child: Text(
                        'ПОЧАТИ СПОЧАТКУ',
                        style: TextStyle(color: Color(0xffffffff)),
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            _resultWidget = Center(
              child: SizedBox(width: 100,
                height: 100,
                child: CircularProgressIndicator(
                  strokeWidth: 10,
                  backgroundColor: Colors.cyanAccent,
                  valueColor: new AlwaysStoppedAnimation<Color>(Colors.blue),
                ),
              ));
          }
          return Scaffold(
            appBar: AppBar(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 10, right: 60),
                    child: InkWell(
                      onTap: () {
                        _showDialog(0);
                      },
                      child: Icon(Icons.arrow_back_rounded,
                          color: const Color(0xff6d6b6b), size: 30),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 90),
                    child: Text('Пошук подарунку'),
                  ),
                ],
              ),
              automaticallyImplyLeading: false,
            ),
            body: _resultWidget,
            bottomNavigationBar: NavigationBar(),
          );
        });
  }
}
