import 'package:chat_bot/Screens/chatbot_screen.dart';
import 'package:chat_bot/Screens/register_screen.dart';
import 'package:chat_bot/Screens/reset_password_screen.dart';
import 'package:chat_bot/Screens/verify_email.dart';
import 'package:chat_bot/provider/auth_provider.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  // final confPassCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => Authprovider())],
      child: Scaffold(
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Title(
                        color: Colors.blue,
                        child: const Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: 30, horizontal: 0),
                          child: Text(
                            'Welcome to ChatBot',
                            style: TextStyle(
                                fontSize: 32,
                                color: Color.fromRGBO(4, 171, 255, 10),
                                fontWeight: FontWeight.bold),
                          ),
                        )),
                    const Text(
                      'Login to continue',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Container(
                          alignment: Alignment.center,
                          height: 64.93,
                          width: 365.84,
                          decoration: BoxDecoration(
                              color: const Color.fromRGBO(4, 171, 255, 10),
                              borderRadius: BorderRadius.circular(16)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              autofillHints: [AutofillHints.email],
                              validator: (String? value) {
                                if (!RegExp(
                                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                    .hasMatch(value!)) {
                                  return "Enter a valid email";
                                }

                                return null;
                              },
                              controller: emailCtrl,
                              textAlign: TextAlign.center,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Email',
                                errorStyle: TextStyle(
                                  color: Color.fromARGB(255, 255, 0, 0),
                                  fontSize: 14,
                                ),
                                hintStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Container(
                          alignment: Alignment.center,
                          height: 64.93,
                          width: 365.84,
                          decoration: BoxDecoration(
                              color: const Color.fromRGBO(4, 171, 255, 10),
                              borderRadius: BorderRadius.circular(16)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              validator: (String? value) {
                                if (value!.isEmpty) {
                                  return 'Enter a valid password';
                                  // } else {
                                  //   if (!RegExp(
                                  //           r'^(?=.*[a-zA-Z].*)[a-zA-Z0-9]{6,}$')
                                  //       .hasMatch(value)) {
                                  //     return 'Password must contain atleast 6 letter';
                                  //   }
                                }

                                return null;
                              },
                              controller: passCtrl,
                              textAlign: TextAlign.center,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                errorStyle: TextStyle(
                                  color: Color.fromARGB(255, 255, 0, 0),
                                  fontSize: 14,
                                ),
                                hintText: 'Password',
                                hintStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: InkWell(
                          child: Container(
                            alignment: Alignment.center,
                            height: 63.11,
                            width: 165.83,
                            decoration: BoxDecoration(
                                color: const Color.fromRGBO(107, 195, 105, 1),
                                borderRadius: BorderRadius.circular(16)),
                            child: const Text(
                              'Login',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 21,
                              ),
                            ),
                          ),
                          onTap: () async {
                            String email = emailCtrl.text.trim();
                            String pass = passCtrl.text.trim();
                            if (_formkey.currentState!.validate()) {
                              final res = await context
                                  .read<Authprovider>()
                                  .login(email: email, password: pass);

                              if (res == 'ok') {
                                // ignore: use_build_context_synchronously
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ChatScreen()));
                              } else {
                                // ignore: use_build_context_synchronously
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text(res.toString())));
                              }
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content:
                                          Text('Email or Password is empty')));
                            }
                          },
                        ),
                      ),
                    ),
                    Center(
                      child: TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ForgotPasswordScreen()));
                          },
                          child: const Text(
                            'Forgot password?',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                decoration: TextDecoration.underline),
                          )),
                    ),
                    const SizedBox(
                      height: 150,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          'New user?',
                          style: TextStyle(fontSize: 16),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => RegisterScreen()));
                            },
                            child: const Text(
                              'Register',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 18,
                              ),
                            ))
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
