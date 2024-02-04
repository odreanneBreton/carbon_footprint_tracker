import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LocationView extends StatefulWidget {
  const LocationView({super.key});

  @override
  State<LocationView> createState() => _LocationViewState();
}

class _LocationViewState extends State<LocationView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 241, 255, 242),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 170, 255, 34),
        foregroundColor: Color.fromARGB(255, 0, 0, 0),
        title: Center(
          child: Text(
            'New Itinerary',
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
      body: const GetItineraryButton(),
    );
    throw UnimplementedError();
  }
}

class GetItineraryButton extends StatefulWidget {
  const GetItineraryButton({super.key});

  @override
  State<GetItineraryButton> createState() => _GetItineraryState();
}

class _GetItineraryState extends State<GetItineraryButton> {
  @override
  Widget build(BuildContext context) {
    final ButtonStyle style =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ElevatedButton(
            style: style,
            onPressed: () {},
            child: const Text('Get Location'),
          ),
        ],
      ),
    );
  }
}
