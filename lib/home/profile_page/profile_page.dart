import 'package:ecom/home/profile_page/components/profile_menu_item.dart';
import 'package:ecom/user_account/login.dart';
import 'package:ecom/utils/DataHolder.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profile")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          ProfileMenuItem(
              text: "Logout",
              icon: Icons.login,
              onTap: () {
                SharedPreferences.getInstance().then((value) {
                  value.clear();
                });
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (__) {
                  return const LoginPage();
                }));
                // Navigator.popAndPushNamed(context, LoginPage.route);
              }),
          ProfileMenuItem(
              text: "MY Profile", icon: Icons.verified_user, onTap: () {}),
        ]),
      ),
    );
  }
}
