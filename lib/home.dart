import 'package:flutter/material.dart';
import 'package:example/custom_icons.dart';

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
    pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        children: [
          Container(
              padding: const EdgeInsets.only(top: 225),
              color: const Color.fromRGBO(4, 4, 4, 1),
              child: Text("It works!",
                  textAlign: TextAlign.center, // выравнивание по центру
                  style: Theme.of(context).textTheme.bodyMedium)),
          Container(color: Colors.white),
          Container(color: Colors.red),
          Container(color: Colors.brown),
          Container(color: Colors.pink),
        ],
      ),
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
