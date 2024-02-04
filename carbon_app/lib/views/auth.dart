import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:carbon_app/constants/color.dart';

class AuthPage extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Authentication'),
        backgroundColor: background_color,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () async {
                  await _signInWithGoogle();
                },
                child: Text('Sign In with Google'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  await _signInWithEmailAndPassword();
                },
                child: Text('Sign In with Email and Password'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  await _signUp();
                },
                child: Text('Sign Up'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _signInWithGoogle() async {
    try {
      // Implement Google Sign-In logic using Firebase
    } catch (e) {
      print('Error signing in with Google: $e');
    }
  }

  Future<void> _signInWithEmailAndPassword() async {
    try {
      // Implement Email and Password Sign-In logic using Firebase
    } catch (e) {
      print('Error signing in with Email and Password: $e');
    }
  }

  Future<void> _signUp() async {
    try {
      // Implement Email and Password Sign-In logic using Firebase
    } catch (e) {
      print('Error signing in with Email and Password: $e');
    }
  }
}
