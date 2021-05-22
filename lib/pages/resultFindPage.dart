import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:url_launcher/url_launcher.dart';

import 'firstFindPage.dart';
import 'navigation.dart';

class resultPage extends StatefulWidget{
  var list ;
  var chose ;
  String line;
  final age;
  final sex;
  final link;
  final holiday;
  resultPage({Key key, this.sex, this.age, this.link, this.holiday, this.list, this.chose, this.line}) : super(key: key);

  @override
  _resultPageState createState() => _resultPageState();
}
class _resultPageState extends State<resultPage> {
  var color =[Color(0xffc3ccfa),Color(0xffd1fac3),Color(0xfffad7c3),Color(0xfffac3d7)];
  var presentLink = ['https://prom.ua/','https://prom.ua/','https://prom.ua/','https://prom.ua/','https://prom.ua/','https://prom.ua/','https://prom.ua/','https://prom.ua/','https://prom.ua/','https://prom.ua/'];
  var presentRate = ['100','100','100','100','100','100','100','100','100','100'];
  var presentName = ['Назва подарунку1', 'Назва подарунку2', 'Назва подарунку3', 'Назва подарунку4', 'Назва подарунку5', 'Назва подарунку6', 'Назва подарунку7', 'Назва подарунку8', 'Назва подарунку9', 'Назва подарунку10'];

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
              child: k==0
              ? Column(
                children: [
                  Text("Ви впевнені, що хочете ", style: TextStyle(color: Colors.black, fontSize: 20)),
                  Text("повернутися назад?", style: TextStyle(color: Colors.black, fontSize: 20)),
                  Padding(
                    padding: EdgeInsets.only(top: 15),
                    child: Text("Введені данні на цьому", style: TextStyle(color: Colors.black, fontSize: 16)),
                  ),
                  Text("кроці будуть втрачені", style: TextStyle(color: Colors.black, fontSize: 16)),

                ],
              )
              : k==1
                ? Column(
                  children: [
                    Text("Ви впевнені, що хочете ", style: TextStyle(color: Colors.black, fontSize: 20)),
                    Text("почати спочатку?", style: TextStyle(color: Colors.black, fontSize: 20)),
                    Padding(
                      padding: EdgeInsets.only(top: 15),
                      child: Text("Ви не зможете переглянути ", style: TextStyle(color: Colors.black, fontSize: 16)),
                    ),
                    Text(" цю вибірку без преміум акаунту ", style: TextStyle(color: Colors.black, fontSize: 16)),
                  ],
                )
                : Column(
                children: [
                  Text("Ви впевнені, що хочете ", style: TextStyle(color: Colors.black, fontSize: 20)),
                  Text("оновити вибірку?", style: TextStyle(color: Colors.black, fontSize: 20)),
                  Padding(
                    padding: EdgeInsets.only(top: 15),
                    child: Text("Ви не зможете переглянути ", style: TextStyle(color: Colors.black, fontSize: 16)),
                  ),
                  Text(" цю вибірку без преміум акаунту ", style: TextStyle(color: Colors.black, fontSize: 16)),
                ],
              ),
            ),
            contentPadding: EdgeInsets.all(5.0),
            actions: <Widget>[

              Padding(
                padding: EdgeInsets.only(left: 30, right: 60),
                child:FlatButton(

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
                        builder: (context) =>
                          k!=2
                              ? firstPage(age: widget.age.toString(),sex: widget.sex, link: widget.link)
                              : resultPage(age: widget.age,sex: widget.sex, link: widget.link, holiday: widget.holiday, list: widget.list, chose: widget.chose,line: widget.line),
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

  @override
  Widget build(BuildContext context) {
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
                child: Icon(
                    Icons.arrow_back_rounded, color: const Color(0xff6d6b6b),
                    size: 30),
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 100, vertical: 20),
              child: Text(
                "Знайдені варіанти",
                style: TextStyle(
                  fontSize: 22,
                ),
              ),
            ),
            Column(
              children:[
                for(int i=0; i<10;i++)
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                    child: Container(
                      width: 340,
                      height: 130,
                      clipBehavior : Clip.antiAlias,
                      decoration: BoxDecoration(
                        color: color[i%4],
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left:10, right: 150, top:15),
                            child: Text(presentName[i], style: TextStyle(fontSize: 18)),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left:25, right: 125, top:15),
                            child: InkWell(
                                child: new Text('Посилання на подарунок', style: TextStyle(color: Colors.lightBlue,  decoration: TextDecoration.underline, fontSize: 16)),
                                onTap: () => launch(presentLink[i]),
                            ),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left:27, right: 10, top:15),
                                child: Text("Рейтинг подарунку", style: TextStyle(fontSize: 14)),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top:15),
                                child: Text(presentRate[i], style: TextStyle(fontSize: 14)),
                              ),
                              Padding(
                                padding: EdgeInsets.only(right: 10, top:15),
                                child: Text("%", style: TextStyle(fontSize: 14)),
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
                  vertical: 10.0, horizontal: 20
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                      horizontal: 104, vertical: 15
                  ),
                  shadowColor: Colors.black,
                  primary: Color(0xff3d99df),
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(10.0)
                  ),
                ),
                onPressed: () {
                  _showDialog(2);
                },
                child:
                Text(
                  'ОНОВИТИ ВИБІРКУ',
                  style: TextStyle(color: Color(0xffffffff)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: 10.0, horizontal: 20
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                      horizontal: 100, vertical: 15
                  ),
                  shadowColor: Colors.black,
                  primary: Color(0xff3d99df),
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(10.0)
                  ),
                ),
                onPressed: () {
                  _showDialog(1);
                },
                child:
                Text(
                  'ПОЧАТИ СПОЧАТКУ',
                  style: TextStyle(color: Color(0xffffffff)),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: NavigationBar(),
    );
  }
}