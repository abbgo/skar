import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:skar/helpers/functions.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LocationPermission extends StatelessWidget {
  const LocationPermission({super.key, required this.ref});

  final WidgetRef ref;

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
            Consumer(
              builder: (context, ref, child) {
                bool isLightBrightness = isLightTheme(context, ref);
                return Image.asset(
                  isLightBrightness
                      ? "assets/images/location_permission.jpeg"
                      : "assets/images/location_permission_dark.jpeg",
                  height: screenProperties(context).height * 0.3,
                );
              },
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
            ElevatedButton(
              onPressed: () async {
                await Geolocator.requestPermission()
                    .then((value) {})
                    .onError((error, stackTrace) {
                  if (kDebugMode) {
                    print("error: ${error.toString()}");
                  }
                });

                permissionHandler(ref);
              },
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  lang.allow,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
