import 'package:flutter/material.dart';
import 'package:weatherapp/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

 class _MyAppState extends State<MyApp> {
  bool isDarkMode = true;

  void toggleDarkMode(bool value) {
    setState(() {
      isDarkMode = value;
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme:  isDarkMode ? ThemeData.dark() : ThemeData.light(),
      home:HomePage(isDarkMode: isDarkMode, toggleDarkMode: toggleDarkMode),
    );
  }
}
