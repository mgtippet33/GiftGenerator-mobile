import 'package:flutter/material.dart';

import 'navigation.dart';
int sex=-1;
class Find extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Пошук подарунку"),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: <Widget>[
          Indent(),
          Text(
              "Крок 1 із 3",
              style: const TextStyle(fontSize: 18)
          ),
          Indent(),
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: 'Вік',
              ),
              autofocus: false,
              validator: (String value) {
                if (value == null ||
                    value.isEmpty ||
                    value.length < 5) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
          ),
          Indent(),
          Padding(
            padding: EdgeInsets.only(left: 20, right: 320),
            child: Text(
              "Стать",
              style: const TextStyle(fontSize: 16)
            ),
          ),
          Center(
            child: ButtonsSex(),
          ),
          Indent(),
          Padding(
            padding: EdgeInsets.only(left: 7, right: 40),
            child: Text("Посилання на Twitter чи Facebook(опціонально) "),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: "https://www.facebook.com/katrin.miller.792",
                helperText: '*Якщо профіль закритий, аналіз сторінки неможливий',
              ),
              autofocus: false,
              validator: (String value) {
                if (value == null ||
                    value.isEmpty ||
                    value.length < 5) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
          ),
          Indent(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                      horizontal: 120, vertical: 15),
                  primary: Color(0xff3D99DF),
                  shape: RoundedRectangleBorder(
                      borderRadius:
                      new BorderRadius.circular(10.0))),
              onPressed: () {},
              child: const Text('Наступний крок'),
            ),
          ),
        ],
      ),
      bottomNavigationBar: NavigationBar(),
    );
  }
}
class Indent extends StatelessWidget{
  Widget build(BuildContext context) {
    return  SizedBox (height: 30);
  }
}
class ButtonsSex extends  StatelessWidget{
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(
              vertical: 16.0, horizontal: 10),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(
                    horizontal: 20, vertical: 7),
                shadowColor: Colors.black,
                primary: Color(0xffc3ccfa),
                shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(10.0))),
            onPressed: () => sex=0,
            child: Row(children: [
              Image.asset("assets/man.png"),
              SizedBox (
                width: 5,
              ),
              Text(
                'Чоловіча',
                style: TextStyle(color: Colors.black54),
              ),
            ]),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
              vertical: 16.0, horizontal: 15),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(
                    horizontal: 20, vertical: 7),
                shadowColor: Colors.black,
                primary: Color(0xffe8fac3),
                shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(10.0))),
            onPressed: () => sex=1,
            child: Row(children: [
              Icon(Icons.star_rounded, color: Color(0xff1d1c1c), size: 20),
              SizedBox (
                width: 5,
              ),
              Text(
                'Інша',
                style: TextStyle(color: Colors.black54),
              ),
            ]),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
              vertical: 16.0, horizontal: 10),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(
                    horizontal: 20, vertical: 7),
                shadowColor: Colors.black,
                primary: Color(0xfffad7c3),
                shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(10.0))),
            onPressed: () => sex=2,
            child: Row(children: [
              Image.asset("assets/woman.png"),
              SizedBox (
                width: 5,
              ),
              Text(
                'Жіноча',
                style: TextStyle(color: Colors.black54),
              ),
            ]),
          ),
        ),
      ],
    );
  }
}