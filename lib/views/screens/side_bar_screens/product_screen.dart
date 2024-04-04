import 'package:flutter/material.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});
  static const String routeName = '/product';

   Widget _rowHeader(String title, int flex) {
    return Expanded(
      flex: flex,
      child: Container(
        decoration: const BoxDecoration( 
          border: Border.symmetric(
            vertical: BorderSide(
              color: Colors.white,
              width: 1,
            ),
          ),
          color:  Color.fromARGB(148, 230, 103, 18)
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
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
          Row(
            children: [
              _rowHeader('IMAGE', 1),
              _rowHeader('PRODUCT NAME', 3),
              _rowHeader('PRICE', 2),
              _rowHeader('QUANTITY', 2),
              _rowHeader('ACTION', 1),
              _rowHeader('VIEW MORE', 1)
        ],
      ),  
    ],

    )
    );
  }
}