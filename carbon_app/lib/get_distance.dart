import 'dart:math';

import 'package:carbon_app/views/location_view.dart';
import 'package:csv/csv.dart';
import 'package:location/location.dart';
import 'package:flutter/services.dart' show rootBundle;

Future<List<List<dynamic>>> readCsv() async {
  final String csvString = await rootBundle.loadString('assets/GreenRide.csv');
  final List<List<dynamic>> csvTable = CsvToListConverter().convert(csvString);
  return csvTable;
}

Future<List> getDistance () async {
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
    double x = currentLongitude! - tuple[1];
    double y = currentLatitude! - tuple[2];
    double newDistance = sqrt((pow(x, 2) + pow(y, 2)));
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
  return info;
}
