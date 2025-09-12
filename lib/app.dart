import 'package:flutter/material.dart';
import 'package:flutterfirestorm/home_page.dart';

class FlutterFirestoreApp extends StatelessWidget {
  const FlutterFirestoreApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const HomePage(title: 'Cadastro'),
    );
  }
}