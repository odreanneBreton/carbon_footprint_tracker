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
          child: Column(children: [
            Center(
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
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(
                          color: Color.fromARGB(255, 65, 154, 40)),
                      minimumSize:
                          const Size(125, 50), // Adjust the size as needed
                    ),
                    child: Text(
                      'Login',
                      style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                        color: Color.fromARGB(255, 37, 129, 37),
                        fontSize: 25, // Adjust the font size
                      )),
                    ),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  OutlinedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const CreateAccount(),
                        ),
                      );
                    },
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(
                          color: Color.fromARGB(255, 65, 154, 40)),
                      minimumSize:
                          const Size(170, 50), // Adjust the size as needed
                    ),
                    child: Text(
                      'Create a new account',
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
          ]),
        ));
  }
}
