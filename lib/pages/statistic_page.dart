import "package:flutter/material.dart";

class Statistic extends StatelessWidget {
  const Statistic({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Statistic page",
          textAlign: TextAlign.center, // выравнивание по центру
          style: Theme.of(context).textTheme.bodyMedium),
    );
  }
}
