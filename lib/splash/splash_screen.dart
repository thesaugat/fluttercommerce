import 'package:ecom/home/home_page.dart';
import 'package:ecom/utils/constants.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 500), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (__) {
        return const HomePage();
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        backgroundColor: Colors.white,
      ),
      body: Container(
        height: double.infinity,
        color: Colors.white,
        child: const Center(
            child: Icon(
          Icons.shop,
          color: kPrimaryColor,
          size: 80,
        )),
      ),
    );
  }
}
