import 'dart:async';
import 'package:chat_bot/Screens/try.dart';
import 'package:flutter/material.dart';
import 'login_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LoginScreen()));
    });
    return SafeArea(
      child: Container(
        height: 1440,
        width: 350,
        color: Colors.white,
        child: const Image(
            image: NetworkImage(
                'https://img.freepik.com/premium-vector/chatbot-icon-concept-chat-bot-chatterbot-robot-virtual-assistance-website_123447-1615.jpg?w=2000')),
      ),
    );
  }
}
