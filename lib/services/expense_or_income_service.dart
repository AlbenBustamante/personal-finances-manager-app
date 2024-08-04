import 'dart:convert';

import 'package:personal_finances_manager/models/create_expense_or_income_data.dart';
import 'package:personal_finances_manager/models/expense_or_income_data.dart';
import 'package:personal_finances_manager/util/api_constants.dart';
import "package:http/http.dart" as http;

class _ExpenseOrIncomeService {
  Future<ExpenseOrIncomeData> create(bool expense, CreateExpenseOrIncomeData createExpenseData) async {
    final uri = Uri.parse(expense ? ApiConstants.expenses : ApiConstants.income);
    final response = await http.post(uri,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(createExpenseData.toJson())
    );

    if (response.statusCode != 201) {
      throw jsonEncode(response.body);
    }

    return ExpenseOrIncomeData.fromJson(jsonDecode(response.body));
  }
}

final expenseOrIncomeService = _ExpenseOrIncomeService();