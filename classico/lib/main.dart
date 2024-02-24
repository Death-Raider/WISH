import 'package:classico/Widgets/theme.dart';
import 'package:classico/pages/login_page.dart';
import 'package:classico/pages/new_page.dart';
import 'package:classico/pages/profile_page.dart';
import 'package:classico/pages/question.dart';
import 'package:classico/pages/test.dart';
import 'package:classico/utils/routes.dart';
import "package:flutter/material.dart";
void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: LoginPage(),
      themeMode: ThemeMode.light,
      theme: MyTheme.lightTheme(context),
      debugShowCheckedModeBanner: false,
      darkTheme: MyTheme.darkTheme(context),
      initialRoute: "/Login",
      routes: {
        // "/": (context) => LoginPage(),
        MyRoutes.homeRoute: (context) => HomePage(),
        MyRoutes.loginRoute: (context) => LoginPage(),
        MyRoutes.profileRoute: (context) => ProfilePage(),
        MyRoutes.questionRoute: (context) => Question(),
        MyRoutes.testRoute: (context) => MyHomePage(),

      },
    );
  }
}
