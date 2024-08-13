import 'dart:convert';

import 'package:personal_finances_manager/models/turn_data.dart';
import 'package:personal_finances_manager/services/auth_service.dart';
import 'package:personal_finances_manager/util/api_constants.dart';
import 'package:http/http.dart' as http;

class _UserService {
  Future<List<TurnData>> getTurns() async {
    final userId = authService.getCurrentUserId();

    final uri = Uri.parse("${ApiConstants.users}/$userId/turns");
    final response = await http.get(uri,
      headers: {"Content-Type": "application/json"}
    );

    if (response.statusCode != 200) {
      throw jsonDecode(response.body);
    }

    final turnsMap = jsonEncode(response.body) as Map<String, Map<String, dynamic>>;
    
    return turnsMap.values.map<TurnData>((turn) => TurnData.fromJson(turn)).toList();
  }
}

final userService = _UserService();
