import 'package:flutter/material.dart';
import 'package:gift_generator/pages/firstFindPage.dart';
import 'package:gift_generator/pages/navigation.dart';

class deathPage extends StatefulWidget{

  deathPage({Key key}) : super(key: key);

  @override
  _deathPageState createState() => _deathPageState();
}
class _deathPageState extends State<deathPage> {
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => firstPage(age: "-1",sex: 1, link: "None"),
                    ),
                  );
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

          ],
        ),
      ),
      bottomNavigationBar: NavigationBar(),
    );
  }
}