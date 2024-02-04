import 'package:carbon_app/constants/color.dart';
import 'package:carbon_app/constants/routes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';

class FactsView extends StatefulWidget {
  const FactsView({super.key});

  @override
  State<FactsView> createState() => _FactsViewState();
}

class _FactsViewState extends State<FactsView> {
  int _selectedIndex = 2;
  List<Map> facts = [
    {
      "newKey": 0,
      "text":
          "Pollution is one of the biggest global killers, affecting over 100 million people. That’s comparable to global diseases like malaria and HIV.",
      "source":
          "Do Something.org https://www.dosomething.org/us/facts/11-facts-about-pollution"
    },
    {
      "newKey": 1,
      "text":
          "In 1975, the National Academy of Sciences estimated that ocean-based sources, such as cargo ships and cruise liners had dumped 14 billion pounds of garbage into the ocean.",
      "source":
          "Do Something.org https://www.dosomething.org/us/facts/11-facts-about-pollution"
    },
    {
      "newKey": 2,
      "text":
          "Over 1 million seabirds and 100,000 sea mammals are killed by pollution every year.",
      "source":
          "Do Something.org https://www.dosomething.org/us/facts/11-facts-about-pollution"
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
        body: ListView(
          children: [
            CarouselSlider(
              items: [
                //1st Image of Slider
                Container(
                  margin: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      opacity: 0.7,
                      image: AssetImage("assets/grass.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 40,
                      ),
                      Text('did you know...',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.roboto(
                            textStyle: const TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                      SizedBox(
                        height: 30,
                      ),
                      Text(facts[0]["text"],
                          textAlign: TextAlign.center,
                          style: GoogleFonts.roboto(
                            textStyle: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          )),
                      SizedBox(
                        height: 200,
                      ),
                      Text(
                          "source: Do Something.org https://www.dosomething.org/us/facts/11-facts-about-pollution",
                          textAlign: TextAlign.left,
                          style: GoogleFonts.roboto(
                            textStyle: const TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.normal,
                            ),
                          )),
                    ],
                  ),
                ),

                //2nd Image of  carousel Slider flutter
                Container(
                  margin: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      opacity: 0.3,
                      image: AssetImage("assets/tree.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 40,
                      ),
                      Text('did you know...',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.roboto(
                            textStyle: const TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                      SizedBox(
                        height: 30,
                      ),
                      Text(facts[1]["text"],
                          textAlign: TextAlign.center,
                          style: GoogleFonts.roboto(
                            textStyle: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          )),
                      SizedBox(
                        height: 200,
                      ),
                      Text(
                          "source: Do Something.org https://www.dosomething.org/us/facts/11-facts-about-pollution",
                          textAlign: TextAlign.left,
                          style: GoogleFonts.roboto(
                            textStyle: const TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.normal,
                            ),
                          )),
                    ],
                  ),
                ),

                //3rd Image of Slider
                Container(
                  margin: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      opacity: 0.6,
                      image: NetworkImage(
                          "https://external-content.duckduckgo.com/iu/?u=http%3A%2F%2Fwww.hdwallpaper.nu%2Fwp-content%2Fuploads%2F2015%2F09%2Ftropical_beach_blue_summer_sea_emerald_sand_hd-wallpaper-1701606.jpg&f=1&nofb=1&ipt=6eb95fc58404f4ef582fa656596438a8313acf27a78c036f2657e601cba7be53&ipo=images"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 40,
                      ),
                      Text('did you know...',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.roboto(
                            textStyle: const TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                      SizedBox(
                        height: 60,
                      ),
                      Text(facts[2]["text"],
                          textAlign: TextAlign.center,
                          style: GoogleFonts.roboto(
                            textStyle: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          )),
                      SizedBox(
                        height: 200,
                      ),
                      Text(
                          "source: Do Something.org https://www.dosomething.org/us/facts/11-facts-about-pollution",
                          textAlign: TextAlign.left,
                          style: GoogleFonts.roboto(
                            textStyle: const TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.normal,
                            ),
                          )),
                    ],
                  ),
                ),

                //4th Image of Slider
                Container(
                  margin: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      opacity: 0.7,
                      image: NetworkImage(
                          "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.OjNHJL6A-Lzw_jLJfFgtMwHaEK%26pid%3DApi&f=1&ipt=9f19fe8349e515790867030de18da3ba6f4cae0548d5195b66004453fb7916d0&ipo=images"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 40,
                      ),
                      Text('did you know...',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.roboto(
                            textStyle: const TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                      SizedBox(
                        height: 60,
                      ),
                      Text(facts[2]["text"],
                          textAlign: TextAlign.center,
                          style: GoogleFonts.roboto(
                            textStyle: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          )),
                      SizedBox(
                        height: 200,
                      ),
                      Text(
                          "source: Do Something.org https://www.dosomething.org/us/facts/11-facts-about-pollution",
                          textAlign: TextAlign.left,
                          style: GoogleFonts.roboto(
                            textStyle: const TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.normal,
                            ),
                          )),
                    ],
                  ),
                ),
              ],

              //Slider Container properties
              //carousel Slider flutter
              options: CarouselOptions(
                height: 650.0,
                enlargeCenterPage: true,
                autoPlay: true,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: Duration(milliseconds: 1000),
                viewportFraction: 0.8,
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
                    .pushNamedAndRemoveUntil(dashboardRoute, (route) => false);
                break;
              case 1:
                Navigator.of(context)
                    .pushNamedAndRemoveUntil(dashboardRoute, (route) => false);
                break;
              case 2:
                Navigator.of(context)
                    .pushNamedAndRemoveUntil(dashboardRoute, (route) => false);
                break;
              case 3:
                Navigator.of(context)
                    .pushNamedAndRemoveUntil(dashboardRoute, (route) => false);
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
