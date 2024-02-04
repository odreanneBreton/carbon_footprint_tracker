import 'package:carbon_app/constants/routes.dart';
import 'package:carbon_app/utilities/dialog.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carbon_app/constants/color.dart';
import 'package:location/location.dart';
import 'package:carbon_app/get_distance.dart';

class LocationView extends StatefulWidget {
  const LocationView({super.key});

  @override
  State<LocationView> createState() => _LocationViewState();
}

class _LocationViewState extends State<LocationView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: headerColor,
        foregroundColor: letterColor,
        title: Center(
          child: Text(
            'NEW ITINERARY',
            style: GoogleFonts.montserrat(
              textStyle: const TextStyle(
                color: letterColor,
                fontSize: 30,
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
  String txt = "";
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
            onPressed: () async {
              if (await LocationService().requestPermission()) {
                LocationData locationData =
                    await LocationService().getCurrentLocation();
                double? currentlatitude = locationData.latitude;
                double? currentlongitude = locationData.longitude;
                print("Location: $currentlatitude, $currentlongitude");
                List nearestStation = await getDistanceNearestMetro() ?? [];
                if (nearestStation == []) {
                  txt = "You are not in the metro!";
                  await showNoMetroDialog(context, txt);
                } else {
                  txt =
                      "Nearest Station : ${nearestStation[0]}, at ${nearestStation[1]} meters";
                  await showYesMetroDialog(context, txt);
                }
                _changeState();
              }
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
    bool serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        throw Exception("Location service not enabled");
      }
    }
    final locationData = await location.getLocation();
    return locationData;
  }
}
