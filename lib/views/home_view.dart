import 'package:calculator_app/views/calculator_view.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color(0xFFD4E4E5),
      body: SafeArea(
          child: const CalculatorView(),
        ),
    );
  }
}