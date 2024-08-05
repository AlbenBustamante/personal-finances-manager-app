class TurnData {
  String id;
  DateTime date;
  DateTime initialHour;
  DateTime finalHour;
  DateTime initialBreakHour;
  DateTime finalBreakHour;
  int salary;
  String userId;
  DateTime createdAt;
  DateTime updatedAt;

  TurnData({
    required this.id,
    required this.date,
    required this.initialHour,
    required this.finalHour,
    required this.initialBreakHour,
    required this.finalBreakHour,
    required this.salary,
    required this.userId,
    required this.createdAt,
    required this.updatedAt
  });

  factory TurnData.fromJson(Map<String, dynamic> json) => TurnData(
    id: json['_id'],
    date: DateTime.parse(json['date']),
    initialHour: DateTime.parse(json['initialHour']),
    finalHour: DateTime.parse(json['finalHour']),
    initialBreakHour: DateTime.parse(json['initialBreakHour']),
    finalBreakHour: DateTime.parse(json['finalBreakHour']),
    salary: json['salary'],
    userId: json['userId'],
    createdAt: DateTime.parse(json['createdAt']),
    updatedAt: DateTime.parse(json['updatedAt'])
  );
}