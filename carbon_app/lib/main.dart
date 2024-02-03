import 'package:carbon_app/constants/routes.dart';
import 'package:carbon_app/views/welcome_view.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Carbon Footprint app',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const HomePage(),
      routes: {
        // Pour se promener de pages en pages
        welcomeRoute: (context) => const WelcomeView(),
      },
    ),
  );
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const WelcomeView();
  }
}
