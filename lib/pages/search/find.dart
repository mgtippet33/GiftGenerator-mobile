import 'package:flutter/material.dart';
import 'package:gift_generator/pages/search/firstFindPage.dart';
import 'package:gift_generator/themeModel.dart';
import 'package:gift_generator/themes/lightTheme.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import 'package:provider/provider.dart';

class Find extends StatelessWidget {
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
      ),
      body: firstPage(age: "-1", sex: 1, link: ""),
    );
  }
}
