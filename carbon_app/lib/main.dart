//routes
import 'package:carbon_app/constants/routes.dart';
import 'package:carbon_app/views/userProfile.dart';
import 'package:carbon_app/views/facts_view.dart';
import 'package:carbon_app/views/my_stats.dart';
import 'package:carbon_app/views/welcome_view.dart';
import 'package:carbon_app/views/auth.dart';
import 'package:carbon_app/views/create_account.dart';
import 'package:carbon_app/views/login.dart';

import 'package:flutter/material.dart';

//firebase
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final firebaseApp = Firebase.app();
  final rtdb = FirebaseDatabase.instanceFor(
      app: firebaseApp,
      databaseURL:
          'https://carbonfootprint-5ef42-default-rtdb.firebaseio.com/');

  runApp(
    MaterialApp(
      title: 'Carbon Footprint app',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const HomePage(),
      routes: {
        // Pour se promener de pages en pages
        dashboardRoute: (context) => const WelcomeView(),
        authRoute: (context) => AuthView(),
        loginRoute: (context) => const LoginScreen(),
        myStats: (context) => const MyStats(),
        createAccountRoute: (context) => const CreateAccount(),
        factsRoute: (context) => const FactsView(),
        profile: (context) => const UserProfile(),
      },
    ),
  );
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthView();
  }
}
