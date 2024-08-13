import 'package:flutter/material.dart';
import 'package:personal_finances_manager/viewmodels/expense_or_income_viewmodel.dart';
import 'package:provider/provider.dart';

class ExpensesOrIncomeScreen extends StatefulWidget {
  const ExpensesOrIncomeScreen({super.key});

  @override
  State<ExpensesOrIncomeScreen> createState() => _ExpensesOrIncomeScreenState();
}

class _ExpensesOrIncomeScreenState extends State<ExpensesOrIncomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Expenses or Income")),
      body: Consumer<ExpenseOrIncomeViewModel>(
        builder: (context, viewModel, _) {
          return const Center(child: Text("Expenses or Income"));
        }
      )
    );
  }
}