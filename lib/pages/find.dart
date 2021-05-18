import 'package:flutter/material.dart';

import 'navigation.dart';

class Find extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Пошук подарунку"),
        automaticallyImplyLeading: false,
      ),
      body: Column(),
      bottomNavigationBar: NavigationBar(),
    );
  }
}