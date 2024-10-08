import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
i

class LoginScreenBody extends StatelessWidget {
  const LoginScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back_ios_new),
        titleSpacing: -8,
        title: Text(
          "Login",
          style: Theme.of(context).textTheme.labelLarge,
        ),
      ),
    );
  }
}
