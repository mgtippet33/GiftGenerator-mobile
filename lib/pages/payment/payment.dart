import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gift_generator/api/api.dart';
import 'package:gift_generator/models/User.dart';
import 'package:gift_generator/models/UserHandler.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gift_generator/pages/navigation.dart';
import 'package:gift_generator/pages/payment/successPaymentPage.dart';
import 'package:stripe_payment/stripe_payment.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PaymentPage extends StatefulWidget {
  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  final User _user = UserHandler.instance.getUser();
  Token _paymentToken;
  PaymentMethod _paymentMethod;
  String _error;
  final box = GetStorage('MyStorage');

//this client secret is typically created by a backend system
//check https://stripe.com/docs/payments/payment-intents#passing-to-client
  final String _paymentIntentClientSecret = null;

  PaymentIntentResult _paymentIntent;
  Source _source;

  ScrollController _controller = ScrollController();
  final CreditCard testCard = CreditCard(
    number: '4000002760003184',
    expMonth: 12,
    expYear: 21,
  );

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  initState() {
    super.initState();

    StripePayment.setOptions(StripeOptions(
        publishableKey:
            "pk_test_51Isi7jBV0672TNxsHVhiuUcwxyki5i7kwIUu5lQZyIv4zdwHVZCjOsP9fnT8M2tLGqO33598mZanBUdyTfGOjYS400tTBCZX1O",
        merchantId: "Test",
        androidPayMode: 'test'));
  }

  void setError(dynamic error) {
    _scaffoldKey.currentState
        .showSnackBar(SnackBar(content: Text(error.toString())));
    setState(() {
      _error = error.toString();
    });
  }

  var navColor = Color(0xFFAFD9FA);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Оплата'),
        backgroundColor: navColor,
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          Wrap(children: <Widget>[
            Container(
              child: Center(
                child: SizedBox(
                  height: 30.0,
                ),
              ),
              color: navColor,
            ),
            Container(
              child: Center(
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
              color: navColor,
            ),
            Container(
              child: Center(
                child: SizedBox(
                  height: 50,
                ),
              ),
              color: navColor,
            ),
            Center(
              child: SizedBox(
                height: 70,
              ),
            ),
            Center(
              child: Text(
                'До сплати 100 грн',
                style: TextStyle(fontWeight: FontWeight.w300, fontSize: 21),
              ),
            ),
            Center(
              child: SizedBox(
                height: 100,
              ),
            ),
            Center(
              child: Text(
                'Без комісії',
                style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15),
              ),
            ),
            Center(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 35),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    shadowColor: Colors.black,
                    primary: Color(0xFF000000),
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(10.0)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 95),
                    child: Row(
                      children: [
                        Image.asset('assets/google.png'),
                        Text(
                          'Pay',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFFFFFFF),
                              fontSize: 17),
                        ),
                      ],
                    ),
                  ),
                  onPressed: () {
                    box.write('isPremium', true);
                    if (Platform.isIOS) {
                      _controller.jumpTo(450);
                    }
                    StripePayment.paymentRequestWithNativePay(
                      androidPayOptions: AndroidPayPaymentRequest(
                        totalPrice: "0",
                        currencyCode: "EUR",
                      ),
                      applePayOptions: ApplePayPaymentOptions(
                        countryCode: 'DE',
                        currencyCode: 'EUR',
                        items: [
                          ApplePayItem(
                            label: 'Test',
                            amount: '0',
                          )
                        ],
                      ),
                    ).then((token) {
                      setState(() {
                        setPremium(_user);
                        _scaffoldKey.currentState.showSnackBar(SnackBar(
                            content: Text('Received ${token.tokenId}')));
                        _paymentToken = token;
                      });
                    }).catchError(setError);
                  },
                ),
              ),
            ),
          ])
        ],
      ),
      bottomNavigationBar: NavigationBar(),
    );
  }

  setPremium(User user){
    ApiManager().setPremium(user.token, user.email).then((value) {
      if(value.statusCode == 200) {
        user.premium = true;
        UserHandler.instance.setUser(user);
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => SuccessPaymentPage()));
      }
      else{
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(
            content: Text(
              "Сталася помилка оплати. Спробуйте пізніше!",
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w500),
            )));
      }
    });
  }
}
