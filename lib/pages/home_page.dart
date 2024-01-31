import "package:flutter/material.dart";

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Home page",
          textAlign: TextAlign.center, // выравнивание по центру
          style: Theme.of(context).textTheme.bodyMedium),
    );
  }
}
