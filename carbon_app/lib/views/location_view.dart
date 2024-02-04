import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carbon_app/constants/color.dart';
import 'package:location/location.dart';

class LocationView extends StatefulWidget {
  const LocationView({super.key});

  @override
  State<LocationView> createState() => _LocationViewState();
}

class _LocationViewState extends State<LocationView> {
  int n = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: headerColor,
        foregroundColor: letterColor,
        title: Center(
          child: Text(
            'New Itinerary',
            style: GoogleFonts.montserrat(
              textStyle: const TextStyle(
                color: letterColor,
                fontSize: 40,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ),
      ),
      body: const GetItineraryButton(),
    );
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
            onPressed: () {
              LocationService().requestPermission();
              final currentLocation = LocationService().getCurrentLocation();
              print(currentLocation);
            },
            child: Text("Get Location"),
          )
        ],
      ),
    );
  }
}

class LocationService {
  Location location = Location();

  Future<bool> requestPermission() async {
    final permission = await location.requestPermission();
    return permission == PermissionStatus.granted;
  }

  Future<LocationData> getCurrentLocation() async {
    final serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      final result = await location.requestService();
      if (result) {
        print('Service has been enabled');
      } else {
        throw Exception('GPS service not enabled');
      }
    }
    final locationData = await location.getLocation();
    return locationData;
  }
}
