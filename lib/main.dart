import 'package:flutter/material.dart';
import 'package:rentex/screens/HomeScreen.dart';
import 'package:rentex/utlis/AppRoutes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rentex',
      theme: ThemeData(
        primaryColor: const Color.fromRGBO(244, 245, 246, 1),
        fontFamily: "Inter",
      ),
      routes: {AppRoutes.home: (_) => HomeScreen()},
    );
  }
}
