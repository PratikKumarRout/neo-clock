import 'package:flutter/material.dart';
import 'package:math_time/components/clock_logic.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ClockLogic(),
    );
  }
}
