import 'package:flutter/material.dart';

class UploadBannerScreen extends StatelessWidget {
  // const UploadBannerScreen({super.key});
  static const String routeName = '/upload-banner';

  const UploadBannerScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        alignment: Alignment.topLeft,
        padding: const EdgeInsets.all(20),
        child: const Text(
          'Upload Banner',
          style: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}