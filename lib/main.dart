import 'package:face_net_authentication/locator_screen.dart';
import 'package:face_net_authentication/pages/home_page_screen.dart';
import 'package:flutter/material.dart';

/*
Title:Entry Point of a Application
Purpose:Entry Point of a Application
Created By:Kalpesh Khandla
Created Date: 19 Feb 2022
*/

void main() {
  setupServices();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePageScreen(),
    );
  }
}
