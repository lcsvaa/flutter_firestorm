import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart' show kIsWeb, defaultTargetPlatform, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }

    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      default:
        throw UnsupportedError(
          'Firebase não configurado para esta plataforma: $defaultTargetPlatform',
        );
    }
  }

  // Configuração Android
  static const FirebaseOptions android = FirebaseOptions(
    apiKey: "AIzaSyCUlz8o8sXAjJCQ74U6rhkbUH1Gm0sFvWY",
    appId: "1:849347556050:android:28b0a0e7ffbeea3adcb30b",
    messagingSenderId: "849347556050",
    projectId: "flutterfirebase-7c58f",
    storageBucket: "flutterfirebase-7c58f.appspot.com",
  );

  // Configuração Web
  static const FirebaseOptions web = FirebaseOptions(
    apiKey: "AIzaSyA5oe6TXivcIfXA6EeeImlQiiNTGYRcEf0",
    appId: "1:849347556050:web:1eecfae2b51cfe28dcb30b",
    messagingSenderId: "849347556050",
    projectId: "flutterfirebase-7c58f",
    storageBucket: "flutterfirebase-7c58f.firebasestorage.app",
    authDomain: "flutterfirebase-7c58f.firebaseapp.com",
    measurementId: "G-G7LL27SJZL",
  );
}
