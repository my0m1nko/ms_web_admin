import 'package:flutter/material.dart';

class VendorsScreen extends StatelessWidget {
  // const VendorsScreen({super.key});
  static const String routeName = '/vendors';

  const VendorsScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        alignment: Alignment.topLeft,
        padding: const EdgeInsets.all(20),
        child: const Text(
          'Manage Vendors',
          style: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}