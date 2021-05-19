import 'dart:math';

import 'package:flutter/material.dart';

import 'cabinet.dart';

class SuccessPaymentPage extends StatefulWidget {
  @override
  _SuccessPaymentPageState createState() => _SuccessPaymentPageState();
}

class _SuccessPaymentPageState extends State<SuccessPaymentPage>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation _myAnimation;
  AnimationStatus _animationStatus = AnimationStatus.dismissed;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    _myAnimation = Tween(end: 1.0, begin: 0.0).animate(_controller)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        _animationStatus = status;
      });
  }

  var mainColor = Color(0xFFAFD9FA);

  @override
  Widget build(BuildContext context) {
    _controller.forward();
    return Scaffold(
      appBar: AppBar(
        title: Text("Оплата"),
        centerTitle: true,
        backgroundColor: mainColor,
        automaticallyImplyLeading: false
      ),
      body: Wrap(
        children: <Widget>[
          Container(
            child: Center(
              child: Padding(
                padding: EdgeInsets.only(top: 50.0),
                child: Container(
                  child: Wrap(
                    children: <Widget>[
                      Center(
                        child: Container(
                          child: Center(
                            child: Padding(
                              padding: EdgeInsets.only(left: 85.0, right: 85.0),
                              child: Transform(
                                alignment: FractionalOffset.center,
                                transform: Matrix4.identity()
                                  ..setEntry(3, 2, 0.002)
                                  ..rotateY(pi * 2 * (_myAnimation.value)),
                                child: Row(
                                  children: <Widget>[
                                    Image.asset('assets/google.png'),
                                    Text(
                                      'Pay',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
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
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 160.0),
                        child: Container(
                          child: Center(
                            child: Text(
                              'Оплата пройшла успішно',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 19),
                            ),
                          ),
                          color: mainColor,
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(top:110, left: 20, right: 20, bottom: 300),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 15),
                              shadowColor: Colors.black,
                              primary: Color(0xFFFFFFFF),
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      new BorderRadius.circular(10.0)),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 25),
                              child: Row(
                                children: [
                                  Text(
                                    'Перейти до особистого кабінету',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xFF000000),
                                        fontSize: 17),
                                  ),
                                ],
                              ),
                            ),
                            onPressed: () {
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(builder: (context) => Cabinet()));
                              },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            color: mainColor,
          ),
        ],
      ),
    );
  }
}
