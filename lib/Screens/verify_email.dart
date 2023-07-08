import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Email App',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: MyHomePage(title: 'Email App'),
//     );
//   }
// }

class VerifyEmail extends StatelessWidget {
  final String title;

  VerifyEmail({required this.title});

  void _launchEmailApp() async {
    final Uri params = Uri(
      scheme: 'mailto',
      path: 'sandipkrk91@gmail.com',
      query: 'subject=Hello from the Email App',
    );

    String url = params.toString();

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch email app.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Image(
              height: 157,
              width: 224,
              image: NetworkImage(
                  'https://img.freepik.com/premium-vector/chatbot-icon-concept-chat-bot-chatterbot-robot-virtual-assistance-website_123447-1615.jpg?w=2000'),
            ),
            Text(
              'Verify your email',
              style: TextStyle(fontSize: 28),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
                'Allow us to sent an email to sandipishu1@gmail.com.\n         Click the link inside to get started.'),
            SizedBox(
              height: 30,
            ),
            InkWell(
              child: Container(
                height: 60,
                width: 150,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.green),
                child: Center(
                  child: Text(
                    'Send',
                    style: TextStyle(fontSize: 21, color: Colors.black),
                  ),
                ),
              ),
              onTap: () {},
            ),
            SizedBox(
              height: 50,
            ),
            Center(
              child: InkWell(
                onTap: _launchEmailApp,
                child: Container(
                  height: 40,
                  width: 170,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color.fromARGB(255, 217, 210, 210)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Icon(Icons.email),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Open Gmail',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  alignment: Alignment.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
