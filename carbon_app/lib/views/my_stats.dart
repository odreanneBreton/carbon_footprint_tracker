import 'package:carbon_app/constants/color.dart';
import 'package:carbon_app/constants/routes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyStats extends StatefulWidget {
  const MyStats({super.key});

  @override
  State<MyStats> createState() => _MyStatsState();
}

class _MyStatsState extends State<MyStats> {
  int _selectedIndex = 0;
  List<Map> userDashboard = [
    {
      "newKey": 0,
      "user": "Rebecca",
      "Carbon": "74874",
      "text": "Rebecca just reached Level 2: 60 Mt CO2 saved!",
      "time": "one minute ago"
    },
    {
      "newKey": 1,
      "user": "Julien",
      "Carbon": "500000000000000000",
      "text": "omg saint jerome is so far but luckily i took public transport!",
      "time": "one minute ago"
    },
    {
      "newKey": 2,
      "user": "Julien",
      "Carbon": "74874",
      "text": "just going to poly....",
      "time": "two hours ago"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: backgroundColor,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70.0),
          child: AppBar(
            backgroundColor: headerColor,
            foregroundColor: Color.fromARGB(255, 0, 0, 0),
            title: Center(
              child: Text(
                'GREENRIDE',
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
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  StatefulBuilder(
                    builder: (BuildContext context, StateSetter setState) {
                      return Center(
                        child: Column(
                          children: [
                            Text(
                              "my stats",
                              style: GoogleFonts.kanit(
                                textStyle: const TextStyle(
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Text(
                              "500 Mt CO2 saved!",
                              style: GoogleFonts.kanit(
                                textStyle: const TextStyle(
                                  fontSize: 40,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Text(
                              "last rides:",
                              style: GoogleFonts.kanit(
                                textStyle: const TextStyle(
                                  fontSize: 40,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
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
              icon: Icon(Icons.bar_chart),
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
                    .pushNamedAndRemoveUntil(welcomeRoute, (route) => false);
                break;
              case 1:
                Navigator.of(context)
                    .pushNamedAndRemoveUntil(welcomeRoute, (route) => false);
                break;
              case 2:
                Navigator.of(context)
                    .pushNamedAndRemoveUntil(welcomeRoute, (route) => false);
                break;
              case 3:
                Navigator.of(context)
                    .pushNamedAndRemoveUntil(welcomeRoute, (route) => false);
                break;
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
