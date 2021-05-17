import 'package:flutter/material.dart';
import 'package:gift_generator/themeModel.dart';
import 'package:provider/provider.dart';


class LoginPage extends StatelessWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Gift generator'),
        ),
        body: Center(
            //TODO move this to appropriate button on navigation
            child: RaisedButton(
                child: Text("Change Theme"),
                onPressed: () {
                  Provider.of<ThemeModel>(context).toggleTheme();
                })));
  }
}
