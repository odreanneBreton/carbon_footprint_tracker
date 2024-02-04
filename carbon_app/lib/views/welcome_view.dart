import 'package:carbon_app/constants/color.dart';
import 'package:carbon_app/constants/routes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeView extends StatefulWidget {
  const WelcomeView({super.key});

  @override
  State<WelcomeView> createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView> {
  int _selectedIndex = 1;
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
    return Scaffold(
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ListView.builder(
              shrinkWrap: true,
              itemCount: 3,
              itemBuilder: (BuildContext context, int index) {
                return Column(children: [
                  const SizedBox(height: 10),
                  Container(
                    height: 50,
                    color: postColor,
                    child: Row(children: [
                      const SizedBox(width: 20),
                      Text(userDashboard[index]["user"],
                          textAlign: TextAlign.left,
                          style: GoogleFonts.roboto(
                            textStyle: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.normal,
                            ),
                          )),
                      const Spacer(),
                      Text(userDashboard[index]["Carbon"],
                          textAlign: TextAlign.right,
                          style: GoogleFonts.roboto(
                            textStyle: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.normal,
                            ),
                          )),
                      const SizedBox(width: 20),
                    ]),
                  ),
                  Container(
                    color: postColor,
                    child: Row(
                      children: [
                        const SizedBox(width: 20),
                        Expanded(
                            child: Center(
                          child: Text(userDashboard[index]["text"],
                              textAlign: TextAlign.center,
                              style: GoogleFonts.roboto(
                                textStyle: const TextStyle(
                                  fontSize: 23,
                                  fontWeight: FontWeight.normal,
                                ),
                              )),
                        )),
                        const SizedBox(width: 20),
                      ],
                    ),
                  ),
                  Container(
                    color: postColor,
                    child: const Row(
                      children: [
                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                ]);
                // FeedPost(
                //               newKey: userDashboard[index]["newKey"],
                //               name: userDashboard[index]["name"],
                //               carbon: userDashboard[index]["carbon"],
                //               text: userDashboard[index]["text"],
                //               time: userDashboard[index]["time"]);
              },
            ),
          ],
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
                    .pushNamedAndRemoveUntil(myStats, (route) => false);
              case 1:
                Navigator.of(context)
                    .pushNamedAndRemoveUntil(welcomeRoute, (route) => false);
              case 2:
                Navigator.of(context)
                    .pushNamedAndRemoveUntil(welcomeRoute, (route) => false);

              case 3:
                Navigator.of(context)
                    .pushNamedAndRemoveUntil(welcomeRoute, (route) => false);
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
