import 'dart:async';

import 'package:flutter/material.dart';

class SplachScreen extends StatefulWidget {
  const SplachScreen({super.key});

  @override
  State<SplachScreen> createState() => _SplachScreenState();
}

class _SplachScreenState extends State<SplachScreen> {
  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 5), () {
      Navigator.of(context).pushNamedAndRemoveUntil("homePage", (route) => false);
    });
    return  Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Image.asset("assets/images/logo.png"),
      ),
    );
  }
}
