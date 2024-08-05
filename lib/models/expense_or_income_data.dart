class ExpenseOrIncomeData {
  String id;
  String description;
  int value;
  String category;
  DateTime date;
  String userId;
  DateTime createdAt;
  DateTime updatedAt;

  ExpenseOrIncomeData({
    required this.id,
    required this.description,
    required this.value,
    required this.category,
    required this.date,
    required this.userId,
    required this.createdAt,
    required this.updatedAt
  });

  factory ExpenseOrIncomeData.fromJson(Map<String, dynamic> json) => ExpenseOrIncomeData(
    id: json['_id'],
    description: json['description'],
    value: json['value'],
    category: json['category'],
    date: DateTime.parse(json['date']),
    userId: json['userId'],
    createdAt: DateTime.parse(json['createdAt']),
    updatedAt: DateTime.parse(json['updatedAt'])
  );
}