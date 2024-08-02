import 'package:flutter/cupertino.dart';

class NewExpenseViewModel extends ChangeNotifier {
  final _descriptionController = TextEditingController();
  final _valueController = TextEditingController();
  final _categoryController = TextEditingController();

  get descriptionController => _descriptionController;
  get valueController => _valueController;
  get categoryController => _categoryController;
}