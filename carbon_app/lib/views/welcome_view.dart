import 'package:carbon_app/constants/routes.dart';
import 'package:carbon_app/utilities/post.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeView extends StatefulWidget {
  const WelcomeView({super.key});

  @override
  State<WelcomeView> createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView> {
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
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 241, 255, 242),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.0),
        child: AppBar(
          backgroundColor: Color.fromARGB(255, 170, 255, 34),
          foregroundColor: Color.fromARGB(255, 0, 0, 0),
          title: Center(
            child: Text(
              'GREENRIDE',
              style: GoogleFonts.lato(
                textStyle: const TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
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
                    color: Color.fromARGB(255, 209, 209, 209),
                    child: Row(children: [
                      const SizedBox(width: 20),
                      Text(
                        userDashboard[index]["user"],
                        textAlign: TextAlign.left,
                      ),
                      Spacer(),
                      Text(
                        userDashboard[index]["Carbon"],
                        textAlign: TextAlign.right,
                      ),
                      const SizedBox(width: 20),
                    ]),
                  ),
                  Container(
                    color: Color.fromARGB(255, 209, 209, 209),
                    child: Row(
                      children: [
                        const SizedBox(width: 20),
                        Expanded(
                          child: Text(
                            userDashboard[index]["text"],
                          ),
                        ),
                        const SizedBox(width: 20),
                      ],
                    ),
                  ),
                  Container(
                    color: Color.fromARGB(255, 209, 209, 209),
                    child: Row(children: [
                      const SizedBox(height: 20),
                    ]),
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
              icon: Icon(Icons.bar_chart),
              label: 'dashboard',
              backgroundColor: Color.fromARGB(255, 183, 255, 0),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.access_alarm),
              label: 'others',
              backgroundColor: Color.fromARGB(255, 183, 234, 245),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.textsms),
              label: 'new destination',
              backgroundColor: Color.fromARGB(255, 183, 234, 245),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: 'settings',
              backgroundColor: Color.fromARGB(255, 183, 234, 245),
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Color.fromARGB(255, 37, 236, 236),
          onTap: (int index) {
            switch (index) {
              case 0:
                Navigator.of(context)
                    .pushNamedAndRemoveUntil(welcomeRoute, (route) => false);
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
