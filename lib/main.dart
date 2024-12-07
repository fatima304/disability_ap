import 'package:app/splash.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const DisabilityApp(),
  );
}

class DisabilityApp extends StatelessWidget {
  const DisabilityApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splash(),
    );
  }
}
