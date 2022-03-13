import 'package:flutter/material.dart';

class ProfileMenuItem extends StatelessWidget {
  final String text;
  final IconData icon;
  final Function onTap;
  const ProfileMenuItem(
      {Key? key, required this.text, required this.icon, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
          color: Colors.grey.withOpacity(.2),
          borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        title: Text(text),
        leading: Icon(icon),
        onTap: () {
          onTap();
        },
      ),
    );
  }
}
