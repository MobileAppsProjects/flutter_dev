import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dev/src/features/register/screens/register_screen.dart';
import 'package:flutter_dev/src/features/home/screens/home_screen.dart';


class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isObscure = true;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? _user;

void _handleGoogleSignIn(){
  try{
    GoogleAuthProvider _googleAuthProvider = GoogleAuthProvider();
    _auth.signInWithProvider(_googleAuthProvider);
  } catch (error){

    print(error);
  }
}


void initState(){
  super.initState();
  _auth.authStateChanges().listen((event) {
    setState(() {
      _user = event;
    });
  });
}

void signUserIn() async {

  // Loading Circle
  
  showDialog(
    context: context, 
    builder: (context){
      return Center(
        child: CircularProgressIndicator(),
      );
    },
  );

  // Try sign in
  try {
  await FirebaseAuth.instance.signInWithEmailAndPassword(

    email: _emailController.text,
     password: _passwordController.text,
     );
     
     // pop the loading circle
     Navigator.pop(context);
     


  } on FirebaseAuthException catch (e){

    // pop the loading circle
    Navigator.pop(context);
  

// WRONG EMAIL
    if (e.code == 'user-not-found'){
      wrongEmailMessage();

    }
 // WRONG PASSWORD  
  
     else if (e.code == 'wrong-password'){
        wrongEmailPassword();
    }

  }
  
}

 void wrongEmailMessage(){

  showDialog(
    context: context,
    builder: (context) {
      return const AlertDialog(
        title: Text('Incorrect Email'),

      );
    },
  );
 }
 void wrongEmailPassword(){

  showDialog(
    context: context,
    builder: (context) {
      return const AlertDialog(
        title: Text('Incorrect Password'),

      );
    },
  );
  
 }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SingleChildScrollView( // Agrega esto
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
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Correo electrónico',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),


            TextField(
              controller: _passwordController,
              obscureText: _isObscure,
              decoration: InputDecoration(
                labelText: 'Contraseña',
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(
                    // Cambia el ícono visualmente cuando se presiona
                    _isObscure ? Icons.visibility : Icons.visibility_off,
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

            SizedBox(height: 50),
            ElevatedButton(
              onPressed: signUserIn,
              child: const Text('Ingresar',
                                style: TextStyle(color: Colors.white)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromRGBO(255, 87, 32, 1),
                minimumSize: Size(double.infinity, 50),
              ),
            ),
            SizedBox(height: 20),
            const Text('Ingresa con',
                        style: TextStyle(color: Colors.black)),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: _handleGoogleSignIn,
                  icon: Image.asset(
                    'assets/images/google_logo.png',
                    height: 32,
                  ),
                ),
                SizedBox(width: 16),
                IconButton(
                  onPressed: signUserIn,
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
                      style: TextStyle(color: Colors.black), // Color del texto "¿No tienes cuenta?"
                    ),
                    TextSpan(
                      text: 'Regístrate',
                      style: TextStyle(color: Color.fromRGBO(255, 87, 32, 1)), // Color del texto "Regístrate"
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