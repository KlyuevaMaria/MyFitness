import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:example/custom_icons.dart';
// import 'package:example/pages/comments.dart';
import 'pages/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My fitness',
      theme: ThemeData(
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            selectedItemColor: Color.fromRGBO(40, 40, 40, 1),
            unselectedItemColor: Colors.white,
            showSelectedLabels: false,
            showUnselectedLabels: false,
          ),
          canvasColor: Colors.blueAccent[400],
          textTheme: const TextTheme(
              bodyMedium: TextStyle(
                  fontSize: 36,
                  fontFamily: "Montserrat",
                  color: Color.fromRGBO(144, 144, 144, 1),
                  fontWeight: FontWeight.bold))),
      color: const Color.fromRGBO(26, 26, 26, 1),
      home: const MyHomePage(title: 'Home Page'),
    );
  }
}
