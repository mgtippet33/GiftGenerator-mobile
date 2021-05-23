import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gift_generator/blocs/auth_bloc.dart';
import 'package:gift_generator/pages/account/cabinet.dart';
import 'package:gift_generator/themeModel.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SharedPreferences.getInstance().then((prefs) {
    prefs.setBool('isAllNotificationsRead', false);
  });
  runApp(ChangeNotifierProvider(
    create: (BuildContext context) => ThemeModel(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => AuthBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: Provider.of<ThemeModel>(context).currentTheme,
        home: Cabinet(),
      ),
    );
  }
}
