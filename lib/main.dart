import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gift_generator/blocs/auth_bloc.dart';
import 'package:gift_generator/pages/notification.dart';
import 'package:provider/provider.dart';

//pages imports
import 'package:gift_generator/pages/loginPage.dart';
import 'package:gift_generator/themeModel.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
        home: LoginPage(),
      ),
    );
  }
}
