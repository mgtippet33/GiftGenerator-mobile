import 'package:flutter/material.dart';

class PaymentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Оплата'),
          centerTitle: true,
        ),
        body: Wrap(children: <Widget>[
          Center(
            child: SizedBox(
              height: 30.0,
            ),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.only(top: 15.0),
              child: Container(
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.only(left: 85.0, right: 85.0),
                    child: Row(
                      children: <Widget>[
                        Image.asset('assets/google.png'),
                        Text(
                          'Pay',
                          style: TextStyle(fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                ),
                margin: EdgeInsets.only(top: 15, left: 15, right: 15),
                height: 150.0,
                width: 250.0,
                decoration: BoxDecoration(
                  color: Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFF474545).withOpacity(0.1),
                      spreadRadius: 6,
                      blurRadius: 10,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
              ),
            ),
          ),
          Center(
            child: SizedBox(
              height: 150,
            ),
          ),
          Center(
            child: Text('До сплати 100 грн', style: TextStyle(fontWeight: FontWeight.w300, fontSize: 21),),
          ),
          Center(
            child: SizedBox(
              height: 120,
            ),
          ),
          Center(
            child: Text('Без комісії', style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15),),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 35),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                        horizontal: 30, vertical: 15),
                    shadowColor: Colors.black,
                    primary: Color(0xFF000000),
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(10.0)),),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 100),
                  child: Row(
                    children: [
                      Image.asset('assets/google.png'),
                      Text(
                        'Pay',
                        style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFFFFFFFF), fontSize: 17),
                      ),
                    ],
                  ),
                ),
                onPressed: () => {},
              ),
            ),
          ),
        ]));
  }
}
