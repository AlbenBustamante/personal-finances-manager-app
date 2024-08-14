import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:personal_finances_manager/models/turn_data.dart';
import 'package:personal_finances_manager/services/auth_service.dart';
import 'package:personal_finances_manager/util/api_constants.dart';

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

    final List<dynamic> data = json.decode(response.body);

    return data.map((turn) => TurnData.fromJson(turn)).toList();
  }
}

final userService = _UserService();
