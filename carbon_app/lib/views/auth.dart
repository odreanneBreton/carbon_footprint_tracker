import 'package:carbon_app/constants/routes.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthView extends StatelessWidget {
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/logo.png',
            height: 600,
            width: 600,
          ),
          SizedBox(height: 10),
          OutlinedButton(
            onPressed: () {
              // Handle register button press
              Navigator.of(context).pushNamed(loginRoute);
            },
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: Color.fromARGB(255, 65, 154, 40)),
              minimumSize: const Size(170, 60), // Adjust the size as needed
            ),
            child: Text(
              'Login',
              style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                color: Color.fromARGB(255, 37, 129, 37),
                fontSize: 28, // Adjust the font size
              )),
            ),
          ),
          SizedBox(height: 20),
          OutlinedButton(
            onPressed: () {
              // Handle register button press
              Navigator.of(context).pushNamed(createAccountRoute);
            },
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: Color.fromARGB(255, 61, 160, 33)),
              minimumSize: const Size(170, 60), // Adjust the size as needed
            ),
            child: Text(
              'Register',
              style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                color: Color.fromARGB(255, 40, 145, 40),
                fontSize: 28, // Adjust the font size
              )),
            ),
          ),
        ],
      ),
    );
  }
}
