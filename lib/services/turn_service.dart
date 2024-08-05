import 'dart:convert';

import 'package:personal_finances_manager/models/create_turn_data.dart';
import 'package:http/http.dart' as http;
import 'package:personal_finances_manager/services/auth_service.dart';

import '../models/turn_data.dart';
import '../util/api_constants.dart';

class _TurnService {
  Future<TurnData> create(CreateTurnData createTurnData) async {
    createTurnData.userId = authService.getCurrentUserId();

    final uri = Uri.parse(ApiConstants.turns);
    final response = await http.post(uri,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(createTurnData.toJson())
    );

    if (response.statusCode != 201) {
      throw jsonDecode(response.body);
    }

    return TurnData.fromJson(jsonDecode(response.body));
  }
}

final turnService = _TurnService();