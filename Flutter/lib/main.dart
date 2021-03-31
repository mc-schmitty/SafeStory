import 'package:QA/colored_button.dart';
import 'package:QA/constants.dart';
import 'package:QA/simple_textformfield.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:http/http.dart';

import 'home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Helvetica'
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

