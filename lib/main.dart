import 'package:flutter/material.dart';
import 'package:test_pro/Pages/landing_page.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: "/",
    routes: {
      "/":(context) => const LandingPage(),
    },
  ));
}
