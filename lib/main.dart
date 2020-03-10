import 'package:demo8/addbook.dart';
import 'package:demo8/book.dart';
import 'package:flutter/material.dart';




void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SQFlite Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: buildMaterialApp(),
    );
  }
}

MaterialApp buildMaterialApp() {
  return MaterialApp(
    title: 'Flutter Demo',
    theme: ThemeData(
      primarySwatch: Colors.amber,
    ),
    initialRoute: '/',
    routes: {
      '/': (context) => BookPage(),
      '/addbook': (context) => AddBookPage(),
    },
  );
}

