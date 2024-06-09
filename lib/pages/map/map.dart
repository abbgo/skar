import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar/providers/pages/map.dart';
import 'package:skar/helpers/functions.dart';
import 'package:skar/pages/map/parts/location_permission.dart' as permission;
import 'package:skar/pages/map/parts/map.dart' as map;

class MapPage extends ConsumerWidget {
  const MapPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isLightBrightness = isLightTheme(context, ref);
    permissionHandler(ref);
    bool isLoading = ref.watch(loadProvider);
    bool hasPermission = ref.watch(locationPermissionProvider);

    return isLoading
        ? Center(
            child: Image.asset(
              isLightBrightness
                  ? 'assets/animated_icons/animated_map.gif'
                  : 'assets/animated_icons/animated_map_dark.gif',
            ),
          )
        : hasPermission
            ? const map.Map()
            : permission.LocationPermission(ref: ref);
  }
}
