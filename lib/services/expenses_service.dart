import 'dart:convert';

import 'package:personal_finances_manager/models/create_expense_data.dart';
import 'package:personal_finances_manager/models/expense_data.dart';
import 'package:personal_finances_manager/util/api_constants.dart';
import "package:http/http.dart" as http;

class _ExpensesService {
  static const _url = ApiConstants.expenses;

  Future<ExpenseData> create(CreateExpenseData createExpenseData) async {
    final uri = Uri.parse(_url);
    final response = await http.post(uri,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(createExpenseData.toJson())
    );

    if (response.statusCode != 201) {
      throw jsonEncode(response.body);
    }

    return ExpenseData.fromJson(jsonDecode(response.body));
  }
}

final expensesService = _ExpensesService();