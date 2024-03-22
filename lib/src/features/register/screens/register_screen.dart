import 'package:flutter/material.dart';
import 'package:flutter_dev/src/features/login/screens/login_screen.dart';
import 'package:get/get.dart';
import 'package:flutter_dev/src/features/register/controller/register_controller.dart';
import 'package:flutter_dev/src/constants/images.dart';
import 'package:flutter_dev/src/constants/colors.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RegisterController());
    final _formKey = GlobalKey<FormState>(); // Creamos una clave global
    return Scaffold(
      backgroundColor: TsecondaryColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            // Agregamos el widget Form
            key: _formKey, // Asignamos la clave a nuestro formulario
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 100),
                Image.asset(
                  AppLogo,
                  height: 100,
                ),
                SizedBox(height: 32),
                TextFormField(
                  // Cambiamos TextField por TextFormField
                  controller: controller.userController,
                  decoration: InputDecoration(
                    labelText: 'Usuario',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    // Agregamos un validador
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingresa un usuario';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: controller.emailController,
                  decoration: InputDecoration(
                    labelText: 'Correo electrónico',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingresa un correo electrónico';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: controller.passwordController,
                  obscureText: _isObscure,
                  decoration: InputDecoration(
                    labelText: 'Contraseña',
                    border: OutlineInputBorder(),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isObscure ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _isObscure = !_isObscure;
                        });
                      },
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingresa una contraseña';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 60),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Validamos el formulario
                      // Si el formulario es válido, entonces hacemos algo
                      RegisterController.instance.register(
                        controller.emailController.text.trim(),
                        controller.passwordController.text.trim(),
                      );
                    }
                  },
                  child: const Text('Registrarse',
                      style: TextStyle(color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(255, 87, 32, 1),
                    minimumSize: Size(double.infinity, 50),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 1,
                      width: 100,
                      color: Colors.black,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('O'),
                    ),
                    Container(
                      height: 1,
                      width: 100,
                      color: Colors.black,
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Image.asset(
                        GoogleLogo,
                        height: 32,
                      ),
                    ),
                    SizedBox(width: 16),
                    IconButton(
                      onPressed: () {},
                      icon: Image.asset(
                        MicrosoftLogo,
                        height: 32,
                      ),
                    ),
                    SizedBox(width: 16),
                    IconButton(
                      onPressed: () {},
                      icon: Image.asset(
                        FacebookLogo,
                        height: 32,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 60),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: '¿Ya tienes cuenta? ',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        TextSpan(
                          text: 'Inicia sesión',
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: TprimaryColor,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
