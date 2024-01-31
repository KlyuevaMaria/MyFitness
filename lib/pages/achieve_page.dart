import "package:flutter/material.dart";

class Achieve extends StatelessWidget {
  const Achieve({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Achieve page",
          textAlign: TextAlign.center, // выравнивание по центру
          style: Theme.of(context).textTheme.bodyMedium),
    );
  }
}
