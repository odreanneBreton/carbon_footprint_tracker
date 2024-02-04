import 'package:carbon_app/services/auth_service.dart';
import 'package:carbon_app/views/welcome_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carbon_app/services/firestore_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Image.asset(
              'assets/logo.png',
              height: 150,
              width: 150,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 1.5,
              child: TextField(
                controller: _emailController,
                decoration: const InputDecoration(hintText: 'Email'),
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 1.5,
              child: TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: 'Password',
                ),
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            OutlinedButton(
              onPressed: () async {
                final message = await AuthService().registration(
                  email: _emailController.text,
                  password: _passwordController.text,
                );
                if (message!.contains('Success')) {
                  FirestoreService firestoreService = FirestoreService();
                  User? user = FirebaseAuth.instance.currentUser;
                  if (user != null) {
                    // Access the UID
                    firestoreService.addNewUser(user.uid);
                  } else {
                    print("User not logged in");
                  }
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const WelcomeView()));
                }
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(message),
                  ),
                );
              },
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Color.fromARGB(255, 65, 154, 40)),
                minimumSize: const Size(125, 50), // Adjust the size as needed
              ),
              child: Text(
                'Register',
                style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                  color: Color.fromARGB(255, 37, 129, 37),
                  fontSize: 25, // Adjust the font size
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
