import 'package:flutter/material.dart';
import 'package:budget_planning/core/utils/design/colors.dart';
import 'package:budget_planning/core/utils/design/dimensions.dart';
import 'package:budget_planning/core/utils/design/images.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        centerTitle: true,
        title: const Text(
          'Отпуск',
          style: TextStyle(
            color: whiteColor,
            fontSize: fontSize32,
            fontWeight: FontWeight.w600,
            fontFamily: 'Inter',
          ),
        ),
      ),
      body: Container(
        color: backgroundColor,
        alignment: Alignment.center,
        child: const Text(
          "body",
          style: TextStyle(
            color: whiteColor,
            fontSize: fontSize32,
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: backgroundColor2,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween, // Spreads icons evenly
            children: <Widget>[
              IconButton(
                icon: homeIcon,
                onPressed: () {},
              ),
              IconButton(
                icon: budgetsIcon,
                onPressed: () {},
              ),
              IconButton(
                icon: categoriesIcon,
                onPressed: () {},
              ),
              IconButton(
                icon: transactionsIcon,
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}