import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:local_database_2/pages/account_page.dart';
import 'package:local_database_2/pages/home_page.dart';

void main() async{
  await Hive.initFlutter();
  await Hive.openBox("SignIn");
  await Hive.openBox("SignUp");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
      routes: {
        HomePage.id : (context) => HomePage(),
        AccountPage.id : (context) => AccountPage(),
      },
    );
  }
}
