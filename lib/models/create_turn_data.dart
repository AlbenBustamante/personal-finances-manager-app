class CreateTurnData {
  DateTime date;
  DateTime initialHour;
  DateTime finalHour;
  DateTime initialBreakHour;
  DateTime finalBreakHour;
  String? userId;

  CreateTurnData({
    required this.date,
    required this.initialHour,
    required this.finalHour,
    required this.initialBreakHour,
    required this.finalBreakHour,
    this.userId
  });

  Map<String, dynamic> toJson() => {
    "date": date.toIso8601String(),
    "initialHour": initialHour.toIso8601String(),
    "finalHour": finalHour.toIso8601String(),
    "initialBreakHour": initialBreakHour.toIso8601String(),
    "finalBreakHour": finalBreakHour.toIso8601String(),
    "userId": userId
  };
}