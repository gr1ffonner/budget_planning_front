import 'package:budget_planning/core/utils/design/colors.dart';
import 'package:budget_planning/core/utils/design/dimensions.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
          appBar: AppBar(
          backgroundColor: backgroundColor,
          title: const Text('Отпуск',
              style: TextStyle(
                color: whiteColor,
                fontSize: fontSize32,
                fontWeight: FontWeight.w600,
                fontFamily: "Inter",
              )),
        ),
        body: Container(
          color: backgroundColor,
          child: const Text("body"),
        ));
  }
}
