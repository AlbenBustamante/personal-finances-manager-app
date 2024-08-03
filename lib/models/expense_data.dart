class ExpenseData {
  String id;
  String description;
  int value;
  String category;
  DateTime date;
  DateTime createdAt;
  DateTime updatedAt;

  ExpenseData({
    required this.id,
    required this.description,
    required this.value,
    required this.category,
    required this.date,
    required this.createdAt,
    required this.updatedAt
  });

  factory ExpenseData.fromJson(Map<String, dynamic> json) => ExpenseData(
    id: json['_id'],
    description: json['description'],
    value: json['value'],
    category: json['category'],
    date: DateTime.parse(json['date']),
    createdAt: DateTime.parse(json['createdAt']),
    updatedAt: DateTime.parse(json['updatedAt'])
  );
}