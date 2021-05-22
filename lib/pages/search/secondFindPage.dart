import 'package:flutter/material.dart';
import 'package:gift_generator/pages/navigation.dart';
import 'package:gift_generator/pages/search/thirdFindPage.dart';
import 'package:page_transition/page_transition.dart';

import 'firstFindPage.dart';


class secondPage extends StatefulWidget{
  final age;
  final sex;
  final link;
  const secondPage({Key key, this.sex, this.age, this.link}) : super(key: key);

  @override
  _secondPageState createState() => _secondPageState();
}
class _secondPageState extends State<secondPage> {
  var list = [
    'Спорт',
    'Фотографія',
    'Соціальні мережі',
    'Мода',
    'Подорожі',
    'Аніме',
    'Музика',
    'Кіно',
    'Комікси',
    'Технології',
    'Театр',
    'Програмування',
    'Косметика',
    'Одяг',
    'Моделінг',
    'Комп\'ютерні ігри',
    'Фітнес',
    'Анімація',
    'Кулінарія',
    'Навчання',
    'Автомобілі',
    'Тварини',
    'Боротьба',
    'Футбол',
    'Японія',
    'BTS'
  ];
  var chose = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];
  var holiday = [
    'День народження',
    'Новий рік',
    'День закоханих',
    '14 жовтня',
    '8 березня',
    'Інше'
  ];
  var icons = [
    Icon(Icons.cake_rounded, color: const Color(0xff1d1c1c), size: 25),
    Icon(Icons.ac_unit_rounded, color: const Color(0xff1d1c1c), size: 25),
    Icon(Icons.wc_rounded, color: const Color(0xff1d1c1c), size: 25),
    Icon(Icons.airplanemode_active, color: const Color(0xff1d1c1c), size: 25),
    Icon(Icons.person, color: const Color(0xff1d1c1c), size: 25),
    Icon(Icons.star_rounded, color: const Color(0xff1d1c1c), size: 25)
  ];
  var color = [Color(0xffe8fac3), Color(0xffc3ccfa)];
  String line = "";
  bool flag = false;

  void change() {
    flag = !flag;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Row (
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left:10, right: 60),
              child: InkWell(
                onTap: ()=> Navigator.push(context,PageTransition(
                    type: PageTransitionType.fade,
                    child: firstPage(age: widget.age.toString(),sex: widget.sex, link: widget.link))),
                child: Icon(Icons.arrow_back_rounded, color: const Color(0xff6d6b6b), size: 30),
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
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Text(
                "Крок 2 із 3",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 250, top: 20),
              child: Text(
                "Оберіть свято:",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            Column(
              children: [
                for(int i = 0; i < 6; i++, flag = !flag)
                  ((i == 4 && widget.sex == 0) || (i == 3 && widget.sex == 2))
                      ? Wrap()
                      : Padding(
                    padding: EdgeInsets.all(15),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                            horizontal: 20, vertical: 15
                        ),
                        shadowColor: Colors.black,
                        primary: ((i >= 5 && widget.sex == 0) ||
                            (i >= 4 && widget.sex == 2))
                            ? color[(i + 1) % 2]
                            : color[i % 2],
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(10.0)
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                thirdPage(age: widget.age,
                                    sex: widget.sex,
                                    link: widget.link,
                                    holiday: holiday[i],
                                    list: list,
                                    chose: chose,
                                    line: line),
                          ),
                        );
                      },
                      child: Row(
                        children: [
                          icons[i],
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text(
                              holiday[i],
                              style: TextStyle(color: Color(0xff000000)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),),
      bottomNavigationBar: NavigationBar(),
    );
  }
}
