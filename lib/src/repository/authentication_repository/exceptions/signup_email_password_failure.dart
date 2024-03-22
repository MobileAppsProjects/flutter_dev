class SignUpEmailPasswordFailure {
  final String message;

  const SignUpEmailPasswordFailure(
      [this.message = 'Un error desconocido ha ocurrido']);

  factory SignUpEmailPasswordFailure.code(String code) {
    switch (code) {
      case 'email-already-in-use':
        return SignUpEmailPasswordFailure(
            'El correo electrónico ya está en uso');
      case 'invalid-email':
        return SignUpEmailPasswordFailure('El correo electrónico no es válido');
      case 'operation-not-allowed':
        return SignUpEmailPasswordFailure('Operación no permitida');
      case 'weak-password':
        return SignUpEmailPasswordFailure('La contraseña es débil');
      default:
        return SignUpEmailPasswordFailure();
    }
  }
}
