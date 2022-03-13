import 'package:ecom/splash/splash_screen.dart';
import 'package:ecom/user_account/login.dart';
import 'package:ecom/user_account/sign_up.dart';
import 'package:ecom/utils/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ecommerce',
      darkTheme: ThemeUtils.getDarkTheme(),
      theme: ThemeUtils.getLightTheme(),
      home: const SplashScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final title;
  const MyHomePage({Key? key, this.title = 'Flutter Shop'}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String editTextString = '';
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (() {
          setState(() {
            counter++;
          });
        }),
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Text("Button Clicked $counter times"),
        ),
      ),
    );
  }
}
