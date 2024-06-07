import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar/helpers/functions.dart';
import 'package:skar/providers/pages/map.dart';

class LocationButton extends ConsumerWidget {
  const LocationButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double bannerHeight = ref.watch(bannerHeightProvider);

    return AnimatedPositioned(
      bottom: bannerHeight == 0.25
          ? screenProperties(context).height * bannerHeight
          : screenProperties(context).height * 0.06,
      right: 5,
      duration: const Duration(milliseconds: 300),
      child: IconButton(
        onPressed: () => permissionHandler(ref),
        style: IconButton.styleFrom(
          backgroundColor: const Color(0xFFFE0002),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
        ),
        icon: const Icon(Icons.location_on_outlined, color: Colors.white),
      ),
    );
  }
}
