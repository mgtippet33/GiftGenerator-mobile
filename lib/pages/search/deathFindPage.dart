import 'package:flutter/material.dart';
import 'package:gift_generator/pages/navigation.dart';
import 'package:gift_generator/pages/search/firstFindPage.dart';
import 'package:gift_generator/themeModel.dart';
import 'package:gift_generator/themes/lightTheme.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class deathPage extends StatefulWidget {
  deathPage({Key key}) : super(key: key);

  @override
  _deathPageState createState() => _deathPageState();
}

class _deathPageState extends State<deathPage> {
  var presentName = [
    'Вічна троянда в колбі',
    'Прогулянка на квадроциклах',
    'Занурення у світ VR-ігор для двох',
    '"Вишуканість" від Grand Regalia',
    'Настільна гра Штука 2.0 ',
    'Екстремальне водіння',
    'Подарунковий набір Paradise Арабіка',
    'Прогулянка на конях для двох'
  ];
  var presentLink = [
    'https://beri.ua/p1124764113-vechnaya-roza-kolbe.html/?gclid=CjwKCAjw-qeFBhAsEiwA2G7Nl0vj1aHD1w1O4Ih0vc5ieS-FdWy1Nu6eRjgWDY5KfhFOwjVrCTJaGBoCBR4QAvD_BwE',
    'https://www.bodo.ua/kharkov/go/progulka-na-kvadrotsiklakh-dlya-dvoikh/?gclid=CjwKCAjw-qeFBhAsEiwA2G7Nl4vij7w4XyMSWFkYGsCCBY3NuKPYh779qnH8S0r42K1hsLOhNZuHCRoCEb8QAvD_BwE',
    'https://www.bodo.ua/ua/kharkov/go/pogruzhenie-v-mir-vr-igr-dlya-dvoikh/?gclid=CjwKCAjw-qeFBhAsEiwA2G7Nl0E-SqK1FSxVjvL6URKww9u1a8FMGJ56PB20u6KLmB2pRXLll1ZVTBoCswUQAvD_BwE',
    'https://fama.ua/p/zhenskaya-britva-izyskannost-ot-grand-regalia-16817?gclid=CjwKCAjw-qeFBhAsEiwA2G7NlzUTY5mGWMH6xkpz1nY6yoyANuk_TcJt8ixJqunpcSNzofsDAX8puxoChfwQAvD_BwE',
    'https://lordofboards.com.ua/shtuka/?gclid=CjwKCAjw-qeFBhAsEiwA2G7NlwcRjKDDephWfIpmPdm8R5pxKOstIlaexZub7H92YQA372R-M9EfyhoCpbQQAvD_BwE',
    'https://www.bodo.ua/ua/kharkov/go/ekstremalnoe-vozhdenie/',
    'https://rozetka.com.ua/paradise_4820008970343/p8069904/?gclid=CjwKCAjw-qeFBhAsEiwA2G7Nl-qiYbyOmJAuygS5FWdTYEqW8LfiVTAdXaLJ05ZjMDCrMfwYg39MPBoCf9wQAvD_BwE',
    'https://www.bodo.ua/ua/kharkov/go/progulka-na-loshadyakh-dlya-dvoikh/?gclid=CjwKCAjw-qeFBhAsEiwA2G7Nl1Zac7H-0_WtFREI3z-u1DlxxGSCLLEWtXGmdobu4WXYKlMJ9rbYCBoC84kQAvD_BwE'
  ];
  var color = [
    Color(0xffc3ccfa),
    Color(0xffd1fac3),
    Color(0xfffad7c3),
    Color(0xfffac3d7)
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
      Provider
          .of<ThemeModel>(context)
          .currentTheme == lightTheme
          ? Color(0xffffffff)
          : Color(0xff111323),
      appBar: NewGradientAppBar(
        gradient: Provider
            .of<ThemeModel>(context)
            .currentTheme == lightTheme
            ? LinearGradient(colors: [Color(0xffAFCDFA), Color(0xffAEE3FA)])
            : LinearGradient(colors: [Color(0xff234983), Color(0xff4B81C3)]),
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
                      builder: (context) =>
                          firstPage(age: "-1", sex: 1, link: "None"),
                    ),
                  );
                },
                child: Icon(Icons.arrow_back_rounded,
                    color: Provider
                        .of<ThemeModel>(context)
                        .currentTheme ==
                        lightTheme
                        ? Color(0xff6d6b6b)
                        : Color(0xffffffff), size: 30),
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
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 40, bottom:50),
                child: Text(
                  'Вибачте, виникла помилка',
                  style:  TextStyle(
                      fontSize: 20
                  ),
                ),
              ),
              Image.asset("assets/logo.png"),
              Padding(
                padding: EdgeInsets.only(top: 40, bottom:50),
                child: Column(
                  children: [
                    Text(
                      'Пропонуємо переглянути актуальні вибірки,',
                      style:  TextStyle(
                          fontSize: 17
                      ),
                    ),
                    Text(
                      'можливо щось зацікавить',
                      style:  TextStyle(
                          fontSize: 17
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  for (int i = 0; i < 8; i++)
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
                        child: Center(
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    left: 10, right:10, top: 15),
                                child: Text(presentName[i],
                                    style: TextStyle(fontSize: 18)),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: 10, right: 10, top: 40),
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

                            ],
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: NavigationBar(),
    );
  }
}
