import 'package:personal_finances_manager/models/turn_data.dart';
import 'package:personal_finances_manager/services/user_service.dart';
import 'package:personal_finances_manager/viewmodels/viewmodel.dart';

class TurnsViewModel extends ViewModel {
  List<TurnData> _turns = [];
  List<TurnData> get turns => _turns;

  Future<void> loadTurns() async {
    loading = true;

    try {
      _turns = await userService.getTurns();
    } catch (e, stackTrace) {
      setError(error, stackTrace);
    } finally {
      loading = false;
    }
  }
}