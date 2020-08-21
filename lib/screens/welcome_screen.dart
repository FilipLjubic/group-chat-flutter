import 'package:flutter/material.dart';
import 'package:group_chat_app/components/authorize_button.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation _animation;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    _animation =
        CurvedAnimation(parent: _controller, curve: Curves.easeInOutCubic);

    _controller.forward();
    _controller.addListener(() {
      setState(() {});
      print(_animation.value);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/flame-808.png'),
                    height: _animation.value * 60.0,
                  ),
                ),
                SizedBox(
                  width: 10.0,
                ),
                ColorizeAnimatedTextKit(
                  // speed: Duration(seconds: 1.0),
                  text: ['INSIDERS'],
                  textStyle: TextStyle(
                    fontSize: 45.0,
                    fontWeight: FontWeight.w900,
                    color: Colors.blue[900],
                    fontFamily: "Russo",
                    letterSpacing: 2.0,
                  ),
                  colors: [
                    Colors.blue[900],
                    Colors.lightBlue,
                    Colors.lightBlueAccent,
                    Colors.blue,
                  ],
                  isRepeatingAnimation: false,
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            AuthorizeButton(
              onPressed: () => Navigator.pushNamed(context, '/login'),
              color: Colors.lightBlueAccent,
              text: 'Log In',
            ),
            AuthorizeButton(
              onPressed: () => Navigator.pushNamed(context, '/register'),
              color: Colors.blueAccent,
              text: 'Register',
            ),
          ],
        ),
      ),
    );
  }
}
