import 'package:wish/utils/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  final imageUrl =
      "https://media.licdn.com/dms/image/D4E03AQEogjonWyeQpQ/profile-displayphoto-shrink_400_400/0/1681233738946?e=1712793600&v=beta&t=PT85k-4Fp1BwMNxzPt4wslq5x2cC_MEgiXWlnpmo978";

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.purple,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                margin: EdgeInsets.zero,
                decoration: BoxDecoration(color: Colors.purple),
                accountName: Text("Shlok Sharma"),
                accountEmail: Text("shlok@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(imageUrl),
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.home,
                color: Colors.white,
              ),
              title: Text(
                "Home",
                textScaleFactor: 1.2,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                Navigator.pushNamed(context, MyRoutes.homeRoute);
              },
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.profile_circled,
                color: Colors.white,
              ),
              title: Text(
                "Profile",
                textScaleFactor: 1.2,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                Navigator.pushNamed(context, MyRoutes.profileRoute);
              },
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.mail,
                color: Colors.white,
              ),
              title: Text(
                "Email me",
                textScaleFactor: 1.2,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                Navigator.pushNamed(context, MyRoutes.loginRoute);
              },
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.doc_chart,
                color: Colors.white,
              ),
              title: Text(
                "Create Questionarrie",
                textScaleFactor: 1.2,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                Navigator.pushNamed(context, MyRoutes.questionRoute);
              },
            ),
          ],
        ),
      ),
    );
  }
}
