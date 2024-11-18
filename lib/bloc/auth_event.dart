abstract class AuthEvent {
  const AuthEvent();
}

// Событие входа в аккаунт
class SingInEvent extends AuthEvent {
  final String email;
  final String password;

  const SingInEvent({required this.email, required this.password});
}

// Событие регистрации аккаунта
class SignUpEvent extends AuthEvent {
  final String email;
  final String password;

  const SignUpEvent({required this.email, required this.password});
}

// Событие выхода из аккаунта
class SingOutEvent extends AuthEvent {}
