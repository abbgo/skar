import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:skar/helpers/functions.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:skar/providers/pages/map.dart';

class LocationPermission extends StatelessWidget {
  const LocationPermission({super.key, required this.mapController});

  final Completer<GoogleMapController> mapController;

  @override
  Widget build(BuildContext context) {
    var lang = AppLocalizations.of(context)!;

    return Center(
      child: SizedBox(
        width: screenProperties(context).width * 0.7,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/location_permission.jpeg",
              height: screenProperties(context).height * 0.3,
            ),
            Text(
              lang.locationPermission,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 10),
            Consumer(
              builder: (context, ref, child) {
                return ElevatedButton(
                  onPressed: () async {
                    await Geolocator.requestPermission()
                        .then((value) {})
                        .onError((error, stackTrace) {
                      if (kDebugMode) {
                        print("error: ${error.toString()}");
                      }
                    });

                    var markersNotifier = ref.read(markersProvider.notifier);
                    var loadNotifier = ref.read(loadProvider.notifier);
                    var locationPermissionNotifier =
                        ref.read(locationPermissionProvider.notifier);

                    permissionHandler(markersNotifier, loadNotifier,
                        locationPermissionNotifier, mapController);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      lang.allow,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
