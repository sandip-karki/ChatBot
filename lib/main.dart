import 'package:chat_bot/Screens/chatbot_screen.dart';
import 'package:chat_bot/Screens/splash_screen.dart';
import 'package:chat_bot/provider/auth_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

User? currentUser;
var a;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  currentUser = FirebaseAuth.instance.currentUser;
  runApp(const ChatBot());
}

class ChatBot extends StatelessWidget {
  const ChatBot({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Authprovider()),
      ],
      child: MaterialApp(
          theme:
              ThemeData(visualDensity: VisualDensity.adaptivePlatformDensity),
          debugShowCheckedModeBanner: false,
          home: currentUser == null ? const SplashScreen() : ChatScreen()),
    );
  }
}
