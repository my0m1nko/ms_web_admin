import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  // const CategoryScreen({super.key});
  static const String routeName = '/category';

  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        alignment: Alignment.topLeft,
        padding: const EdgeInsets.all(20),
        child: const Text(
          'Category Management',
          style: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}