import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:geolocator/geolocator.dart';

Future<bool> checkIntConn() async {
  final result = await (Connectivity().checkConnectivity());
  if (result == ConnectivityResult.mobile ||
      result == ConnectivityResult.wifi) {
    return true;
  }
  return false;
}

Future<bool> hasLocationPermission() async {
  LocationPermission permission = await Geolocator.checkPermission();

  if ((permission == LocationPermission.denied) ||
      (permission == LocationPermission.deniedForever)) {
    return false;
  }

  return permission == LocationPermission.always ||
      permission == LocationPermission.whileInUse;
}
