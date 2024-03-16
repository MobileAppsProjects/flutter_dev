import 'package:flutter/material.dart';
import '../../../constants/images.dart';
import '../../../constants/colors.dart';
import '../../../constants/sizes.dart';
import 'login_form_widget.dart';
import 'login_hlogo_widget.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: SingleChildScrollView(
                //Available screen
                child: Container(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          //Header
                          children: [
                            LoginHeaderLogo(),
                          ],
                        ),
                        Column(
                          //Login form
                          children: [
                            LoginForm(),
                          ],
                        ),
                        Column(
                          //Other social medias
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 20),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('Or login with',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall),
                                  const SizedBox(height: 20),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      OutlinedButton(
                                        onPressed: () {},
                                        child:
                                            Image.asset(GoogleLogo, width: 30),
                                        style: OutlinedButton.styleFrom(
                                          side: const BorderSide(
                                              color: Colors
                                                  .transparent //TprimaryColor300
                                              ),
                                        ),
                                      ),
                                      OutlinedButton(
                                        onPressed: () {},
                                        child: Image.asset(MicrosoftLogo,
                                            width: 30, color: TprimaryColor300),
                                        style: OutlinedButton.styleFrom(
                                          side: const BorderSide(
                                              color: Colors
                                                  .transparent //TprimaryColor300
                                              ),
                                        ),
                                      ),
                                      OutlinedButton(
                                        onPressed: () {},
                                        child: Image.asset(FacebookLogo,
                                            width: 30, color: TprimaryColor300),
                                        style: OutlinedButton.styleFrom(
                                          side: const BorderSide(
                                              color: Colors
                                                  .transparent //TprimaryColor300
                                              ),
                                        ),
                                      ),
                                      const SizedBox(width: 20),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Column(),
                      ],
                    )))));
  }
}
