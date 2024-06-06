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
    permissionHandler(ref);
    bool isLoading = ref.watch(loadProvider);
    bool hasPermission = ref.watch(locationPermissionProvider);

    return isLoading
        ? const Center(child: CircularProgressIndicator())
        : hasPermission
            ? map.Map()
            : permission.LocationPermission(ref: ref);
  }
}
