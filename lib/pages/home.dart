import 'package:flutter/material.dart';
import 'package:example/custom_icons.dart';
import 'package:example/pages/comments_page.dart';
import 'package:example/pages/bot_page.dart';
import 'package:example/pages/home_page.dart';
import 'package:example/pages/statistic_page.dart';
import 'package:example/pages/achieve_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  PageController pageController = PageController();

  void onTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    // pageController.jumpToPage(index);
  }

  final List<Widget> _pages = [
    const Comments(),
    const Home(),
    const Statistic(),
    const Achieve(),
    const Bot(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        // backgroundColor:
        //     Theme.of(context).bottomNavigationBarTheme.backgroundColor,
        iconSize: 35,

        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(CustomIcons.cup), label: 'main'),
          BottomNavigationBarItem(
              icon: Icon(Icons.home_rounded), label: 'home'),
          BottomNavigationBarItem(
              icon: Icon(CustomIcons.pulse), label: 'pulse'),
          BottomNavigationBarItem(icon: Icon(CustomIcons.logo), label: 'cup'),
          BottomNavigationBarItem(
              icon: Icon(CustomIcons.person), label: 'person'),
        ],
        currentIndex: _selectedIndex,
        onTap: onTapped,
      ),
    );
  }
}
