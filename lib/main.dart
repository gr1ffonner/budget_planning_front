import 'package:budget_planning/features/budget/presentation/screens/homescreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Budget Planning',
      theme: ThemeData(
        primarySwatch: Colors.blue, 
      ),
      home: const HomeScreen(), // Set the initial screen
    );
  }
} 