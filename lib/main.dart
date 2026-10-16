import 'package:flutter/material.dart';
import 'package:sayur_mayur/screen/home.dart';

void main() {
  runApp(const SayurMayurApp());
}

class SayurMayurApp extends StatelessWidget {
  const SayurMayurApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tegar Sayur',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFFF7532),
        ),
        useMaterial3: true,
      ),
      home: const Home(),
    );
  }
}