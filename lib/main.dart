// ignore_for_file: unused_import

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pencatatan_keuangan2/pages/main_pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Menghilangkan banner debug
      home: MainPage(),
      theme: ThemeData(primarySwatch: Colors.green),
    );
  }
}
