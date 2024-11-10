class BudgetModel {
  final int id;
  final String title;
  final double totalAmount;
  final double spentAmount;
  final DateTime startDate;
  final DateTime endDate;

  BudgetModel({
    required this.id,
    required this.title,
    required this.totalAmount,
    required this.spentAmount,
    required this.startDate,
    required this.endDate,
  });

 factory BudgetModel.fromJson(Map<String, dynamic> json) {
  return BudgetModel(
    id: json['budget_id'],
    title: json['title'],
    totalAmount: (json['total_amount'] is int)
        ? (json['total_amount'] as int).toDouble()
        : (json['total_amount'] as double),
    spentAmount: (json['spent_amount'] is int)
        ? (json['spent_amount'] as int).toDouble()
        : (json['spent_amount'] as double) ?? 0.0,
    startDate: DateTime.parse(json['start_date']),
    endDate: DateTime.parse(json['end_date']),
  );
}
}