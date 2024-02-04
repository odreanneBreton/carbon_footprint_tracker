import 'package:carbon_app/constants/color.dart';
import 'package:carbon_app/constants/routes.dart';
import 'package:carbon_app/get_distance.dart';
import 'package:carbon_app/utilities/dialog.dart';
import 'package:carbon_app/views/location_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:location/location.dart';

class MyStats extends StatefulWidget {
  const MyStats({super.key});

  @override
  State<MyStats> createState() => _MyStatsState();
}

class _MyStatsState extends State<MyStats> {
  int n = 0;
  String txt = "";
  String lastStation = "";
  int _selectedIndex = 0;
  double? currentlatitude = 0;
  double? currentlongitude = 0;
  double? finalLatitude = 0;
  double? finalLongitude = 0;
  List<Map> userDashboard = [
    {
      "newKey": 1,
      "text": "CO2 saved: 35k",
    },
    {
      "newKey": 2,
      "text": "Last ride: Sauve metro to University of Montreal metro",
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
                ListView.builder(
                  physics: const ScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 2,
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
                SizedBox(height: 200),
                TextButton(
                  onPressed: () async {
                    if (await LocationService().requestPermission()) {
                      LocationData locationData =
                          await LocationService().getCurrentLocation();
                      double? currentlatitude = locationData.latitude;
                      double? currentlongitude = locationData.longitude;
                      print("Location: $currentlatitude, $currentlongitude");
                      List nearestStation =
                          await getDistanceNearestMetro() ?? [];
                      if (nearestStation == []) {
                        txt = "You are not in the metro!";
                        await showNoMetroDialog(context, txt);
                      } else {
                        txt =
                            "Nearest Station : ${nearestStation[0]}, at ${nearestStation[1]} meters";

                        lastStation = nearestStation[0];

                        await showYesMetroDialog(context, txt);
                      }
                    }
                  },
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                    backgroundColor: postColor,

                    minimumSize:
                        const Size(70, 100), // Adjust the size as needed
                  ),
                  child: Text(
                    'NEW ITINERARY',
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 40, // Adjust the font size
                    )),
                  ),
                ),
                SizedBox(height: 50),
                TextButton(
                    onPressed: () async {
                      if (await LocationService().requestPermission()) {
                        LocationData locationData =
                            await LocationService().getCurrentLocation();
                        double? finalLatitude = locationData.latitude;
                        double? finalLongitude = locationData.longitude;
                        print("Location: $finalLatitude, $finalLongitude");
                        List nearestStation =
                            await getDistanceNearestMetro() ?? [];
                        if (nearestStation == []) {
                          txt = "You are not in the metro!";
                          await showNoMetroDialog(context, txt);
                        } else {
                          txt =
                              "Nearest Station : ${nearestStation[0]}, at ${nearestStation[1]} meters";
                          if (nearestStation[0] != lastStation) {
                            int price = (1.401 *
                                    7.5 /
                                    100000000 *
                                    (getRouteDistance(
                                        currentlatitude!,
                                        currentlongitude!,
                                        finalLatitude!,
                                        finalLongitude!)))
                                .round(); // 1.401 * 7.5 ) / 100000
                            int carbon = (0.00000018 *
                                    getRouteDistance(
                                        currentlatitude!,
                                        currentlongitude!,
                                        finalLatitude,
                                        finalLongitude))
                                .round(); // 1800 kg / 10000000 m
                            await showWinMetroDialog(
                                context, txt, lastStation, price, carbon);
                          } else {
                            lastStation = nearestStation[0];
                            await showYesMetroDialog(context, txt);
                          }
                        }
                      }
                    },
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                        side: BorderSide(
                          color: Colors.transparent,
                        ),
                      ),
                      backgroundColor: postColor,

                      minimumSize:
                          const Size(70, 100), // Adjust the size as needed
                    ),
                    child: Text(
                      'END ITINERARY',
                      style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 40, // Adjust the font size
                      )),
                    )),
                SizedBox(height: 50),
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
                      .pushNamedAndRemoveUntil(factsRoute, (route) => false);

                case 3:
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil(profile, (route) => false);
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

Text getText(int selector) {
  if (selector == 0) {
    return Text(
      'New Itinerary',
      style: GoogleFonts.poppins(
          textStyle: const TextStyle(
        color: Color.fromARGB(255, 0, 0, 0),
        fontSize: 40, // Adjust the font size
      )),
    );
  } else {
    return Text(
      'Finish Itinerary',
      style: GoogleFonts.poppins(
          textStyle: const TextStyle(
        color: Color.fromARGB(255, 0, 0, 0),
        fontSize: 40, // Adjust the font size
      )),
    );
  }
}
