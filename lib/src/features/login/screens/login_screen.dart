import 'package:flutter/material.dart';
import 'package:flutter_dev/src/features/login/controller/signin_controller.dart';
import 'package:flutter_dev/src/features/register/screens/register_screen.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignInController());
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      body: SingleChildScrollView(
        // Agrega esto
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 60),
              Image.asset(
                'assets/images/foodes_logo.png',
                height: 100,
              ),
              SizedBox(height: 32),
              Column(
                children: [
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: controller.emailController,
                          decoration: InputDecoration(
                            labelText: 'Correo electrónico',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(height: 16),
                        TextFormField(
                          controller: controller.passwordController,
                          obscureText: _isObscure,
                          decoration: InputDecoration(
                            labelText: 'Contraseña',
                            border: OutlineInputBorder(),
                            suffixIcon: IconButton(
                              icon: Icon(
                                // Cambia el ícono visualmente cuando se presiona
                                _isObscure
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                              onPressed: () {
                                // Invierte el valor de _isObscure cuando el botón es presionado
                                setState(() {
                                  _isObscure = !_isObscure;
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 50),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        SignInController.instance.signIn(
                          controller.emailController.text.trim(),
                          controller.passwordController.text.trim(),
                        );
                      }
                    },
                    child: const Text('Ingresar',
                        style: TextStyle(color: Colors.white)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(255, 87, 32, 1),
                      minimumSize: Size(double.infinity, 50),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              const Text('Ingresa con', style: TextStyle(color: Colors.black)),
              SizedBox(height: 14),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      // Aquí puedes agregar la lógica de inicio de sesión con Google
                      controller.signInWithGoogle();
                    },
                    icon: Image.asset(
                      'assets/images/google_logo.png',
                      height: 32,
                    ),
                  ),
                  SizedBox(width: 16),
                  IconButton(
                    onPressed: () {
                      // Aquí puedes agregar la lógica de inicio de sesión con Microsoft
                    },
                    icon: Image.asset(
                      'assets/images/Microsoft_logo.png',
                      height: 32,
                    ),
                  ),
                  SizedBox(width: 16),
                  IconButton(
                    onPressed: () {
                      // Aquí puedes agregar la lógica de inicio de sesión con Facebook
                    },
                    icon: Image.asset(
                      'assets/images/facebook_logo.png',
                      height: 32,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 60),
              TextButton(
                onPressed: () {
                  // Aquí puedes agregar la lógica para navegar a la pantalla de registro
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterScreen()),
                  );
                },
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '¿No tienes cuenta? ',
                        style: TextStyle(
                            color: Colors
                                .black), // Color del texto "¿No tienes cuenta?"
                      ),
                      TextSpan(
                        text: 'Regístrate',
                        style: TextStyle(
                            color: Color.fromRGBO(255, 87, 32,
                                1)), // Color del texto "Regístrate"
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
