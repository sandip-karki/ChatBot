// import 'package:chat_bot/Screens/verify_otp.dart';
// import 'package:flutter/material.dart';

// class VerifyNumber extends StatelessWidget {
//   VerifyNumber({super.key});
//   final nameCtrl = TextEditingController();
//   // final _formkey = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//           child: Center(
//         child: Column(
//           children: [
//             Image(
//               height: 157,
//               width: 224,
//               image: NetworkImage(
//                   'https://img.freepik.com/premium-vector/chatbot-icon-concept-chat-bot-chatterbot-robot-virtual-assistance-website_123447-1615.jpg?w=2000'),
//             ),
//             Text(
//               'Verify your number',
//               style: TextStyle(fontSize: 28),
//             ),
//             Row(
//               children: [
//                 Center(
//                   child: Padding(
//                     padding: const EdgeInsets.all(16.0),
//                     child: Container(
//                       alignment: Alignment.center,
//                       height: 60.93,
//                       width: 86,
//                       decoration: BoxDecoration(
//                           color: const Color.fromRGBO(4, 171, 255, 10),
//                           borderRadius: BorderRadius.circular(16)),
//                       child: TextFormField(
//                         textAlign: TextAlign.center,
//                         decoration: const InputDecoration(
//                           border: InputBorder.none,
//                           hintText: '+977',
//                           hintStyle: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             color: Colors.black,
//                             fontSize: 18,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 Center(
//                   child: Padding(
//                     padding: const EdgeInsets.all(16.0),
//                     child: Container(
//                       alignment: Alignment.center,
//                       height: 60.93,
//                       width: 260,
//                       decoration: BoxDecoration(
//                           color: const Color.fromRGBO(4, 171, 255, 10),
//                           borderRadius: BorderRadius.circular(16)),
//                       child: TextFormField(
//                         textAlign: TextAlign.center,
//                         decoration: const InputDecoration(
//                           border: InputBorder.none,
//                           hintText: 'Phone number',
//                           hintStyle: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             color: Colors.black,
//                             fontSize: 18,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             Center(
//               child: Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: InkWell(
//                   child: Container(
//                     alignment: Alignment.center,
//                     height: 60.11,
//                     width: 333,
//                     decoration: BoxDecoration(
//                         color: const Color.fromRGBO(107, 195, 105, 1),
//                         borderRadius: BorderRadius.circular(16)),
//                     child: const Text(
//                       'Send code',
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 21,
//                       ),
//                     ),
//                   ),
//                   onTap: () {
//                     Navigator.pushReplacement(context,
//                         MaterialPageRoute(builder: (context) => VerifyOTP()));
//                   },
//                 ),
//               ),
//             )
//           ],
//         ),
//       )),
//     );
//   }
// }
