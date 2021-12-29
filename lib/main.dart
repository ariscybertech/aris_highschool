import 'package:flutter/material.dart';
import 'package:highschool/screen/feed/main.dart';
import 'package:highschool/screen/login/login.dart';
import 'package:highschool/screen/role/login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/login': (context) => LoginPage(),
          '/loginrole': (context) => LoginRolePage(),
          // When we navigate to the "/second" route, build the SecondScreen Widget
          '/feeds': (context) => FeedScreen(),
        },
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: LoginPage());
  }
}
