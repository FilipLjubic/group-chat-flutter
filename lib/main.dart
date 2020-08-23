import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:group_chat_app/screens/screens.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(FlashChat());
}

class FlashChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (_) => WelcomeScreen(),
        '/login': (_) => LoginScreen(),
        '/register': (_) => RegistrationScreen(),
        '/chat': (_) => ChatScreen(),
      },
      initialRoute: '/',
    );
  }
}
