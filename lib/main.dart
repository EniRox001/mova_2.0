import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:mova/src/onboarding_login_signup/screens/onboarding.dart';

Future main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  initialization();
  runApp(const Mova());
}

Future initialization() async {
  //Load resources
  await Future.delayed(const Duration(seconds: 3));
  FlutterNativeSplash.remove();
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
