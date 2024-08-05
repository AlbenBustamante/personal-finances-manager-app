import 'package:flutter/material.dart';
import 'package:personal_finances_manager/screens/new_expense_or_income_screen.dart';
import 'package:personal_finances_manager/screens/new_turn_screen.dart';

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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FilledButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const NewTurnScreen())
                  );
                }, 
                child: const Text("Turn")
              ),
              FilledButton(
                onPressed: () {
                  Navigator.push(
                    context, 
                    MaterialPageRoute(builder: (context) => const NewExpenseOrIncomeScreen())
                  );
                },
                child: const Text("Expense / Income"))
            ],
          )
        )
      )
    );
  }
}
