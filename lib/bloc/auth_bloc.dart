import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_auth_firebase/bloc/auth_event.dart';
import 'package:flutter_auth_firebase/bloc/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  // Экземпляр класса FirebaseAuth для взаимодействия с аутентификацией
  final FirebaseAuth _auth = FirebaseAuth.instance;

  AuthBloc() : super(AuthInitialState()) {
    // Обработка события входа
    on<SingInEvent>((event, emit) async {
      emit(AuthLoadingState());
      try {
        final UserCredential userCredential =
            await _auth.signInWithEmailAndPassword(
          email: event.email,
          password: event.password,
        );
        emit(AuthSuccessState(user: userCredential.user!));
      } catch (e) {
        emit(AuthErrorState(errorMessage: e.toString()));
        emit(AuthInitialState());
      }
    });

    // Обработка события регистрации
    on<SignUpEvent>((event, emit) async {
      emit(AuthLoadingState());
      try {
        final UserCredential userCredential =
            await _auth.createUserWithEmailAndPassword(
          email: event.email,
          password: event.password,
        );
        emit(AuthSuccessState(user: userCredential.user!));
      } catch (e) {
        emit(AuthErrorState(errorMessage: e.toString()));
        emit(AuthInitialState());
      }
    });

    // Обработка события выхода
    on<SingOutEvent>((event, emit) async {
      emit(AuthLoadingState());
      try {
        await _auth.signOut();
        emit(AuthInitialState());
      } catch (e) {
        emit(AuthErrorState(errorMessage: e.toString()));
      }
    });
  }
}
