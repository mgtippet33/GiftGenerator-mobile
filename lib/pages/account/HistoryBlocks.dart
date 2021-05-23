import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gift_generator/models/UserHandler.dart';
import 'package:gift_generator/models/UserHistoryModel.dart';
import 'package:gift_generator/themeModel.dart';
import 'package:gift_generator/themes/lightTheme.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class HistoryBlocks extends StatefulWidget {
  UserHistoryModel _historyBlocks;

  HistoryBlocks(this._historyBlocks);

  @override
  _HistoryBlocksState createState() => _HistoryBlocksState(this._historyBlocks);
}

class _HistoryBlocksState extends State<HistoryBlocks> {
  bool isFirstOpen = false;
  bool isSecondOpen = false;

  var _openBox = false;
  UserHistoryModel _historyBlocks;

  _HistoryBlocksState(this._historyBlocks);

  @override
  void setState(fn) {
    // TODO: implement setState
    super.setState(fn);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: _openBox ? 550 : 230,
        width: 340,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Provider.of<ThemeModel>(context).currentTheme == lightTheme ? Color(0xffC3CCFA) : Color(0xff151050),
          boxShadow: [
            BoxShadow(
              color: Provider.of<ThemeModel>(context).currentTheme == lightTheme ? Colors.grey.withOpacity(0.5) : Colors.black.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    _historyBlocks.holiday,
                    style: new TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16.0,
                      color: Provider.of<ThemeModel>(context).currentTheme == lightTheme ? Color(0xff1D1C1C) : Color(0xffE5E5E5),
                    ),
                  ),
                  Text(
                    _historyBlocks.date,
                    style: new TextStyle(
                      fontWeight: FontWeight.w200,
                      fontSize: 16.0,
                      color: Provider.of<ThemeModel>(context).currentTheme == lightTheme ? Color(0xff1D1C1C) : Color(0xffE5E5E5),
                    ),
                  ),
                ],
              ),
              Text(
                _historyBlocks.interests.join(', '),
                style: new TextStyle(
                  fontWeight: FontWeight.w200,
                  fontSize: 16.0,
                  color: Provider.of<ThemeModel>(context).currentTheme == lightTheme ? Color(0xff1D1C1C) : Color(0xffE5E5E5),
                ),
              ),
              Padding(padding: EdgeInsets.symmetric(vertical: 5)),
              Text(
                _historyBlocks.link != "null"
                    ? _historyBlocks.link
                    : "Посилання на соціальну мережу не надавалося",
                style: new TextStyle(
                  fontSize: 14.0,
                  color: Provider.of<ThemeModel>(context).currentTheme == lightTheme ? Color(0xff1D1C1C) : Color(0xffE5E5E5),
                ),
              ),
              Padding(padding: EdgeInsets.symmetric(vertical: 5)),
              Text(
                "Стать: " +
                    _historyBlocks.gender +
                    " , вік: " +
                    _historyBlocks.age.toString(),
                style: new TextStyle(
                  fontSize: 15.0,
                  color: Provider.of<ThemeModel>(context).currentTheme == lightTheme ? Color(0xff1D1C1C) : Color(0xffE5E5E5),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 0),
                child: _openGifts(_openBox),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Provider.of<ThemeModel>(context).currentTheme == lightTheme ? Color(0xffC3CCFA) : Color(0xff151050),
                  padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                  elevation: 0,
                ),
                onPressed: () => {setState(() => _openBox = !_openBox)},
                child: Container(
                    child: Icon(
                  _openBox == true ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                  size: 30,
                      color: Provider.of<ThemeModel>(context).currentTheme == lightTheme ? Color(0xff1D1C1C) : Color(0xffCBCBCD),
                )),
              ),
            ],
          ),
        ));
  }

  _openGifts(bool isOpen) {
    if (isOpen) {
      return Padding(
        padding: const EdgeInsets.only(top : 30),
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '1. ' + _historyBlocks.gifts[0].name+"...",
                  style: new TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 15.0,
                    color: Provider.of<ThemeModel>(context).currentTheme == lightTheme ? Color(0xff1D1C1C) : Color(0xffE5E5E5),
                  ),
                ),
                Text(
                  "Рейтинг " + _historyBlocks.gifts[0].rate.toString(),
                  style: new TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 14.0,
                    color: Provider.of<ThemeModel>(context).currentTheme == lightTheme ? Color(0xff1D1C1C) : Color(0xffE5E5E5),
                  ),
                ),
                InkWell(
                  child: new Text('Посилання на подарунок',
                      style: TextStyle(
                          color: Colors.lightBlue,
                          decoration: TextDecoration.underline,
                          fontSize: 14)),
                  onTap: () => launch(_historyBlocks.gifts[0].link),
                ),
                // Text(
                //   _historyBlocks.gifts[0].link,
                //   style: new TextStyle(
                //     fontWeight: FontWeight.w200,
                //     fontSize: 12.0,
                //     color: Colors.black,
                //   ),
                // ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '2. ' + _historyBlocks.gifts[1].name+"...",
                  style: new TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 15.0,
                    color: Provider.of<ThemeModel>(context).currentTheme == lightTheme ? Color(0xff1D1C1C) : Color(0xffE5E5E5),
                  ),
                ),
                Text(
                  "Рейтинг " + _historyBlocks.gifts[1].rate.toString(),
                  style: new TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 14.0,
                    color: Provider.of<ThemeModel>(context).currentTheme == lightTheme ? Color(0xff1D1C1C) : Color(0xffE5E5E5),
                  ),
                ),
                InkWell(
                  child: new Text('Посилання на подарунок',
                      style: TextStyle(
                          color: Colors.lightBlue,
                          decoration: TextDecoration.underline,
                          fontSize: 14)),
                  onTap: () => launch(_historyBlocks.gifts[1].link),
                ),
                // Text(
                //   _historyBlocks.gifts[0].link,
                //   style: new TextStyle(
                //     fontWeight: FontWeight.w200,
                //     fontSize: 12.0,
                //     color: Colors.black,
                //   ),
                // ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '3. ' + _historyBlocks.gifts[2].name+"...",
                  style: new TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 15.0,
                    color: Provider.of<ThemeModel>(context).currentTheme == lightTheme ? Color(0xff1D1C1C) : Color(0xffE5E5E5),
                  ),
                ),
                Text(
                  "Рейтинг " + _historyBlocks.gifts[2].rate.toString(),
                  style: new TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 14.0,
                    color: Provider.of<ThemeModel>(context).currentTheme == lightTheme ? Color(0xff1D1C1C) : Color(0xffE5E5E5),
                  ),
                ),
                InkWell(
                  child: new Text('Посилання на подарунок',
                      style: TextStyle(
                          color: Colors.lightBlue,
                          decoration: TextDecoration.underline,
                          fontSize: 14)),
                  onTap: () => launch(_historyBlocks.gifts[2].link),
                ),
                // Text(
                //   _historyBlocks.gifts[0].link,
                //   style: new TextStyle(
                //     fontWeight: FontWeight.w200,
                //     fontSize: 12.0,
                //     color: Colors.black,
                //   ),
                // ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '4. ' + _historyBlocks.gifts[3].name+"...",
                  style: new TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 15.0,
                    color: Provider.of<ThemeModel>(context).currentTheme == lightTheme ? Color(0xff1D1C1C) : Color(0xffE5E5E5),
                  ),
                ),
                Text(
                  "Рейтинг " + _historyBlocks.gifts[3].rate.toString(),
                  style: new TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 14.0,
                    color: Provider.of<ThemeModel>(context).currentTheme == lightTheme ? Color(0xff1D1C1C) : Color(0xffE5E5E5),
                  ),
                ),
                InkWell(
                  child: new Text('Посилання на подарунок',
                      style: TextStyle(
                          color: Colors.lightBlue,
                          decoration: TextDecoration.underline,
                          fontSize: 14)),
                  onTap: () => launch(_historyBlocks.gifts[3].link),
                ),
                // Text(
                //   _historyBlocks.gifts[0].link,
                //   style: new TextStyle(
                //     fontWeight: FontWeight.w200,
                //     fontSize: 12.0,
                //     color: Colors.black,
                //   ),
                // ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '5. ' + _historyBlocks.gifts[4].name+"...",
                  style: new TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 15.0,
                    color: Provider.of<ThemeModel>(context).currentTheme == lightTheme ? Color(0xff1D1C1C) : Color(0xffE5E5E5),
                  ),
                ),
                Text(
                  "Рейтинг " + _historyBlocks.gifts[4].rate.toString(),
                  style: new TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 14.0,
                    color: Provider.of<ThemeModel>(context).currentTheme == lightTheme ? Color(0xff1D1C1C) : Color(0xffE5E5E5),
                  ),
                ),
                InkWell(
                  child: new Text('Посилання на подарунок',
                      style: TextStyle(
                          color: Colors.lightBlue,
                          decoration: TextDecoration.underline,
                          fontSize: 14)),
                  onTap: () => launch(_historyBlocks.gifts[4].link),
                ),
                // Text(
                //   _historyBlocks.gifts[0].link,
                //   style: new TextStyle(
                //     fontWeight: FontWeight.w200,
                //     fontSize: 12.0,
                //     color: Colors.black,
                //   ),
                // ),
              ],
            ),
          ),
        ]),
      );
    }
    return SizedBox(
      height: 0,
    );
  }
}
