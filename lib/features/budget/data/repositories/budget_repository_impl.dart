import '../models/budget_model.dart';
import '../../domain/repositories/budget_repository.dart';
import '../sources/remote_budget_data_source.dart';

class BudgetRepositoryImpl implements BudgetRepository {
  final RemoteBudgetDataSource remoteDataSource;

  BudgetRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<BudgetModel>> getBudgets() async {
    return await remoteDataSource.fetchBudgets();
  }

  @override
  Future<BudgetModel> getBudgetById(int id) async {
    return await remoteDataSource.fetchBudgetById(id);
  }

  @override
  Future<void> addBudget(BudgetModel budget) async {
    await remoteDataSource.createBudget(budget);
  }

  @override
  Future<void> deleteBudget(int id) async {
    await remoteDataSource.deleteBudget(id);
  }
}