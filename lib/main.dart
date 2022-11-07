import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:mova/src/home_action_menu/screens/home_screen.dart';
import 'package:mova/src/onboarding_login_signup/screens/onboarding.dart';
import 'package:mova/utils/colors.dart';

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
      theme: ThemeData(
        scaffoldBackgroundColor: CustomColors.mainDarkColor,
        appBarTheme: const AppBarTheme(
          elevation: 0,
          backgroundColor: CustomColors.mainDarkColor,
          foregroundColor: CustomColors.mainLightColor,
          iconTheme: IconThemeData(
            color: CustomColors.mainLightColor,
          ),
        ),
        textTheme: ThemeData.dark().textTheme,
      ),
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}
