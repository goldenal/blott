import 'dart:async';

import 'package:blott_app/welcome/presentation/screens/enter_name.dart';
import 'package:flutter/material.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  void initState() {
    super.initState();

    // Timer to delay for 3 seconds before navigating to HomeScreen
    Timer(const Duration(seconds: 2), () {
      // Navigate to HomeScreen after 3 seconds
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const EnterName()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [const Row(), Image.asset("assets/images/logo.png")],
      ),
    );
  }
}
