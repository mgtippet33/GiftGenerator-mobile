import 'package:flutter/material.dart';
import 'package:gift_generator/pages/firstFindPage.dart';
import 'navigation.dart';

class Find extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: firstPage(age:"-1",sex:1,link:"None"),
    );
  }
}