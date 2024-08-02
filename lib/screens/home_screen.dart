import 'package:flutter/material.dart';
import 'package:personal_finances_manager/screens/new_expense_screen.dart';

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
              FilledButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const NewExpenseScreen()));
                },
                child: const Text("Add expense"))
            ],
          )
        )
      )
    );
  }
}
