class CreateExpenseData {
  String description;
  int value;
  String category;
  String userId;
  DateTime date;

  CreateExpenseData({
    required this.description,
    required this.value,
    required this.category,
    required this.userId,
    required this.date
  });

  Map<String, dynamic> toJson() => {
    "description": description,
    "value": value,
    "category": category,
    "userId": userId,
    "date": date.toIso8601String()
  };
}
