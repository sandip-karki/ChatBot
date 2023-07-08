import 'package:chat_bot/provider/auth_provider.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({super.key});
  final emailCtrl = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Center(
            child: Form(
              key: _formkey,
              child: Column(
                children: [
                  Image(
                    height: 157,
                    width: 224,
                    image: NetworkImage(
                        'https://img.freepik.com/premium-vector/chatbot-icon-concept-chat-bot-chatterbot-robot-virtual-assistance-website_123447-1615.jpg?w=2000'),
                  ),
                  Text(
                    'Enter your email',
                    style: TextStyle(fontSize: 28),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                        alignment: Alignment.center,
                        height: 60.93,
                        width: 348,
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
                                return "enter a valid email";
                              }

                              return null;
                            },
                            controller: emailCtrl,
                            textAlign: TextAlign.center,
                            decoration: const InputDecoration(
                              errorStyle: TextStyle(
                                color: Color.fromARGB(255, 255, 0, 0),
                                fontSize: 14,
                              ),
                              border: InputBorder.none,
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
                      child: InkWell(
                          child: Container(
                            alignment: Alignment.center,
                            height: 60.11,
                            width: 252,
                            decoration: BoxDecoration(
                                color: const Color.fromRGBO(107, 195, 105, 1),
                                borderRadius: BorderRadius.circular(16)),
                            child: const Text(
                              'Send code',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 21,
                              ),
                            ),
                          ),
                          onTap: () async {
                            String email = emailCtrl.text.trim();

                            if (_formkey.currentState!.validate()) {
                              final res = await context
                                  .read<Authprovider>()
                                  .forgotpassword(
                                    email: email,
                                  );

                              if (res == 'ok') {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content:
                                            Text("email has send to $email")));
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text(res.toString())));
                              }
                            }
                          }),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
