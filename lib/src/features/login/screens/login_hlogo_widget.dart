import 'package:flutter/material.dart';

class LoginHeaderLogo extends StatelessWidget {
  const LoginHeaderLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        Text(
          'Welcome to our app',
          style: Theme.of(context).textTheme.displayMedium,
        ),
      ],
    );
  }
}
