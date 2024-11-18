import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth_firebase/bloc/auth_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../screens/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const FlutterAuthFirebase());
}

class FlutterAuthFirebase extends StatelessWidget {
  const FlutterAuthFirebase({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => AuthBloc(),
        child: const LoginScreen(),
      ),
    );
  }
}
