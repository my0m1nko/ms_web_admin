import 'package:flutter/material.dart';

class VendorsScreen extends StatelessWidget {
  const VendorsScreen({super.key});
  static const String routeName = '/vendors';

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
              'Manage Vendors',
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          Row(
            children: [
              _rowHeader('LOGO', 1),
              _rowHeader('BUSINESSNAME', 3),
              _rowHeader('CITY', 2),
              _rowHeader('STATE', 2),
              _rowHeader('ACTION', 1),
              _rowHeader('VIEW MORE', 1)
            ],
          )
        ],
      ),
    );
  }
}