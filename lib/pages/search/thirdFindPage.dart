import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gift_generator/pages/navigation.dart';
import 'package:gift_generator/pages/search/deathFindPage.dart';
import 'package:gift_generator/pages/search/resultFindPage.dart';
import 'package:gift_generator/pages/search/secondFindPage.dart';
import 'package:gift_generator/themeModel.dart';
import 'package:gift_generator/themes/lightTheme.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class thirdPage extends StatefulWidget {
  var list;

  var chose;

  String line;
  final age;
  final sex;
  final link;
  final holiday;

  thirdPage(
      {Key key,
      this.sex,
      this.age,
      this.link,
      this.holiday,
      this.list,
      this.chose,
      this.line})
      : super(key: key);

  @override
  _thirdPageState createState() => _thirdPageState();
}

class _thirdPageState extends State<thirdPage> {
  Future<Null> _showDialog() async {
    await showDialog<String>(
        context: context,
        builder: (BuildContext context) {
          return new AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            backgroundColor:  Provider.of<ThemeModel>(context).currentTheme == lightTheme ? Color(0xFFF8F8F8) : Color(0xFF575863),
            title: Center(
              child: Column(
                children: [
                  Text("Ви впевнені, що хочете ",
                      style: TextStyle(color: Provider.of<ThemeModel>(context).currentTheme == lightTheme ? Colors.black : Color(0xFFE5E5E5), fontSize: 20)),
                  Text("повернутися назад?",
                      style: TextStyle(color: Provider.of<ThemeModel>(context).currentTheme == lightTheme ? Colors.black : Color(0xFFE5E5E5), fontSize: 20)),
                  Padding(
                    padding: EdgeInsets.only(top: 15),
                    child: Text("Введені данні на цьому",
                        style: TextStyle(color: Provider.of<ThemeModel>(context).currentTheme == lightTheme ? Colors.black : Color(0xFFE5E5E5), fontSize: 16)),
                  ),
                  Text("кроці будуть втрачені",
                      style: TextStyle(color: Provider.of<ThemeModel>(context).currentTheme == lightTheme ? Colors.black : Color(0xFFE5E5E5), fontSize: 16)),
                ],
              ),
            ),
            contentPadding: EdgeInsets.all(5.0),
            actions: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 30, right: 60),
                child: FlatButton(
                  child: Center(
                    child: Text("Так",
                        style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                            color: Provider.of<ThemeModel>(context).currentTheme == lightTheme ? Colors.black : Color(0xFFE5E5E5))),
                  ),
                  onPressed: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => secondPage(
                            age: widget.age,
                            sex: widget.sex,
                            link: widget.link),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 30),
                child: FlatButton(
                  child: Center(
                    child: Text("Ні",
                        style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                            color: Provider.of<ThemeModel>(context).currentTheme == lightTheme ? Colors.black : Color(0xFFE5E5E5))),
                  ),
                  onPressed: () async {
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Provider.of<ThemeModel>(context).currentTheme == lightTheme
              ? Color(0xffffffff)
              : Color(0xff111323),
      appBar: NewGradientAppBar(
        gradient: Provider.of<ThemeModel>(context).currentTheme == lightTheme
            ? LinearGradient(colors: [Color(0xffAFCDFA), Color(0xffAEE3FA)])
            : LinearGradient(colors: [Color(0xff234983), Color(0xff4B81C3)]),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 10, right: 60),
              child: InkWell(
                onTap: () {
                  _showDialog();
                },
                child: Icon(Icons.arrow_back_rounded,
                    color: Provider.of<ThemeModel>(context).currentTheme ==
                            lightTheme
                        ? Color(0xff6d6b6b)
                        : Color(0xffffffff),
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
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 120, vertical: 20),
              child: Text(
                "Крок 3 із 3",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: TextField(
                decoration: InputDecoration(
                  hintText: widget.line == "" ? 'Пошук інтересів' : widget.line,
                ),
                autofocus: false,
                onSubmitted: (text) {
                  var resultList = [];
                  var resultChose = [];
                  for (int i = 0; i < widget.list.length; i++) {
                    if (widget.list[i]
                            .toLowerCase()
                            .indexOf(text.toLowerCase()) !=
                        -1) {
                      resultList.add(widget.list[i]);
                      resultChose.add(widget.chose[i]);
                    }
                  }
                  for (int i = 0; i < widget.list.length; i++) {
                    if (widget.list[i]
                            .toLowerCase()
                            .indexOf(text.toLowerCase()) ==
                        -1) {
                      resultList.add(widget.list[i]);
                      resultChose.add(widget.chose[i]);
                    }
                  }
                  Navigator.push(
                    context,
                    PageTransition(
                      type: PageTransitionType.fade,
                      child: thirdPage(
                          age: widget.age,
                          sex: widget.sex,
                          link: widget.link,
                          holiday: widget.holiday,
                          list: resultList,
                          chose: resultChose,
                          line: text),
                    ),
                  );
                },
              ),
            ),
            Column(
              children: [
                for (int i = 0; i < 26; i += 2)
                  Row(
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                        child: ButtonTheme(
                          minWidth: 170.0,
                          height: 40.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: RaisedButton(
                            color: widget.chose[i]
                                ? Provider.of<ThemeModel>(context)
                                            .currentTheme ==
                                        lightTheme
                                    ? Color(0xffc3ccfa)
                                    : Color(0xff2E163D)
                                : Provider.of<ThemeModel>(context)
                                            .currentTheme ==
                                        lightTheme
                                    ? Color(0xffe8fac3)
                                    : Color(0xff113331),
                            onPressed: () {
                              widget.line = "";
                              widget.chose[i] = !widget.chose[i];
                              var tmp1 = widget.list[i];
                              var tmp2 = widget.chose[i];
                              if (widget.chose[i]) {
                                for (int j = i - 1; j >= 0; j--) {
                                  widget.list[j + 1] = widget.list[j];
                                  widget.chose[j + 1] = widget.chose[j];
                                }
                                widget.list[0] = tmp1;
                                widget.chose[0] = tmp2;
                              } else {
                                for (int j = i + 1;
                                    j < widget.list.length;
                                    j++) {
                                  widget.list[j - 1] = widget.list[j];
                                  widget.chose[j - 1] = widget.chose[j];
                                }
                                widget.list[widget.list.length - 1] = tmp1;
                                widget.chose[widget.list.length - 1] = tmp2;
                              }
                              Navigator.push(
                                context,
                                PageTransition(
                                  type: PageTransitionType.fade,
                                  child: thirdPage(
                                      age: widget.age,
                                      sex: widget.sex,
                                      link: widget.link,
                                      holiday: widget.holiday,
                                      list: widget.list,
                                      chose: widget.chose,
                                      line: widget.line),
                                ),
                              );
                            },
                            child: Row(
                              children: [
                                widget.chose[i]
                                    ? Icon(Icons.check_box,
                                        color: Provider.of<ThemeModel>(context)
                                                    .currentTheme ==
                                                lightTheme
                                            ? Color(0xff1d1c1c)
                                            : Color(0xffffffff),
                                        size: 15)
                                    : Icon(Icons.check_box_outline_blank,
                                        color: Provider.of<ThemeModel>(context)
                                                    .currentTheme ==
                                                lightTheme
                                            ? Color(0xff1d1c1c)
                                            : Color(0xffffffff),
                                        size: 15),
                                Padding(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Text(
                                    widget.list[i],
                                    style: TextStyle(
                                      color: Provider.of<ThemeModel>(context)
                                                  .currentTheme ==
                                              lightTheme
                                          ? Color(0xff1d1c1c)
                                          : Color(0xffffffff),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                        child: ButtonTheme(
                          minWidth: 170.0,
                          height: 40.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: RaisedButton(
                            color: widget.chose[i + 1]
                                ? Provider.of<ThemeModel>(context)
                                            .currentTheme ==
                                        lightTheme
                                    ? Color(0xffc3ccfa)
                                    : Color(0xff2E163D)
                                : Provider.of<ThemeModel>(context)
                                            .currentTheme ==
                                        lightTheme
                                    ? Color(0xffe8fac3)
                                    : Color(0xff113331),
                            onPressed: () {
                              widget.line = "";
                              widget.chose[i + 1] = !widget.chose[i + 1];
                              var tmp1 = widget.list[i + 1];
                              var tmp2 = widget.chose[i + 1];
                              if (widget.chose[i + 1]) {
                                for (int j = i; j >= 0; j--) {
                                  widget.list[j + 1] = widget.list[j];
                                  widget.chose[j + 1] = widget.chose[j];
                                }
                                widget.list[0] = tmp1;
                                widget.chose[0] = tmp2;
                              } else {
                                for (int j = i + 2;
                                    j < widget.list.length;
                                    j++) {
                                  widget.list[j - 1] = widget.list[j];
                                  widget.chose[j - 1] = widget.chose[j];
                                }
                                widget.list[widget.list.length - 1] = tmp1;
                                widget.chose[widget.list.length - 1] = tmp2;
                              }
                              Navigator.push(
                                context,
                                PageTransition(
                                  type: PageTransitionType.fade,
                                  child: thirdPage(
                                      age: widget.age,
                                      sex: widget.sex,
                                      link: widget.link,
                                      holiday: widget.holiday,
                                      list: widget.list,
                                      chose: widget.chose,
                                      line: widget.line),
                                ),
                              );
                            },
                            child: Row(
                              children: [
                                widget.chose[i + 1]
                                    ? Icon(Icons.check_box,
                                        color: Provider.of<ThemeModel>(context)
                                                    .currentTheme ==
                                                lightTheme
                                            ? Color(0xff1d1c1c)
                                            : Color(0xffffffff),
                                        size: 15)
                                    : Icon(Icons.check_box_outline_blank,
                                        color: Provider.of<ThemeModel>(context)
                                                    .currentTheme ==
                                                lightTheme
                                            ? Color(0xff1d1c1c)
                                            : Color(0xffffffff),
                                        size: 15),
                                Padding(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Text(
                                    widget.list[i + 1],
                                    style: TextStyle(
                                      color: Provider.of<ThemeModel>(context)
                                                  .currentTheme ==
                                              lightTheme
                                          ? Color(0xff1d1c1c)
                                          : Color(0xffffffff),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
              ],
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 140, vertical: 15),
                  shadowColor: Colors.black,
                  primary: Color(0xff3d99df),
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(10.0)),
                ),
                onPressed: () {
                  var result = [];
                  for (int i = 0; i < widget.list.length; i++) {
                    if (widget.chose[i] == true)
                      result.add(widget.list[i]);
                    else
                      break;
                  }
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => resultPage(
                          age: widget.age,
                          sex: widget.sex,
                          link: widget.link,
                          holiday: widget.holiday,
                          list: widget.list,
                          chose: widget.chose,
                          line: widget.line),
                    ),
                  );
                },
                child: Text(
                  'ЗНАЙТИ',
                  style: TextStyle(color: Color(0xffffffff)),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: NavigationBar(),
    );
  }
}
