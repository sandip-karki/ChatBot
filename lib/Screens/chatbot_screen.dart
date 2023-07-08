import 'package:chat_bot/Chatbot/Chatbot_Repo.dart';
import 'package:chat_bot/materials/drawer.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<String> response = [];
  final chats = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavBar(),
      appBar: AppBar(
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 80),
            child: Title(
                color: Colors.white,
                child: Center(
                  child: Text(
                    'Welcome to ChatBot',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.center,
                  ),
                )),
          ),
        ],
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ...List.generate(
                    response.length, (index) => Text(response[index])),
                // TextFormField(controller: chats),
              ],
            ),
            SizedBox(
              height: 350,
            ),
            Row(
              children: [
                Container(
                  child: Expanded(
                    child: TextField(
                      controller: chats,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          hintText: 'Type here',
                          hintStyle: TextStyle(fontSize: 20),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          suffixIcon: IconButton(
                            onPressed: () async {
                              final res = await ChatBotRepo.generateChats(
                                  chats.text.trim());

                              setState(() {
                                response.add(res);
                                print(res);
                              });
                            },
                            tooltip: 'Increment',
                            icon: Icon(Icons.send),
                            color: Colors.black,
                            iconSize: 35,
                          )),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      )),
    );
  }
}
