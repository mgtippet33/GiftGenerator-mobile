import 'package:flutter/material.dart';
import 'package:gift_generator/pages/search/firstFindPage.dart';
import 'package:gift_generator/themeModel.dart';
import 'package:gift_generator/themes/lightTheme.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import 'package:provider/provider.dart';

class Find extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  firstPage(age: "-1", sex: 1, link: "");
  }
}
