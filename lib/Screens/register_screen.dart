import 'package:chat_bot/Screens/login_screen.dart';
import 'package:chat_bot/Screens/verify_email.dart';

import 'package:chat_bot/provider/auth_provider.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../main.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();
  final nameCtrl = TextEditingController();
  final _formkey = GlobalKey<FormState>();

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
                      'Register to continue',
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
                              validator: (String? value) {
                                if (!RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%\s-]')
                                    .hasMatch(value!)) {
                                  return "Enter a valid name";
                                }

                                return null;
                              },
                              controller: nameCtrl,
                              textAlign: TextAlign.center,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Full name',
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
                                errorStyle: TextStyle(
                                  color: Color.fromARGB(255, 255, 0, 0),
                                  fontSize: 14,
                                ),
                                hintText: 'Email',
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
                                if (!RegExp(
                                        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                                    .hasMatch(value!)) {
                                  return "Enter a valid password";
                                }

                                return null;
                              },
                              controller: passCtrl,
                              textAlign: TextAlign.center,
                              decoration: const InputDecoration(
                                errorStyle: TextStyle(
                                  color: Color.fromARGB(255, 255, 0, 0),
                                  fontSize: 14,
                                ),
                                border: InputBorder.none,
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
                              'Register',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 21,
                              ),
                            ),
                          ),
                          onTap: () async {
                            String email = emailCtrl.text.trim();
                            String pass = passCtrl.text.trim();
                            String name = nameCtrl.text.trim();
                            a = email;
                            if (_formkey.currentState!.validate()) {
                              final res = await context
                                  .read<Authprovider>()
                                  .register(
                                      email: email, password: pass, name: name);
                              print(res);
                              if (res == 'ok') {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => VerifyEmail(
                                              title: '',
                                            )));
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text(res.toString())));
                              }
                            }
                          },
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 150,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          'Already a  user?',
                          style: TextStyle(fontSize: 16),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginScreen()));
                            },
                            child: const Text(
                              'Login',
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
