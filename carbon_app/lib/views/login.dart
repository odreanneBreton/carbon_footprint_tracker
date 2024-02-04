import 'package:carbon_app/constants/routes.dart';
import 'package:carbon_app/views/create_account.dart';
import 'package:carbon_app/services/auth_service.dart';
import 'package:carbon_app/views/welcome_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
              height: 300,
              width: 300,
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
            ElevatedButton(
              onPressed: () async {
                final message = await AuthService().login(
                  email: _emailController.text,
                  password: _passwordController.text,
                );
                if (message!.contains('Success')) {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const WelcomeView(),
                    ),
                  );
                }
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(message),
                  ),
                );
              },
              child: const Text('Login'),
            ),
            const SizedBox(
              height: 30.0,
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const CreateAccount(),
                  ),
                );
              },
              child: const Text('Create Account'),
            ),
          ],
        ),
      ),
    );
  }
}
