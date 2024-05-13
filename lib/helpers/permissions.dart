import 'package:geolocator/geolocator.dart';

Future<bool> hasLocationPermission() async {
  LocationPermission permission = await Geolocator.checkPermission();

  if ((permission == LocationPermission.denied) ||
      (permission == LocationPermission.deniedForever)) {
    return false;
  }

  return permission == LocationPermission.always ||
      permission == LocationPermission.whileInUse;
}
