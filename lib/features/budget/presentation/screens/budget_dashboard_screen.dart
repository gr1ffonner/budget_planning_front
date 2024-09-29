import 'package:flutter/material.dart';
import '../../data/repositories/budget_repository_impl.dart';
import '../../data/sources/remote_budget_data_source.dart';
import '../../domain/repositories/budget_repository.dart';
import '../../domain/usecases/get_budgets.dart'; 
import '../../data/models/budget_model.dart';

class BudgetDashboardScreen extends StatefulWidget {
  const BudgetDashboardScreen({super.key}); // Use super.key directly

  @override
  _BudgetDashboardScreenState createState() => _BudgetDashboardScreenState();
}

class _BudgetDashboardScreenState extends State<BudgetDashboardScreen> {
  late Future<List<BudgetModel>> _budgets;

  @override
  void initState() {
    super.initState();
    final RemoteBudgetDataSource remoteDataSource = RemoteBudgetDataSource('http://localhost:8080'); 
    final BudgetRepository budgetRepository = BudgetRepositoryImpl(remoteDataSource);
    final getBudgets = GetBudgets(budgetRepository); // Pass the repository instance
    _budgets = getBudgets.execute();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Budgets'),
      ),
      body: FutureBuilder<List<BudgetModel>>(
        future: _budgets,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No budgets found.'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final budget = snapshot.data![index];
                return ListTile(
                  title: Text(budget.title),
                  subtitle: Text('Total: ${budget.totalAmount}'),
                  // Add any other information you want to display
                );
              },
            );
          }
        },
      ),
    );
  }
}