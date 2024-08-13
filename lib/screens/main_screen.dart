import 'package:flutter/material.dart';
import 'package:personal_finances_manager/screens/expenses_or_income_screen.dart';
import 'package:personal_finances_manager/screens/home_screen.dart';
import 'package:personal_finances_manager/screens/turns_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  static const _screens = <Widget>[
    HomeScreen(),
    ExpensesOrIncomeScreen(),
    TurnsScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (value) {
          setState(() {
            _selectedIndex = value;
          });
        },
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_outlined), selectedIcon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.attach_money_outlined), selectedIcon: Icon(Icons.attach_money), label: 'Expense or Icon'),
          NavigationDestination(icon: Icon(Icons.work_outlined), selectedIcon: Icon(Icons.work), label: 'Turns')
        ],
      ),
    );
  }
}
