import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthState {
  const AuthState();
}

// Начальное состояние
class AuthInitialState extends AuthState {}

// Состояние загрузки
class AuthLoadingState extends AuthState {}

// Состояние успешной авторизации
class AuthSuccessState extends AuthState {
  final User user;

  const AuthSuccessState({required this.user});
}

// Состояние успешной авторизации
class AuthErrorState extends AuthState {
  final String errorMessage;

  const AuthErrorState({required this.errorMessage});
}
