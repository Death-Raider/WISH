import 'package:wish/Widgets/theme.dart';
import 'package:wish/pages/login_page.dart';
import 'package:wish/pages/home_page.dart';
import 'package:wish/pages/profile_page.dart';
import 'package:wish/pages/question.dart';
import 'package:wish/Widgets/papers.dart';
import 'package:wish/utils/routes.dart';
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
      // themeMode: ThemeMode.light,
      theme: pinkTheme,
      debugShowCheckedModeBanner: false,
      // darkTheme: MyTheme.darkTheme(context),
      initialRoute: "/Login",
      routes: {
        // "/": (context) => LoginPage(),
        MyRoutes.homeRoute: (context) => HomePage(),
        MyRoutes.loginRoute: (context) => LoginPage(),
        MyRoutes.profileRoute: (context) => ProfilePage(),
        MyRoutes.questionRoute: (context) => Question(),
        MyRoutes.testRoute: (context) => Papers(),

      },
    );
  }
}
