import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  // const DashboardScreen({super.key});
  static const String routeName = '/dashboard';

  const DashboardScreen({super.key});
  

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        alignment: Alignment.topLeft,
        padding: const EdgeInsets.all(20),
        child: const Text(
          'Dashboard',
          style: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}