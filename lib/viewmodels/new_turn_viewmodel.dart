import 'package:flutter/cupertino.dart';
import 'package:personal_finances_manager/viewmodels/viewmodel.dart';

class NewTurnViewModel extends ViewModel {
  final _dateController = TextEditingController();
  final _initialHourController = TextEditingController();
  final _finalHourController = TextEditingController();
  final _initialBreakHourController = TextEditingController();
  final _finalBreakHourController = TextEditingController();
  final _today = DateTime.now();

  Future<void> create() async {
    loading = true;

    try {

    } catch (e, stackTrace) {
      setError(error, stackTrace);
    } finally {
      loading = false;
    }
  }

  TextEditingController get dateController => _dateController;
  TextEditingController get initialHourController => _initialHourController;
  TextEditingController get finalHourController => _finalHourController;
  TextEditingController get initialBreakHourController => _initialBreakHourController;
  TextEditingController get finalBreakHourController => _finalBreakHourController;
}