import 'package:calculator/pages/home_page.dart';
import 'package:calculator/pages/home_page2.dart';

import 'package:flutter/material.dart';
import 'package:preferences/preferences.dart';

void main() async {
  await PrefService.init(prefix: 'cal_');
  // PrefService.setDefaultValues({'user_description': 'This is my description!'});
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Small Business Calculator',
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: MyHomePage2(),
    );
  }
}
