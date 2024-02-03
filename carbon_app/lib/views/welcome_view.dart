import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeView extends StatefulWidget {
  const WelcomeView({super.key});

  @override
  State<WelcomeView> createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 242, 250, 243),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 170, 255, 34),
        foregroundColor: Color.fromARGB(255, 0, 0, 0),
        title: Center(
          child: Text(
            'welcome',
            style: GoogleFonts.montserrat(
              textStyle: const TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontSize: 40,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              width: 100,
              height: 100,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          iconSize: 45,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.checklist_rtl),
              label: 'to do',
              backgroundColor: Color.fromARGB(255, 54, 212, 244),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.access_alarm),
              label: 'shrudy',
              backgroundColor: Color.fromARGB(255, 212, 1, 212),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.textsms),
              label: 'notification',
              backgroundColor: Colors.purple,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: 'profile',
              backgroundColor: Colors.pink,
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Color.fromARGB(255, 236, 104, 37),
          onTap: (int index) {
            switch (index) {
              case 0:
                Navigator.of(context)
                    .pushNamedAndRemoveUntil(todosRoute, (route) => false);
              case 1:
                Navigator.of(context)
                    .pushNamedAndRemoveUntil(shrudyRoute, (route) => false);
              case 2:
                Navigator.of(context).pushNamedAndRemoveUntil(
                    notificationsRoute, (route) => false);

              case 3:
                Navigator.of(context)
                    .pushNamedAndRemoveUntil(profileRoute, (route) => false);
            }
            setState(
              () {
                _selectedIndex = index;
              },
            );
          }),
    );
  }
}
