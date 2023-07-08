import 'package:chat_bot/Screens/login_screen.dart';
import 'package:chat_bot/Screens/try.dart';
import 'package:chat_bot/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('Sandip karki'),
            accountEmail: Text('Sandipkrk91@gmail.com'),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.network(
                  'https://e7.pngegg.com/pngimages/799/987/png-clipart-computer-icons-avatar-icon-design-avatar-heroes-computer-wallpaper-thumbnail.png',
                  width: 98,
                  height: 98,
                ),
              ),
            ),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                      'https://iso.500px.com/wp-content/uploads/2016/03/stock-photo-142984111.jpg',
                    ),
                    fit: BoxFit.fill)),
          ),
          ListTile(
            leading: Icon(Icons.group),
            title: Text('Contact us'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.text_snippet),
            title: Text('Terms & conditions'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.share),
            title: Text('Share'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Text('About'),
            onTap: () {},
          ),
          SizedBox(
            height: 200,
          ),
          Center(
            child: InkWell(
              child: Container(
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(7)),
                  height: 30,
                  width: 100,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Logout'),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(Icons.logout_outlined)
                    ],
                  )),
              onTap: () async {
                final res = context.read<Authprovider>().logout();
                if (res == 'ok') {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                } else {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text(res.toString())));
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
