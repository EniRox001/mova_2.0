import 'package:flutter/material.dart';
import 'package:mova/utils/spacings.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: Pad.padLarge,
        child: Column(
          children: [
            Center(
              child: Image.asset(
                'assets/images/logo.png',
              ),
            ),
            const Text(
              'Create Your Account',
              style: TextStyle(
                fontSize: 32.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            TextFormField(
              decoration: const InputDecoration(),
            ),
            TextFormField(),
          ],
        ),
      ),
    );
  }
}
