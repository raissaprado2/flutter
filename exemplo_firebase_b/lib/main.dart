import 'package:exemplo_firebase_b/fisebase_options.dart';
import 'package:exemplo_firebase_b/screens/home_screen.dart';
import 'package:exemplo_firebase_b/screens/login_screen.dart';
import 'package:exemplo_firebase_b/screens/registro_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: "Teste Firebase App",
      home: HomeScreen(),
      routes: {
        '/login':(context)=>LoginScreen(),
        '/registro':(context)=>RegistroScreen()
      },
    );
  }
}
