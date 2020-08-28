import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:group_chat_app/screens/screens.dart';

// build the app wiht flutter run --profile --cache-sksl
// play around with animations
// press M and save as flutter_01.sksl.json
// flutter build apk --bundle-sksl-path flutter_01.sksl.json

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    Insiders(),
  );
}

class Insiders extends StatelessWidget {
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
