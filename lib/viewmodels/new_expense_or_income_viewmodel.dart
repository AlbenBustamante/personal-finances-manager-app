import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_finances_manager/models/create_expense_or_income_data.dart';
import 'package:personal_finances_manager/services/expense_or_income_service.dart';
import 'package:personal_finances_manager/viewmodels/viewmodel.dart';

class NewExpenseOrIncomeViewModel extends ViewModel {
  final _dateController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _valueController = TextEditingController();
  final _categoryController = TextEditingController();
  final _today = DateTime.now();
  final List<String> _types = ["Expense", "Income"];

  String _title = "New expense";
  String _selectedType = "Expense";
  DateTime _selectedDate = DateTime.now();

  set selectedType(String selectedType) {
    _selectedType = selectedType;
    _title = selectedType == "Expense" ? "New expense" : "New income";
    notifyListeners();
  }

  Future<void> create() async {
    loading = true;

    try {
      await expenseOrIncomeService.create(
        _selectedType == "Expense",
        CreateExpenseOrIncomeData(
          description: _descriptionController.text.trim(),
          value: int.parse(_valueController.text.trim()),
          category: _categoryController.text.trim(),
          date: _selectedDate
        )
      );

      _descriptionController.clear();
      _valueController.clear();
      _categoryController.clear();
    } catch (e, stackTrace) {
      setError(error, stackTrace);
    } finally {
      loading = false;
    }
  }

  Future<void> pickDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2024),
      lastDate: _today
    );

    if (picked != null) {
      _selectedDate = picked;
      _dateController.text = DateFormat("dd-MM-yyyy").format(_selectedDate);
    }

    notifyListeners();
  }

  String get selectedType => _selectedType;
  List<String> get types => _types;
  String get title => _title;
  TextEditingController get dateController => _dateController;
  TextEditingController get descriptionController => _descriptionController;
  TextEditingController get valueController => _valueController;
  TextEditingController get categoryController => _categoryController;
}