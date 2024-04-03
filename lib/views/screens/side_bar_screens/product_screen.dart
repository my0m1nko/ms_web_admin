import 'package:flutter/material.dart';

class ProductScreen extends StatelessWidget {
  // const ProductScreen({super.key});
  static const String routeName = '/product';

  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        alignment: Alignment.topLeft,
        padding: const EdgeInsets.all(20),
        child: const Text(
          'Product Management',
          style: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}