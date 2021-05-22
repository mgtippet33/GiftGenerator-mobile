import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gift_generator/models/UserHistoryModel.dart';
import 'package:gift_generator/pages/notification.dart';
import 'package:gift_generator/pages/find.dart';
import 'package:gift_generator/pages/payment.dart';
import 'package:gift_generator/pages/register.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../themeModel.dart';
import 'navigation.dart';

class Cabinet extends StatefulWidget {
  @override
  _CabinetState createState() => _CabinetState();
}

class _CabinetState extends State<Cabinet> {
  List<UserHistoryModel> _history = List();
  final box = GetStorage('MyStorage');

  @override
  initState() {
    if (box.read('isPremium') == null) {
      box.write('isPremium', false);
    }
    _history.add(new UserHistoryModel('New year', "01/01", "music, gaming",
        "https://bezkoder.com/dart-list/", "woman", 23));
    _history.add(new UserHistoryModel('Happy birthday', "01/01", "music",
        "https://bezkoder.com/dart-list/", "woman", 23));
    _history.add(new UserHistoryModel(
        'New year 1',
        "01/02",
        "music, gaming, cooking",
        "https://stackoverflow.com/questions/51013444/how-to-change-font-size-of-flutter-material-button",
        "man",
        23));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: IconTitleWidget(),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 20, bottom: 40),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          top: 20, left: 5, right: 5, bottom: 10),
                      child: Container(
                        width: 90.0,
                        height: 90.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          color: box.read('isPremium') == true
                              ? Colors.deepOrangeAccent
                              : Colors.white,
                        ),
                        child: Image.asset("assets/account_img.png"),
                      ),
                    ),
                    Column(children: [
                      Text('User name'),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 16.0, horizontal: 22),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 35, vertical: 7),
                              shadowColor: Colors.black,
                              primary: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      new BorderRadius.circular(10.0))),
                          onPressed: () => {
                            if (box.read('isPremium') == false)
                              {
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (context) => PaymentPage()))
                              }
                          },
                          child: Row(children: [
                            Image.asset(
                              box.read('isPremium')
                                  ? "assets/premium_active.png"
                                  : "assets/primium_unactive.png",
                              height: 35,
                            ),
                            Text(
                              'Преміум акаунт',
                              style: TextStyle(color: Colors.black54),
                            ),
                          ]),
                        ),
                      ),
                    ]),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 30),
                child: Center(
                  child: Text(
                    "Історія",
                    style: new TextStyle(
                      fontSize: 20.0,
                      color: Colors.black54,
                    ),
                  ),
                ),
              ),
              ListView(
                children: _getListElements(_history),
              ),
              /*ListView.builder(
                itemCount: _history.length,
                itemBuilder: (context, index) {
                  return Text(_history[index].holidays);
                },
              ),*/
              /*HistoryBlock(),
              Padding(padding: EdgeInsets.only(bottom: 15)),
              HistoryBlock(),
              Padding(padding: EdgeInsets.only(bottom: 15)),
              HistoryBlock(),*/
            ],
          ),
        ),
      ),
      bottomNavigationBar: NavigationBar(),
    );
  }
}

List<Widget> _getListElements(List<UserHistoryModel> allNews) {
  List<Widget> widgets = List();
  for (var n in allNews) {
    widgets.add(HistoryBlock());
  }

  return widgets;
}

class HistoryBlock extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 0),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Color(0xffC3CCFA),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            width: 330,
            height: 180,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Свято",
                        style: new TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16.0,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        "Дата",
                        style: new TextStyle(
                          fontWeight: FontWeight.w200,
                          fontSize: 16.0,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "Інтерес1, інтерес2",
                    style: new TextStyle(
                      fontWeight: FontWeight.w200,
                      fontSize: 16.0,
                      color: Colors.black,
                    ),
                  ),
                  Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                  Text(
                    "Посилання на соціальну мережу",
                    style: new TextStyle(
                      fontSize: 14.0,
                      color: Colors.black54,
                    ),
                  ),
                  Padding(padding: EdgeInsets.symmetric(vertical: 5)),
                  Text(
                    "Стать, вік",
                    style: new TextStyle(
                      fontSize: 15.0,
                      color: Colors.black54,
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xffC3CCFA),
                      padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                      elevation: 0,
                    ),
                    onPressed: () => {},
                    child: Container(
                        child: Image.asset(
                      "assets/bottom_arrow.png",
                      height: 40,
                    )),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class IconTitleWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    imageCache.clear();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        InkWell(
          // onTap: ()=> Navigator.push(context,PageTransition(
          //     type: PageTransitionType.fade,
          //     child: NotificationPage())),
          child: Icon(Icons.settings, color: const Color(0xff6d6b6b), size: 30),
        ),
        SizedBox(
          width: 10,
        ),
        Text('Кабінет'),
        SizedBox(
          width: 10,
        ),
        InkWell(
          onTap: () => {
            Provider.of<ThemeModel>(context).toggleTheme()
            //TODO fix theme changer
          },
          child: Icon(Icons.nightlight_round,
              color: const Color(0xff6d6b6b), size: 30),
        ),
      ],
    );
  }
}
