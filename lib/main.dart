import 'package:flutter/material.dart';
import 'package:group_chat_app/screens/screens.dart';

void main() => runApp(FlashChat());

class FlashChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        textTheme: Typography.blackMountainView,
      ),
      routes: {
        '/': (_) => WelcomeScreen(),
        '/login': (_) => LoginScreen(),
        '/registration': (_) => RegistrationScreen(),
        '/chat': (_) => ChatScreen(),
      },
      initialRoute: '/',
    );
  }
}
