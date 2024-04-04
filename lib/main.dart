import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:ms_multi_web_admin/firebase_options.dart';
import 'package:ms_multi_web_admin/views/screens/main_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  // options: DefaultFirebaseOptions.currentPlatform,
  options: kIsWeb || Platform.isAndroid ? const FirebaseOptions(
    apiKey: "AIzaSyDKoiYuBhHTGuaD-c3pNDEOrO7nWjJlsJM", 
    appId: "1:912069233376:web:4ad634228095da55ec9e85", 
    messagingSenderId: "912069233376", 
    storageBucket:  "ms-multi-store.appspot.com",
    projectId: "ms-multi-store") : DefaultFirebaseOptions.currentPlatform
);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MS Online Shop App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  const MainScreen(),
      builder: EasyLoading.init(),
    );
  }
}