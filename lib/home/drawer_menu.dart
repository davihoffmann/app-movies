import 'package:flutter/material.dart';
import 'package:movies_flutter/login/login_page.dart';
import 'package:movies_flutter/utils/nav.dart';

class DrawerMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Davi Hoffmann"),
              accountEmail: Text("davi.phoffmann@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://avatars0.githubusercontent.com/u/5316112?s=400&u=99fadd40fba9d24786f9fc5682eeb267e3827350&v=4"),
              ),
            ),
            ListTile(
              leading: Icon(Icons.arrow_right),
              title: Text("Item 1"),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.arrow_right),
              title: Text("Item 2"),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.arrow_right),
              title: Text("Item 3"),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.arrow_right),
              title: Text("Item 4"),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.close),
              title: Text("Logout"),
              onTap: () => _logout(context),
            )
          ],
        ),
      ),
    );
  }

  _logout(BuildContext context) {
    pushReplacement(context, LoginPage());
  }
  
}
