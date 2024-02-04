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
      "text": "My level: 2",
    },
    {
      "newKey": 1,
      "text": "CO2 saved: 35k",
    },
    {
      "newKey": 2,
      "text": "Last ride: sauve metro to university of montreal metro",
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
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              opacity: 0.5,
              image: AssetImage("assets/tree.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: ListView(
              children: [
                const SizedBox(height: 10),
                Container(
                  height: 65,
                  color: postColor,
                  child: Row(children: [
                    const SizedBox(width: 20),
                    Text("My Stats",
                        textAlign: TextAlign.left,
                        style: GoogleFonts.roboto(
                          textStyle: const TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.normal,
                          ),
                        )),
                  ]),
                ),
                const SizedBox(height: 10),
                ListView.builder(
                  physics: const ScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 3,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(children: [
                      Container(
                        color: postColor,
                        child: const Row(
                          children: [
                            SizedBox(height: 20),
                          ],
                        ),
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
                                      fontWeight: FontWeight.w500,
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
                  },
                ),
                SizedBox(height: 275),
                Container(
                  height: 65,
                  color: postColor,
                  child: Row(children: [
                    const SizedBox(width: 20),
                    Text("Equivalent in term of trees: 3",
                        textAlign: TextAlign.left,
                        style: GoogleFonts.roboto(
                          textStyle: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        )),
                    const SizedBox(width: 20),
                  ]),
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
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      dashboardRoute, (route) => false);
                case 2:
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil(facts, (route) => false);

                case 3:
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      dashboardRoute, (route) => false);
              }
              setState(
                () {
                  _selectedIndex = index;
                },
              );
            }),
      ),
    );
  }
}
