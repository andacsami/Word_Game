import 'package:flutter/material.dart';
import 'package:kelime_oyunu/screens/home_page.dart';

void main() {
  runApp(
    const MaterialApp(home: MyApp(), debugShowCheckedModeBanner: false),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const HomePage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          "images/SWORD.png",
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
