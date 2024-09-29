import '../../data/models/budget_model.dart';

abstract class BudgetRepository {
  Future<List<BudgetModel>> getBudgets();
  Future<BudgetModel> getBudgetById(int id); 
  Future<void> addBudget(BudgetModel budget);
  Future<void> deleteBudget(int id);
}