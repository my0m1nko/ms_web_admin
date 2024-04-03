import 'package:flutter/material.dart';

class OrderScreen extends StatelessWidget {
  // const OrderScreen({super.key});
  static const String routeName = '/order';

  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        alignment: Alignment.topLeft,
        padding: const EdgeInsets.all(20),
        child: const Text(
          'Order Management',
          style: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}