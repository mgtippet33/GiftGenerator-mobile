import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gift_generator/pages/navigation.dart';
import 'package:gift_generator/pages/search/secondFindPage.dart';
import 'package:gift_generator/services/validator.dart';
import 'package:gift_generator/themeModel.dart';
import 'package:gift_generator/themes/lightTheme.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class firstPage extends StatefulWidget{
  String age;
  int sex;
  String link;
  firstPage({Key key, this.age, this.sex, this.link}) : super(key: key);

  @override
  _firstPageState createState() =>_firstPageState();
}
class _firstPageState extends State<firstPage> {
  final GlobalKey<FormState> _firstPageKey = new GlobalKey();
  var _ageController = TextEditingController();
  var _linkController = TextEditingController();

  bool _firstValidate = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor : Provider.of<ThemeModel>(context).currentTheme == lightTheme ? Color(0xffffffff) : Color(0xff111323),
      appBar: NewGradientAppBar(
        gradient: Provider.of<ThemeModel>(context).currentTheme == lightTheme
            ? LinearGradient(
            colors: [Color(0xffAFCDFA), Color(0xffAEE3FA)])
            : LinearGradient(
            colors: [Color(0xff234983), Color(0xff4B81C3)]),
        title: Padding(
          padding: EdgeInsets.symmetric(horizontal: 96),
          child: Text("Пошук подарунку"),
        ),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _firstPageKey,
          child:Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Text(
                  "Крок 1 із 3",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: widget.age=="-1" || widget.age.isEmpty ? 'Вік' : widget.age.toString(),
                  ),
                  autofocus: false,
                  controller: _ageController,
                  onChanged: (text){
                    widget.age=text;
                  },
                  validator: (value) => FormValidator().validateAge(value),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10, left:10, right: 300),
                child: Text(
                  "Стать",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 9, vertical: 10),
                    child:ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                            horizontal: Provider.of<ThemeModel>(context).currentTheme == lightTheme ? 20 : 13, vertical: 5),
                        shadowColor: Colors.grey,
                        primary: Provider.of<ThemeModel>(context).currentTheme == lightTheme ? Color(0xffc3ccfa) : Color(0xff151050),
                        shape: RoundedRectangleBorder(
                            side: widget.sex==0
                                ? BorderSide(
                                color: Provider.of<ThemeModel>(context).currentTheme == lightTheme ? Color(0xff000000) : Color(0xffffffff),
                                width: 1.5,
                                style: BorderStyle.solid
                            )
                                :BorderSide(
                                color: Provider.of<ThemeModel>(context).currentTheme == lightTheme ? Color(0xffc3ccfa) : Color(0xff151050),
                                width: 1.5,
                                style: BorderStyle.solid
                            ),
                            borderRadius: new BorderRadius.circular(10.0)
                        ),
                      ),
                      onPressed: () {
                        widget.sex = 0;
                        Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.fade,
                            child: firstPage(age: widget.age,sex: widget.sex, link: widget.link),
                          ),
                        );
                      },
                      child: Row(children: [
                        Image.asset(Provider.of<ThemeModel>(context).currentTheme == lightTheme ? "assets/man.png" : "assets/man_light.png"),
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text(
                            'Чоловіча',
                            style: TextStyle(
                                color: Provider.of<ThemeModel>(context).currentTheme == lightTheme ? Color(0xff000000) : Color(0xffffffff),
                            ),
                          ),
                        ),
                      ]),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 9, vertical: 10),
                    child:ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                            horizontal: Provider.of<ThemeModel>(context).currentTheme == lightTheme ? 20 : 18, vertical: 5),
                        shadowColor: Colors.grey,
                        primary: Provider.of<ThemeModel>(context).currentTheme == lightTheme ? Color(0xffe8fac3) : Color(0xff113331),
                        shape: RoundedRectangleBorder(
                            side: widget.sex==1
                                ? BorderSide(
                                color: Provider.of<ThemeModel>(context).currentTheme == lightTheme ? Color(0xff000000) : Color(0xffffffff),
                                width: 1.5,
                                style: BorderStyle.solid)
                                : BorderSide(
                                color: Provider.of<ThemeModel>(context).currentTheme == lightTheme ? Color(0xffe8fac3) : Color(0xff113331),
                                width: 1.5,
                                style: BorderStyle.solid),
                            borderRadius: new BorderRadius.circular(10.0)
                        ),
                      ),
                      onPressed: () {
                        widget.sex = 1;
                        Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.fade,
                              child: firstPage(age: widget.age,sex: widget.sex, link: widget.link)
                          ),
                        );
                      },
                      child: Row(children: [
                        Icon(
                            Icons.star_rounded,
                            color: Provider.of<ThemeModel>(context).currentTheme == lightTheme ? Color(0xff000000) : Color(0xffffffff),
                            size: 25),
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text(
                            'Інша',
                            style: TextStyle(
                                color: Provider.of<ThemeModel>(context).currentTheme == lightTheme ? Color(0xff000000) : Color(0xffffffff),
                            ),
                          ),
                        ),
                      ]),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 9, vertical: 10),
                    child:ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                            horizontal: Provider.of<ThemeModel>(context).currentTheme == lightTheme ? 20 : 20, vertical: 5),
                        shadowColor: Colors.grey,
                        primary: Provider.of<ThemeModel>(context).currentTheme == lightTheme ? Color(0xfffad7c3) : Color(0xff2E163D),
                        shape: RoundedRectangleBorder(
                            side: widget.sex==2
                                ? BorderSide(
                                color: Provider.of<ThemeModel>(context).currentTheme == lightTheme ? Color(0xff000000) : Color(0xffffffff),
                                width: 1.5,
                                style: BorderStyle.solid
                            )
                                :BorderSide(
                                color: Provider.of<ThemeModel>(context).currentTheme == lightTheme ? Color(0xfffad7c3) : Color(0xff2E163D),
                                width: 1.5,
                                style: BorderStyle.solid
                            ),
                            borderRadius: new BorderRadius.circular(10.0)
                        ),
                      ),
                      onPressed: () {
                        widget.sex = 2;
                        Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.fade,
                              child: firstPage(age: widget.age,sex: widget.sex, link: widget.link)
                          ),
                        );
                      },
                      child: Row(children: [
                        Image.asset(Provider.of<ThemeModel>(context).currentTheme == lightTheme ? "assets/woman.png" : "assets/woman_light.png"),
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text(
                            'Жіноча',
                            style: TextStyle(
                                color: Provider.of<ThemeModel>(context).currentTheme == lightTheme ? Color(0xff000000) : Color(0xffffffff),
                            ),
                          ),
                        ),
                      ]),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 10, left:10, right: 50),
                child: Text(
                  "Посилання на Twitter чи Facebook(опціонально)",
                  style: TextStyle(
                      fontSize: 14,
                      color: Color(0xff568eae)
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: TextFormField(
                  decoration:  InputDecoration(
                    hintText: widget.link=="None" ? "" : widget.link,
                    helperText: '*Якщо профіль закритий, аналіз сторінки неможливий',
                  ),
                  autofocus: false,
                  controller: _linkController,
                  onChanged: (text){
                      widget.link=text;
                  },
                  validator: (value) => FormValidator().validateLink(value),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 16.0, horizontal: 20
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
                    if(_firstPageKey.currentState.validate() || FormValidator().validateAge(widget.age)==null){
                      setState(() {
                        _firstValidate = false;
                      });
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => secondPage(age: int.parse(widget.age),sex: widget.sex, link: widget.link.isEmpty ? "None" : widget.link),
                        ),
                      );
                      return;
                    }
                    widget.link="";
                    setState(() {
                      _firstValidate = true;
                    });
                  },
                  child:
                  Text(
                    'Наступний крок',
                    style: TextStyle(color: Color(0xffffffff)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: NavigationBar(),
    );
  }
}