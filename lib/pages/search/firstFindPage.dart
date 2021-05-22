import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gift_generator/pages/navigation.dart';
import 'package:gift_generator/pages/search/secondFindPage.dart';
import 'package:gift_generator/services/validator.dart';
import 'package:page_transition/page_transition.dart';

// int globalSex=-1;
// int globalAge=-1;
// // String a = "";
// String globalLink="None";
class firstPage extends StatefulWidget{
  String age;
  int sex;
  String link;
  firstPage({Key key, this.age, this.sex, this.link}) : super(key: key);
  //firstPage({Key key}) : super(key: key);
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
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.symmetric(horizontal: 96),
          child: Text("Пошук подарунку")
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
                            horizontal: 20, vertical: 5),
                        shadowColor: Colors.black,
                        primary: Color(0xffc3ccfa),
                        shape: RoundedRectangleBorder(
                            side: widget.sex==0
                                ? BorderSide(
                                color: Color(0xff000000),
                                width: 1.5,
                                style: BorderStyle.solid
                            )
                                :BorderSide(
                                color: Color(0xffc3ccfa),
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
                        Image.asset("assets/man.png"),
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text(
                            'Чоловіча',
                            style: TextStyle(color: Colors.black54),
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
                            horizontal: 20, vertical: 5),
                        shadowColor: Colors.black,
                        primary: Color(0xffe8fac3),
                        shape: RoundedRectangleBorder(
                            side: widget.sex==1
                                ? BorderSide(
                                color: Color(0xff000000),
                                width: 1.5,
                                style: BorderStyle.solid)
                                : BorderSide(
                                color: Color(0xffe8fac3),
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
                        Icon(Icons.star_rounded, color: const Color(0xff1d1c1c), size: 25),
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text(
                            'Інша',
                            style: TextStyle(color: Colors.black54),
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
                            horizontal: 20, vertical: 5),
                        shadowColor: Colors.black,
                        primary: Color(0xfffad7c3),
                        shape: RoundedRectangleBorder(
                            side: widget.sex==2
                                ? BorderSide(
                                color: Color(0xff000000),
                                width: 1.5,
                                style: BorderStyle.solid
                            )
                                :BorderSide(
                                color: Color(0xfffad7c3),
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
                        Image.asset("assets/woman.png"),
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text(
                            'Жіноча',
                            style: TextStyle(color: Colors.black54),
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
                    hintText: widget.link == "None" ? 'https://www.facebook.com/dari.na.165' : widget.link,
                    helperText: '*Якщо профіль закритий, аналіз сторінки неможливий',
                  ),
                  autofocus: false,
                  controller: _linkController,
                  onChanged: (text){
                    if(FormValidator().validateLink(text)==null)
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
                          builder: (context) => secondPage(age: int.parse(widget.age),sex: widget.sex, link: widget.link),
                        ),
                      );
                      return;
                    }
                    widget.age="-1";
                    widget.link="None";
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