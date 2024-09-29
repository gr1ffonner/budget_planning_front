import 'package:flutter/material.dart';
import '../screens/budget_dashboard_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Budget Planning',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: BudgetDashboardScreen(), 
    );
  }
}