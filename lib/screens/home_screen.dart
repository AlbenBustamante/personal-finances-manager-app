import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Personal Finances Manager")),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 16.0),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FilledButton(onPressed: () {}, child: const Text("Add turn")),
              FilledButton(onPressed: () {}, child: const Text("Add income")),
              FilledButton(onPressed: () {}, child: const Text("Add expense"))
            ],
          )
        )
      )
    );
  }
}
