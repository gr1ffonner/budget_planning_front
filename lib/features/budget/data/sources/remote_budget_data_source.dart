import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/budget_model.dart';

class RemoteBudgetDataSource {
  final String baseUrl;

  RemoteBudgetDataSource(this.baseUrl);

  Future<List<BudgetModel>> fetchBudgets() async {
    final response = await http.get(Uri.parse('$baseUrl/v1/budgets'));

    if (response.statusCode == 200) {
      print(response.body);
      List<dynamic> jsonList = json.decode(response.body);
      return jsonList.map((json) => BudgetModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load budgets');
    }
  }

  Future<BudgetModel> fetchBudgetById(int id) async {
    final response = await http.get(Uri.parse('$baseUrl/v1/budget/$id'));

    if (response.statusCode == 200) {
      return BudgetModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load budget');
    }
  }

  Future<void> createBudget(BudgetModel budget) async {
    final response = await http.post(
      Uri.parse('$baseUrl/v1/budget'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'title': budget.title,
        'total_amount': budget.totalAmount,
        'spent_amount': budget.spentAmount,
        'start_date': budget.startDate.toIso8601String(),
        'end_date': budget.endDate.toIso8601String(),
      }),
    );

    if (response.statusCode != 201) {
      throw Exception('Failed to create budget');
    }
  }

  Future<void> deleteBudget(int id) async {
    final response = await http.delete(Uri.parse('$baseUrl/v1/budget/$id'));

    if (response.statusCode != 204) {
      throw Exception('Failed to delete budget');
    }
  }
}