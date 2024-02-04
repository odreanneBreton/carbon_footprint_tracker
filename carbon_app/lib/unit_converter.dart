import "dart:math";

double haversineDistance(double lat1, double lon1, double lat2, double lon2) {
  const double earthRadius = 6371.0;

  double dLat = radians(lat2 - lat1);
  double dLon = radians(lon2 - lon1);

  double a = pow(sin(dLat / 2), 2) + cos(radians(lat1)) * cos(radians(lat2)) * pow(sin(dLon / 2), 2);
  double c = 2 * atan2(sqrt(a), sqrt(1 - a));

  double distance = earthRadius * c;
  return distance;
}

double radians(double degrees) {
  return degrees * (pi / 180);
}