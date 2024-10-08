import 'package:flutter/material.dart';
import 'package:personal_finances_manager/screens/main_screen.dart';
import 'package:personal_finances_manager/viewmodels/expense_or_income_viewmodel.dart';
import 'package:personal_finances_manager/viewmodels/new_expense_or_income_viewmodel.dart';
import 'package:personal_finances_manager/viewmodels/new_turn_viewmodel.dart';
import 'package:personal_finances_manager/viewmodels/turns_viewmodel.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => NewExpenseOrIncomeViewModel()),
        ChangeNotifierProvider(create: (context) => NewTurnViewModel()),
        ChangeNotifierProvider(create: (context) => ExpenseOrIncomeViewModel()),
        ChangeNotifierProvider(create: (context) => TurnsViewModel())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MainScreen()
      )
    );
  }
}
