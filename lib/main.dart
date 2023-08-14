import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'country/view/country_list_screen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Filtered Countries',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CountryListScreen(),
    );
  }
}

