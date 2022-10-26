import 'package:flutter/material.dart';
import 'package:mova/src/onboarding/screens/onboarding.dart';

void main() {
  runApp(const Mova());
}

class Mova extends StatelessWidget {
  const Mova({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/onboarding',
      routes: {'/onboarding': (context) => const Onboarding()},
    );
  }
}
