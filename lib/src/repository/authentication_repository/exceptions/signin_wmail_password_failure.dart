class SignInEmailPasswordFailure {
  final String message;

  const SignInEmailPasswordFailure(
      [this.message = 'Un error desconocido ha ocurrido']);

  factory SignInEmailPasswordFailure.code(String code) {
    switch (code) {
      case 'invalid-email':
        return SignInEmailPasswordFailure('El correo electrónico no es válido');
      case 'user-disabled':
        return SignInEmailPasswordFailure('El usuario ha sido deshabilitado');
      case 'user-not-found':
        return SignInEmailPasswordFailure('El usuario no ha sido encontrado');
      case 'wrong-password':
        return SignInEmailPasswordFailure('La contraseña es incorrecta');
      default:
        return SignInEmailPasswordFailure();
    }
  }
}
