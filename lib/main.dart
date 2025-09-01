import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutterfirestorm/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); //Garante que o app estaa completamente iniciado para iniciar outros serviçosh

  await Firebase.initializeApp();
  
  runApp(const FlutterFirestoreApp());
}