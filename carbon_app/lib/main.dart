//routes
import 'package:carbon_app/constants/routes.dart';
import 'package:carbon_app/views/my_stats.dart';
import 'package:carbon_app/views/welcome_view.dart';
import 'package:carbon_app/views/location_view.dart';
import 'package:carbon_app/views/auth.dart';
import 'package:flutter/material.dart';

//firebase
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);

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
        locationRoute: (context) => const LocationView(),
        authRoute: (context) => AuthPage(),
        myStats: (context) => const MyStats(),
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
