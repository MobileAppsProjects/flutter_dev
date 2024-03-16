import 'package:flutter/material.dart';
import '../../../constants/images.dart';
import '../../../constants/colors.dart';
import '../../../constants/sizes.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(paddingApp),
        child: Column(
          //Available screen
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //Image of the welcome screen
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  decoration: InputDecoration(
                      labelText: 'Email',
                      hintText: 'Enter your email',
                      border: OutlineInputBorder()),
                ),
                TextField(
                  decoration: InputDecoration(
                      labelText: 'Password',
                      hintText: 'Enter your password',
                      border: OutlineInputBorder()),
                ),
              ],
            ),

            //
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'Login'.toUpperCase(),
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(),
                      foregroundColor: TsecondaryColor,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
