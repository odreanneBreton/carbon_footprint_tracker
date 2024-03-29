import 'package:carbon_app/unit_converter.dart';
import 'package:carbon_app/views/location_view.dart';
import 'package:csv/csv.dart';
import 'package:location/location.dart';
import 'package:flutter/services.dart' show rootBundle;

Future<List<List<dynamic>>> readCsv() async {
  final String csvString = await rootBundle.loadString('assets/GreenRide.csv');
  final List<List<dynamic>> csvTable = CsvToListConverter().convert(csvString);
  return csvTable;
}

Future<List?> getDistanceNearestMetro () async {
  List<List<dynamic>> csvTable = await readCsv();
  LocationData locationData = await LocationService().getCurrentLocation();
  double? currentLatitude = locationData.latitude;
  double? currentLongitude = locationData.longitude;
  List metroCoords = [];
  for (int i = 1; i < csvTable.length; i++) {
    metroCoords.add([csvTable[i][1], csvTable[i][3], csvTable[i][2]]); // (Station, longitude, latitude)
  }

  int i = 0;
  double distance = 0;
  String station = "";
  for (List tuple in metroCoords) {
    double newDistance = haversineDistance(currentLatitude!, currentLongitude!, tuple[2], tuple[1]) * 1000;
    if (i == 0) {
      distance = newDistance;
      i = 1;
    }
    if (newDistance <= distance) {
      distance = newDistance;
      station = tuple[0];
    }
  }
  List info = [station, distance];
  if (distance <= 100) {
      return info;
  } else{
    return null;
  }

}

double getRouteDistance(double latA, double lonA, double latB, double lonB) { // utiliser les currentLatitude et currentLongitude du point de depart
  double distance = haversineDistance(latA, lonA, latB, lonB) * 1000; // et du point d'arrivee comme parametres
  return distance;
}


