import '../../data/models/budget_model.dart';
import '../repositories/budget_repository.dart';

class GetBudgets {
  final BudgetRepository repository;

  GetBudgets(this.repository);

  Future<List<BudgetModel>> execute() async {
    return await repository.getBudgets();
  }
}