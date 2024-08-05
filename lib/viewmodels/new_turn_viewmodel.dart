import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_finances_manager/models/create_turn_data.dart';
import 'package:personal_finances_manager/services/turn_service.dart';
import 'package:personal_finances_manager/viewmodels/viewmodel.dart';

class NewTurnViewModel extends ViewModel {
  final _dateController = TextEditingController();
  final _initialHourController = TextEditingController();
  final _finalHourController = TextEditingController();
  final _initialBreakHourController = TextEditingController();
  final _finalBreakHourController = TextEditingController();
  final _today = DateTime.now();

  DateTime _selectedDate = DateTime.now();
  TimeOfDay _initialHour = TimeOfDay.now();
  TimeOfDay _finalHour = TimeOfDay.now();
  TimeOfDay _initialBreakHour = TimeOfDay.now();
  TimeOfDay _finalBreakHour = TimeOfDay.now();

  Future<void> create() async {
    loading = true;

    try {
      final createTurnData = CreateTurnData(
        date: _selectedDate,
        initialHour: _toDateTime(_selectedDate, _initialHour),
        finalHour: _toDateTime(_selectedDate, _finalHour),
        initialBreakHour: _toDateTime(_selectedDate, _initialBreakHour),
        finalBreakHour: _toDateTime(_selectedDate, _finalBreakHour),
      );

      await turnService.create(createTurnData);

      _dateController.clear();
      _initialHourController.clear();
      _finalHourController.clear();
      _initialBreakHourController.clear();
      _finalBreakHourController.clear();
    } catch (e, stackTrace) {
      setError(error, stackTrace);
    } finally {
      loading = false;
    }
  }

  Future<void> pickDate(BuildContext context) async {
    final picked = await showDatePicker(
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

  Future<void> pickInitialHour(BuildContext context) async {
    final picked = await showTimePicker(
      context: context, 
      initialTime: _initialHour
    );

    if (picked != null) {
      _initialHour = picked;

      if (context.mounted) {
        _initialHourController.text = picked.format(context);
      }
    }

    notifyListeners();
  }

  Future<void> pickFinalHour(BuildContext context) async {
    final picked = await showTimePicker(
      context: context, 
      initialTime: _initialHour
    );

    if (picked != null) {
      _finalHour = picked;

      if (context.mounted) {
        _finalHourController.text = picked.format(context);
      }
    }

    notifyListeners();
  }

  Future<void> pickInitialBreakHour(BuildContext context) async {
    final picked = await showTimePicker(
      context: context, 
      initialTime: _initialBreakHour
    );

    if (picked != null) {
      _initialBreakHour = picked;

      if (context.mounted) {
        _initialBreakHourController.text = picked.format(context);
      }
    }

    notifyListeners();
  }

  Future<void> pickFinalBreakHour(BuildContext context) async {
    final picked = await showTimePicker(
      context: context, 
      initialTime: _finalBreakHour
    );

    if (picked != null) {
      _finalBreakHour = picked;

      if (context.mounted) {
        _finalBreakHourController.text = picked.format(context);
      }
    }

    notifyListeners();
  }

  DateTime _toDateTime(DateTime date, TimeOfDay time) {
    return DateTime(
      date.year,
      date.month,
      date.day,
      time.hour,
      time.minute
    );
  }

  TextEditingController get dateController => _dateController;
  TextEditingController get initialHourController => _initialHourController;
  TextEditingController get finalHourController => _finalHourController;
  TextEditingController get initialBreakHourController => _initialBreakHourController;
  TextEditingController get finalBreakHourController => _finalBreakHourController;
}