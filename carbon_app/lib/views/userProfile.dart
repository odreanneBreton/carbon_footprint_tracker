import 'package:carbon_app/constants/color.dart';
import 'package:carbon_app/constants/routes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  int _selectedIndex = 3;

  late final TextEditingController name;
  late final TextEditingController email;
  late final TextEditingController password;

  // constructor
  @override
  void initState() {
    name = TextEditingController();
    email = TextEditingController();
    password = TextEditingController();
    super.initState();
  }

// deconstructor
  @override
  void dispose() {
    name.dispose();
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          backgroundColor: headerColor,
          foregroundColor: Color.fromARGB(255, 0, 0, 0),
          title: Center(
            child: Text(
              'PROFILE',
              style: GoogleFonts.lato(
                textStyle: const TextStyle(
                  color: letterColor,
                  fontSize: 40,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ),
        ),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              opacity: 0.5,
              image: AssetImage("assets/leaf2.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Your Name',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8), // Add some spacing
                TextField(
                  controller: name,
                  decoration: InputDecoration(
                    hintText: 'Enter your name',
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(Icons.edit),
                  ),
                ),
                Text(
                  'Your Email',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8), // Add some spacing
                TextField(
                  controller: email,
                  decoration: InputDecoration(
                    hintText: 'Enter your email address',
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(Icons.edit),
                  ),
                ),
                Text(
                  'Your password',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8), // Add some spacing
                TextField(
                  controller: password,
                  obscureText: true,
                  enableSuggestions: false,
                  autocorrect: false,
                  decoration: InputDecoration(
                    hintText: 'Enter your current password first',
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(Icons.lock),
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          iconSize: 45,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.grass_outlined),
              label: 'me',
              backgroundColor: navbarColor,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.emoji_emotions),
              label: 'others',
              backgroundColor: navbarColor,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.emoji_objects),
              label: 'knowledge',
              backgroundColor: navbarColor,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: 'profile',
              backgroundColor: navbarColor,
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: iconColor,
          onTap: (int index) {
            switch (index) {
              case 0:
                Navigator.of(context)
                    .pushNamedAndRemoveUntil(myStats, (route) => false);
              case 1:
                Navigator.of(context)
                    .pushNamedAndRemoveUntil(dashboardRoute, (route) => false);
              case 2:
                Navigator.of(context)
                    .pushNamedAndRemoveUntil(factsRoute, (route) => false);

              case 3:
                Navigator.of(context)
                    .pushNamedAndRemoveUntil(profile, (route) => false);
            }
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
      ),
    );
  }
}
