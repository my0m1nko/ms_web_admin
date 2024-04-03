import 'package:flutter/material.dart';

class WithdrawalScreen extends StatelessWidget {
  // const WithdrawalScreen({super.key});
  static const String routeName = '/withdrawal';

  const WithdrawalScreen({super.key});
  

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        alignment: Alignment.topLeft,
        padding: const EdgeInsets.all(20),
        child: const Text(
          'Withdrawal Management',
          style: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}